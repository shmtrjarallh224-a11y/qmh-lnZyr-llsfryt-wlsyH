/**
 * MRZ (Machine Readable Zone) parser per ICAO 9303.
 * Handles TD3 (passport P<), TD2 (I<), and VISA (A<) formats.
 */

import type { MrzData } from './types.js';

const ICAO_WEIGHTS = [7, 3, 1];

function mrzChecksum(str: string): number {
  let sum = 0;
  for (let i = 0; i < str.length; i++) {
    const c = str[i];
    let val: number;
    if (c === '<') val = 0;
    else if (c >= '0' && c <= '9') val = parseInt(c, 10);
    else if (c >= 'A' && c <= 'Z') val = c.charCodeAt(0) - 55;
    else val = 0;
    sum += val * ICAO_WEIGHTS[i % 3];
  }
  return sum % 10;
}

function yymmddToDate(yymmdd: string): string {
  const yy = parseInt(yymmdd.slice(0, 2), 10);
  const mm = yymmdd.slice(2, 4);
  const dd = yymmdd.slice(4, 6);
  const currentYear = new Date().getFullYear();
  const century = yy + 2000 > currentYear + 10 ? 1900 : 2000;
  const year = century + yy;
  return `${year}-${mm}-${dd}`;
}

function parseName(nameField: string): { surname: string; givenNames: string } {
  const parts = nameField.split('<<');
  const surname = (parts[0] ?? '').replace(/</g, ' ').trim().replace(/\s+/g, ' ');
  const givenNames = (parts[1] ?? '').replace(/</g, ' ').trim().replace(/\s+/g, ' ');
  return { surname, givenNames };
}

/**
 * Normalize a candidate MRZ line to exactly targetLen characters.
 * Strips internal spaces, pads with '<' if too short, truncates if too long
 * within ±6 chars tolerance (handles common Tesseract over/under-reads).
 */
function normalizeMrzLine(line: string, targetLen: number): string | null {
  const cleaned = line.replace(/\s/g, '').toUpperCase();
  if (cleaned.length === targetLen) return cleaned;
  if (cleaned.length >= targetLen - 6 && cleaned.length <= targetLen + 6) {
    if (cleaned.length < targetLen) return cleaned.padEnd(targetLen, '<');
    return cleaned.slice(0, targetLen);
  }
  return null; // too far off to be a valid MRZ line
}

/** Extracts the raw MRZ lines from OCR text. Returns null if not found. */
export function detectMrzLines(ocrText: string): string[] | null {
  const rawLines = ocrText.split('\n');

  // TD3: two ~44-char lines (passports)
  const td3Candidates = rawLines
    .map(l => normalizeMrzLine(l, 44))
    .filter((l): l is string => l !== null && /^[A-Z0-9<]+$/.test(l));

  if (td3Candidates.length >= 2) {
    // Prefer pair where line1 starts with P (passport type)
    for (let i = 0; i < td3Candidates.length - 1; i++) {
      if (/^P[A-Z<]/.test(td3Candidates[i])) {
        return [td3Candidates[i], td3Candidates[i + 1]];
      }
    }
    // VISA
    for (let i = 0; i < td3Candidates.length - 1; i++) {
      if (/^V/.test(td3Candidates[i])) {
        return [td3Candidates[i], td3Candidates[i + 1]];
      }
    }
    // Fallback: return first two valid candidates
    return [td3Candidates[0], td3Candidates[1]];
  }

  // TD2: two ~36-char lines
  const td2Candidates = rawLines
    .map(l => normalizeMrzLine(l, 36))
    .filter((l): l is string => l !== null && /^[A-Z0-9<]+$/.test(l));

  if (td2Candidates.length >= 2) {
    for (let i = 0; i < td2Candidates.length - 1; i++) {
      if (/^[IAC<][A-Z<]/.test(td2Candidates[i])) {
        return [td2Candidates[i], td2Candidates[i + 1]];
      }
    }
    return [td2Candidates[0], td2Candidates[1]];
  }

  return null;
}

/** Parses two MRZ lines (TD3 format, 44 chars each) */
function parseTD3(lines: string[]): MrzData {
  const [line1, line2] = lines;

  const docType = line1.slice(0, 1);
  const issuingCountry = line1.slice(2, 5).replace(/</g, '');
  const nameField = line1.slice(5, 44);
  const { surname, givenNames } = parseName(nameField);

  const docNumber = line2.slice(0, 9).replace(/</g, '');
  const docNumberCheck = parseInt(line2.slice(9, 10), 10);
  const nationality = line2.slice(10, 13).replace(/</g, '');
  const dobRaw = line2.slice(13, 19);
  const dobCheck = parseInt(line2.slice(19, 20), 10);
  const sex = line2.slice(20, 21);
  const expiryRaw = line2.slice(21, 27);
  const expiryCheck = parseInt(line2.slice(27, 28), 10);
  const compositeField = line2.slice(0, 10) + line2.slice(13, 20) + line2.slice(21, 43);
  const compositeCheck = parseInt(line2.slice(43, 44), 10);

  const checksumValid =
    mrzChecksum(line2.slice(0, 9)) === docNumberCheck &&
    mrzChecksum(dobRaw) === dobCheck &&
    mrzChecksum(expiryRaw) === expiryCheck &&
    mrzChecksum(compositeField) === compositeCheck;

  return {
    raw: lines.join('\n'),
    type: docType,
    issuingCountry,
    surname,
    givenNames,
    documentNumber: docNumber,
    nationality,
    dateOfBirth: yymmddToDate(dobRaw),
    sex,
    expiryDate: yymmddToDate(expiryRaw),
    checksumValid,
  };
}

/** Parses two MRZ lines (TD2 format, 36 chars each) */
function parseTD2(lines: string[]): MrzData {
  const [line1, line2] = lines;
  const docType = line1.slice(0, 1);
  const issuingCountry = line1.slice(2, 5).replace(/</g, '');
  const nameField = line1.slice(5, 36);
  const { surname, givenNames } = parseName(nameField);
  const docNumber = line2.slice(0, 9).replace(/</g, '');
  const docNumberCheck = parseInt(line2.slice(9, 10), 10);
  const nationality = line2.slice(10, 13).replace(/</g, '');
  const dobRaw = line2.slice(13, 19);
  const dobCheck = parseInt(line2.slice(19, 20), 10);
  const sex = line2.slice(20, 21);
  const expiryRaw = line2.slice(21, 27);
  const expiryCheck = parseInt(line2.slice(27, 28), 10);

  const checksumValid =
    mrzChecksum(line2.slice(0, 9)) === docNumberCheck &&
    mrzChecksum(dobRaw) === dobCheck &&
    mrzChecksum(expiryRaw) === expiryCheck;

  return {
    raw: lines.join('\n'),
    type: docType,
    issuingCountry,
    surname,
    givenNames,
    documentNumber: docNumber,
    nationality,
    dateOfBirth: yymmddToDate(dobRaw),
    sex,
    expiryDate: yymmddToDate(expiryRaw),
    checksumValid,
  };
}

/**
 * Detect and parse MRZ from OCR text.
 * Returns null if no MRZ found.
 */
export function parseMrz(ocrText: string): MrzData | null {
  const lines = detectMrzLines(ocrText);
  if (!lines || lines.length < 2) return null;

  if (lines[0].length === 44) return parseTD3(lines);
  if (lines[0].length === 36) return parseTD2(lines);
  return null;
}
