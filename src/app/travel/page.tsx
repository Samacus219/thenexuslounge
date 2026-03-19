'use client';
import Link from 'next/link';
import { motion } from 'framer-motion';

export default function TravelPage() {
  const journeys = [
    { name: "Private Wings", cat: "Aviation", desc: "Access the world's most exclusive private jet network. From Gulfstreams to Global Expresses, Nova curates the flight path so you can focus on the destination." },
    { name: "Ocean Escapes", cat: "Maritime", desc: "Private superyacht charters in the Mediterranean and the Caribbean. Fully serviced, fully provisioned, and ready for your circle." },
    { name: "The Grand Vista", cat: "Luxury Land", desc: "A bespoke journey through the most remote and beautiful landscapes on Earth. 24/7 Guardian monitoring included." }
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
          <div className="text-xs uppercase tracking-[0.5em] text-champagne">Unfettered Exploration</div>
          <h1 className="serif text-6xl md:text-8xl italic text-shadow-gold">Elite <br/> <span className="not-italic">Expeditions</span></h1>
          <p className="text-xl md:text-2xl font-light text-white/50 leading-relaxed max-w-2xl">
            Nexus Travel replaces the word &quot;Booking&quot; with &quot;Curation&quot;. No portals, no logins, no friction. 
            Just drop your destination into the Lounge and let Nova architect the journey.
          </p>
        </motion.div>

        {/* ✈️ CINEMATIC PRIVATE JET SOCIAL BACKDROP */}
        <div className="relative h-[650px] w-full glass rounded-sm overflow-hidden p-1 shadow-2xl group">
           <img 
              src="/assets/travel-bg.png" 
              alt="Elite Social Travel Experience" 
              className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-[25s]"
           />
           <div className="absolute inset-0 bg-gradient-to-t from-black via-transparent to-black/10" />
           <div className="absolute top-12 left-12 flex items-center space-x-6">
              <div className="h-3 w-3 bg-champagne rounded-full animate-ping" />
              <div className="serif text-white/80 text-xl md:text-2xl italic tracking-widest text-shadow-gold text-right uppercase">Private Flight Consensus Shared</div>
           </div>
           <div className="absolute bottom-12 left-12 max-w-md bg-black/40 backdrop-blur-md p-8 border-l-4 border-champagne">
              <p className="text-white/90 font-light leading-relaxed italic text-lg">
                &quot;The finest journeys are shared without the burden of logistics.&quot;
              </p>
           </div>
        </div>

        {/* 🛳️ JOURNEY GRID */}
        <div className="grid md:grid-cols-3 gap-12 py-20 border-t border-white/5 px-4 md:px-0">
           {journeys.map((item, i) => (
             <motion.div
               key={item.name}
               initial={{ opacity: 0, y: 40 }}
               whileInView={{ opacity: 1, y: 0 }}
               transition={{ delay: i * 0.2 }}
               className="glass p-12 space-y-8 hover:border-champagne/40 transition-all group relative overflow-hidden"
             >
                <div className="absolute -right-8 -bottom-8 opacity-5 font-serif text-8xl italic champagne-glow">0{i+1}</div>
                <div className="space-y-4">
                   <div className="text-[10px] tracking-[0.5em] text-champagne uppercase font-bold">{item.cat}</div>
                   <h2 className="serif text-3xl text-white/95">{item.name}</h2>
                </div>
                <p className="text-white/40 font-light leading-relaxed text-sm">{item.desc}</p>
             </motion.div>
           ))}
        </div>

        {/* 🗺️ THE "AGENTIC" TRAVEL PROMISE */}
        <div className="flex flex-col lg:flex-row gap-24 items-center py-20 bg-black/50 p-12 lg:p-24 rounded-sm border border-white/5 shadow-inner">
           <div className="lg:w-1/2 space-y-12">
              <h3 className="serif text-4xl italic">Agentic Expeditions</h3>
              <p className="text-white/40 max-w-xl font-light leading-loose text-lg">
                Nexus doesn&apos;t just book a jet; we build an end-to-end corridor of peace. 
                Your limousine is synchronized to the flight arrival, your favorite champagne 
                is already at the villa, and the Guardian monitoring has already 
                vetted the hospital and embassy locations at your destination.
              </p>
           </div>
           <div className="lg:w-1/2 relative group">
              <div className="absolute -inset-8 bg-champagne/5 blur-[80px] rounded-full" />
              <div className="glass p-1 rounded-sm shadow-2xl relative translate-y-[-20px] lg:translate-y-0 shadow-gold group-hover:scale-105 transition-transform duration-700">
                <img src="/assets/mobile-archive.png" alt="Travel Archive Preview" className="rounded-sm" />
              </div>
           </div>
        </div>
      </section>
    </main>
  );
}
