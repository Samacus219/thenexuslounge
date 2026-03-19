'use client';
import Link from 'next/link';
import { motion } from 'framer-motion';

export default function LoungePage() {
  const features = [
    { name: "Social Consensus", desc: "The 'Drop Box' for travel ideas. Your group drops a thought, Nova curates the options, and everyone votes in one seamless interface." },
    { name: "The Vault", desc: "Biometric-secured split payments. No more checking Venmo. Split the villa, the jet, and the table instantly." },
    { name: "Guardian Edge", desc: "The sentient 'Guardian' that dispatch transits and monitors flight telemetry for the whole circle." }
  ];

  return (
    <main className="min-h-screen luxury-gradient text-white">
      {/* 🚀 NAV */}
      <nav className="fixed top-0 w-full z-50 glass px-8 py-6 flex justify-between items-center">
        <Link href="/" className="serif text-2xl tracking-[0.4em] text-champagne">N E X U S</Link>
        <Link href="/" className="text-xs uppercase tracking-widest text-white/50 hover:text-white transition-colors">Return</Link>
      </nav>

      <section className="pt-48 pb-20 px-8 max-w-7xl mx-auto space-y-24">
        <motion.div
           initial={{ opacity: 0, y: 20 }}
           animate={{ opacity: 1, y: 0 }}
           transition={{ duration: 1 }}
           className="max-w-4xl space-y-8"
        >
          <div className="text-xs uppercase tracking-[0.5em] text-champagne">The Social Operating System</div>
          <h1 className="serif text-6xl md:text-8xl italic">The Social <br/> <span className="not-italic">Lounge</span></h1>
          <p className="text-xl md:text-2xl font-light text-white/50 leading-relaxed max-w-2xl">
            Nexus isn&apos;t just a mobile app; it&apos;s a **Shared Social Brain**. We built the Lounge to 
            replace fragmented group chats with **Consensus Power**.
          </p>
        </motion.div>

        {/* 🥂 CINEMATIC GROUP SOCIAL BACKDROP */}
        <div className="relative h-[600px] w-full glass rounded-sm overflow-hidden p-1 shadow-2xl group">
           <img 
              src="/assets/lounge-fun-bg.png" 
              alt="Nexus Elite Social Lounge" 
              className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-[20s]"
           />
           <div className="absolute inset-0 bg-gradient-to-t from-black via-transparent to-black/10" />
           <div className="absolute top-12 left-12 flex items-center space-x-6">
              <div className="h-3 w-3 bg-champagne rounded-full animate-ping" />
              <div className="serif text-white/80 text-xl italic tracking-widest text-shadow-gold">SOCIAL SYNERGY ACTIVE</div>
           </div>
           <div className="absolute bottom-12 left-12 max-w-md">
              <p className="text-white/80 font-light leading-relaxed italic border-l-2 border-champagne pl-6">
                "Where the elite gather to celebrate, Nova handles the rest."
              </p>
           </div>
        </div>

        {/* 📱 FEATURE GRID */}
        <div className="grid md:grid-cols-3 gap-12 py-20 border-t border-white/5">
           {features.map((item, i) => (
             <motion.div
               key={item.name}
               initial={{ opacity: 0, scale: 0.95 }}
               whileInView={{ opacity: 1, scale: 1 }}
               transition={{ delay: i * 0.2 }}
               className="glass p-12 space-y-8 hover:border-champagne/40 transition-all text-center"
             >
                <div className="space-y-4">
                   <h2 className="serif text-3xl text-champagne">{item.name}</h2>
                </div>
                <p className="text-white/40 font-light leading-relaxed text-sm">{item.desc}</p>
             </motion.div>
           ))}
        </div>

        {/* 🏙️ THE "CONSENSUS" INTERFACE PREVIEW */}
        <div className="grid lg:grid-cols-2 gap-24 items-center">
           <div className="space-y-12">
              <div className="text-xs uppercase tracking-[0.5em] text-champagne">Interface Concept</div>
              <h2 className="serif text-4xl md:text-5xl">The <span className="italic">Consensus</span> <br/> Dashboard</h2>
              <p className="text-white/40 font-light leading-loose text-lg">
                Your circle&apos;s travel ideas don&apos;t live in a text thread. They are dropped into 
                the **Nexus Dropbox**. Nova immediately architected 3 elite alternatives for 
                the group to vote on. No decisions. Just consensus.
              </p>
           </div>
           <div className="glass p-2 rounded-2xl relative">
              <img src="/assets/mobile-onboarding.png" alt="Mobile Entry" className="rounded-xl w-full" />
              <div className="absolute inset-0 bg-gradient-to-t from-black/20 to-transparent" />
           </div>
        </div>
      </section>
    </main>
  );
}
