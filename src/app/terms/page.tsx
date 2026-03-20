'use client';
import Link from 'next/link';

export default function TermsPage() {
  const sections = [
    { title: "The Membership Pledge", content: "Nexus is a private agency of pre-emption. By entering the Lounge, you authorize the Nexus Guardian to monitor your transit telemetry for your group's safety." },
    { title: "The Vault Privacy", content: "Your sensitive documents (Passports, Visas, Health Cards) are encrypted and stored in the Nexus Private Vault. No humans access your data unless authorized by your biometric signature." },
    { title: "Affiliate & Partner Logic", content: "Nexus Stays and Travel may route through Agoda, Expedia, or private charter providers. Nexus acts as the agentic layer of curation and security; our partners provide the physical infrastructure." },
    { title: "The Ethical Guardian", content: "The Guardian protocol is designed for protection, not surveillance. Your data is deleted 48 hours after your group's arrival at the final destination." }
  ];

  return (
    <main className="min-h-screen luxury-gradient text-white">
      {/* 🚀 NAV */}
      <nav className="fixed top-0 w-full z-50 glass px-8 py-6 flex justify-between items-center">
        <Link href="/" className="serif text-2xl tracking-[0.4em] text-champagne">N E X U S</Link>
        <Link href="/" className="text-xs uppercase tracking-widest text-white/50 hover:text-white transition-colors">Return</Link>
      </nav>

      <section className="pt-48 pb-20 px-8 max-w-4xl mx-auto space-y-24">
        <header className="space-y-8">
           <div className="text-xs uppercase tracking-[0.5em] text-champagne font-bold italic">The Social Charter</div>
           <h1 className="serif text-6xl md:text-8xl italic">Terms of <br/> <span className="not-italic">Service</span></h1>
           <p className="text-white/40 font-light italic text-xl border-l-2 border-champagne pl-6">
              &quot;The most precious luxury is the clarity of trust.&quot;
           </p>
        </header>

        <article className="space-y-24 text-white/60">
           {sections.map((sec, i) => (
             <div key={sec.title} className="space-y-8 border-t border-white/5 pt-12">
                <div className="text-[10px] tracking-[0.5em] text-champagne uppercase font-bold italic">0{i+1} • {sec.title}</div>
                <p className="font-light leading-loose text-lg max-w-2xl">{sec.content}</p>
             </div>
           ))}
        </article>

        <footer className="pt-24 border-t border-white/5 space-y-8 text-center opacity-30">
           <p className="text-xs font-light tracking-widest">© 2026 NEXUS CONCIERGE • BANGKOK HQ</p>
        </footer>
      </section>
    </main>
  );
}
