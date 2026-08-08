// app/api/_express/route.ts
import { NextResponse } from 'next/server';
import { createServer } from 'http';
import serverless from 'serverless-http';

// Lazy-load the compiled Express app to avoid build-time issues.
let handler: any = null;

async function getHandler() {
  if (handler) return handler;
  const mod = await import('../../../artifacts/api-server/dist/index.mjs');
  const app = mod.default;
  handler = serverless(app);
  return handler;
}

export async function GET(req: Request) {
  const h = await getHandler();
  // serverless-http expects Node-style req/res; we can't easily adapt —
  // As a minimal shim, proxy the request to the handler via fetch to localhost
  // is not possible in Next edge/runtime; this file will only work in Node.
  return NextResponse.json({ error: 'Not implemented in this migration shim.' }, { status: 500 });
}
