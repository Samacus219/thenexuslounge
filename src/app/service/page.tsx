'use client';
import Link from 'next/link';
import { motion } from 'framer-motion';

export default function LoungePage() {
  const steps = [
    { title: "The Drop Box", desc: "Your group drops a thought, an idea, or a specific villa link. Nova captures the vibe and architectural intent instantly." },
    { title: "Sentient Curation", desc: "The AI triages the idea against your group history, logistics, and real-time elite availability in Bangkok or beyond." },
    { title: "Visual Consensus", desc: "The group votes on a custom-built masonry menu. Logic replaces arguments. Curation replaces planning." }
  ];

  return (
    <main className="min-h-screen luxury-gradient text-white">
      {/* 🚀 NAV */}
      <nav className="fixed top-0 w-full z-50 glass px-8 py-6 flex justify-between items-center">
        <Link href="/" className="serif text-2xl tracking-[0.4em] text-champagne">N E X U S</Link>
        <Link href="/" className="text-xs uppercase tracking-widest text-white/50 hover:text-white transition-colors">Return</Link>
      </nav>

      {/* 🥂 HERO: The Lounge Lifestyle */}
      <section className="relative h-[80vh] flex flex-col items-center justify-center text-center px-4 overflow-hidden pt-20">
        <div className="absolute inset-x-4 inset-y-20 z-0 glass border border-white/5 rounded-2xl overflow-hidden shadow-2xl">
           <img 
              src="/assets/lounge-hero-sharp.png" 
              alt="Elite Social Celebration" 
              className="w-full h-full object-cover brightness-75 hover:scale-105 transition-transform duration-[20s]" 
           />
           <div className="absolute inset-0 bg-gradient-to-t from-black via-black/20 to-transparent" />
        </div>
        
        <motion.div 
           initial={{ opacity: 0, y: 30 }}
           animate={{ opacity: 1, y: 0 }}
           className="relative z-10 space-y-6 max-w-4xl pt-40"
        >
           <div className="text-[10px] tracking-[1em] text-champagne uppercase font-bold italic">The Social Heart</div>
           <h1 className="serif text-6xl md:text-9xl italic leading-tight">Elite <br/> <span className="not-italic">Lounge</span></h1>
        </motion.div>
      </section>

      {/* 💎 SECTION: SOCIAL CONSENSUS (THE ENGINE) */}
      <section className="py-48 px-8 max-w-7xl mx-auto space-y-32">
        <div className="flex flex-col lg:flex-row gap-24 items-center">
            <div className="lg:w-1/2 space-y-12">
               <div className="text-xs uppercase tracking-[0.5em] text-champagne">The Consensus Engine</div>
               <h2 className="serif text-5xl md:text-8xl italic">Friction <br/> <span className="not-italic">Zero</span></h2>
               <p className="text-xl font-light text-white/50 leading-relaxed max-w-xl">
                 Planning for a group is flawed by default. Nexus replaces &quot;Chat Overload&quot; 
                 with a sentient voting system. Your group arrives at the villa, the meal, 
                 or the jet through collective desire—not logistical exhaust.
               </p>
               <div className="space-y-12 pt-12 border-t border-white/5">
                  {steps.map((step, i) => (
                    <div key={step.title} className="flex gap-8 group">
                       <span className="serif text-2xl text-champagne opacity-40 group-hover:opacity-100 transition-all transition-duration-500">0{i+1}</span>
                       <div className="space-y-4">
                          <h3 className="serif text-2xl text-white/95">{step.title}</h3>
                          <p className="text-sm text-white/40 leading-loose italic">{step.desc}</p>
                       </div>
                    </div>
                  ))}
               </div>
            </div>
            
            <motion.div 
               initial={{ opacity: 0, x: 20 }}
               whileInView={{ opacity: 1, x: 0 }}
               className="lg:w-1/2"
            >
               <div className="glass p-1 rounded-2xl shadow-2xl relative border border-white/10 group overflow-hidden shadow-gold">
                  <img src="/assets/consensus-ui-sharp.png" alt="Social Consensus Logic UI" className="rounded-xl w-full h-full object-cover group-hover:scale-110 transition-transform duration-[15s]" />
                  <div className="absolute inset-x-0 bottom-0 bg-gradient-to-t from-black/60 via-transparent to-transparent h-1/3" />
                  <div className="absolute bottom-12 left-12 serif text-white/90 text-2xl italic tracking-widest text-shadow-gold italic font-bold">Consensus Alert v1.0</div>
               </div>
            </motion.div>
        </div>

        {/* 🏰 SECTION: THE SOCIAL VAULT (SPLIT PAYMENTS) */}
        <div className="flex flex-col-reverse lg:flex-row gap-32 pt-48 items-center border-t border-white/5">
           <div className="lg:w-1/2 relative group">
              <div className="absolute -inset-10 bg-champagne/5 blur-[120px] rounded-full animate-pulse" />
              <div className="glass p-2 rounded-2xl relative shadow-2xl group-hover:scale-105 transition-transform duration-700">
                <img src="/assets/mobile-vault.png" alt="Biometric Vault Split" className="rounded-xl w-full" />
                <div className="absolute inset-x-0 bottom-0 bg-gradient-to-t from-black via-black/20 to-transparent h-1/2" />
                <div className="absolute bottom-8 left-8 text-[10px] tracking-widest text-champagne uppercase font-bold italic">Vault Handshake v1.0 • Secure API</div>
              </div>
           </div>
           <div className="lg:w-1/2 space-y-12">
              <div className="text-xs uppercase tracking-[0.5em] text-champagne">Financial Sanctuary</div>
              <h2 className="serif text-5xl md:text-8xl italic leading-tight">Shared <br/> <span className="not-italic">Wealth</span></h2>
              <p className="text-xl font-light text-white/50 leading-relaxed">
                The most awkward part of elite social travel is the split. Nova handles 
                the math, the currency exchange, and the biometric split payments instantly. 
                Pay for the villa, the chef, and the transit before the first drink is poured.
              </p>
              <div className="flex items-center space-x-8 pt-8">
                 <div className="h-2 w-2 bg-champagne rounded-full animate-ping" />
                 <span className="text-[10px] tracking-[0.3em] uppercase text-white/40">Biometric Encryption Active</span>
              </div>
           </div>
        </div>
      </section>
    </main>
  );
}
