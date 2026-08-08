import Head from "next/head";

export default function Home() {
  return (
    <>
      <Head>
        <title>Next.js + TypeScript App</title>
        <meta name="description" content="Minimal Next.js + TypeScript app" />
      </Head>

      <main style={{ padding: 24, fontFamily: "system-ui, -apple-system, 'Segoe UI', Roboto" }}>
        <h1>Welcome</h1>
        <p>This repository now contains a minimal Next.js + TypeScript application.</p>
        <p>Run <code>npm install</code> and then <code>npm run dev</code>.</p>
      </main>
    </>
  );
}
