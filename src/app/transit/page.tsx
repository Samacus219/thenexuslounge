'use client';
import Link from 'next/link';
import { motion } from 'framer-motion';

export default function TransitPage() {
  const tiers = [
     { name: "Final Mile Sync", cat: "Automated Dispatch", desc: "No more waiting for the car. Nova synchronizes with your flight arrival or event departure to ensure your driver is idling exactly when you step onto the sidewalk." },
     { name: "Private Chauffeur", cat: "Luxury Fleets", desc: "Access to the world's most elite fleets. From Mercedes S-Class to bespoke Sprinter lounges, all fully vetted and fully integrated into the Guardian." },
     { name: "Air-to-Ground", cat: "Helicopter Triage", desc: "Direct helicopter-to-sedan transitions. Nova manages the hangar access and flight-path logic for seamless urban mobility." }
  ];

  return (
    <main className="min-h-screen luxury-gradient text-white">
      {/* 🚀 NAV */}
      <nav className="fixed top-0 w-full z-50 glass px-8 py-6 flex justify-between items-center">
        <Link href="/" className="serif text-2xl tracking-[0.4em] text-champagne">N E X U S</Link>
        <Link href="/" className="text-xs uppercase tracking-widest text-white/50 hover:text-white transition-colors">Return</Link>
      </nav>

      {/* 🏙️ HERO: The Final Mile */}
      <section className="relative h-[80vh] flex flex-col items-center justify-center text-center px-4 overflow-hidden pt-20">
        <div className="absolute inset-x-4 inset-y-20 z-0 glass border border-white/5 rounded-2xl overflow-hidden shadow-2xl">
           <img 
              src="/assets/transit-hero-sharp.png" 
              alt="Elite Urban Transit" 
              className="w-full h-full object-cover brightness-75 hover:scale-105 transition-transform duration-[20s]" 
           />
           <div className="absolute inset-0 bg-gradient-to-t from-black via-black/20 to-transparent" />
        </div>
        
        <motion.div 
           initial={{ opacity: 0, y: 30 }}
           animate={{ opacity: 1, y: 0 }}
           className="relative z-10 space-y-6 max-w-4xl pt-40"
        >
           <div className="text-[10px] tracking-[1em] text-champagne uppercase font-bold italic">High-Performance Urban Mobility</div>
           <h1 className="serif text-6xl md:text-9xl italic leading-tight text-shadow-gold italic">Elite <br/> <span className="not-italic font-bold">Transit</span></h1>
        </motion.div>
      </section>

      {/* 🏎️ SECTION: TRANSIT SYNC (THE UI PREVIEW) */}
      <section className="py-48 px-8 max-w-7xl mx-auto space-y-48">
        <div className="flex flex-col lg:flex-row gap-24 items-center">
            <div className="lg:w-1/2 space-y-12">
               <div className="text-xs uppercase tracking-[0.5em] text-champagne font-bold italic">The Final Mile</div>
               <h2 className="serif text-5xl md:text-8xl leading-tight text-shadow-gold">Zero <br/> <span className="italic italic leading-tight">Wait</span></h2>
               <p className="text-xl font-light text-white/50 leading-relaxed max-w-xl italic border-l-2 border-champagne pl-6">
                 &quot;The finest transit is the one you never have to think about.&quot;
               </p>
               <p className="text-xl font-light text-white/50 leading-relaxed max-w-xl">
                 Nexus manages the transition from your jet, yacht, or estate to the next social destination. 
                 Nova uses real-time telemetry to dispatch **Uber Black** or **Private Drivers** exactly 4 minutes 
                 before your arrival.
               </p>
               <div className="space-y-8 pt-12 border-t border-white/5 uppercase">
                  <div className="flex items-center space-x-6 text-[10px] tracking-[0.4em] text-white/40">
                     <span className="text-champagne font-bold">Protocol:</span> Arrival • Sentinel • Dispatch
                  </div>
                  <div className="flex items-center space-x-6 text-[10px] tracking-[0.4em] text-white/40">
                     <span className="text-champagne font-bold">Response:</span> Under 120 Seconds
                  </div>
               </div>
            </div>
            
            <motion.div 
               initial={{ opacity: 0, scale: 0.95 }}
               whileInView={{ opacity: 1, scale: 1 }}
               className="lg:w-1/2"
            >
               <div className="glass p-1 rounded-2xl shadow-2xl relative border border-white/10 group overflow-hidden shadow-gold">
                  <img src="/assets/transit-ui-sharp.png" alt="Transit Sync UI Dashboard" className="rounded-xl w-full h-full object-cover group-hover:scale-105 transition-transform duration-[12s]" />
                  <div className="absolute inset-x-0 bottom-0 bg-gradient-to-t from-black via-transparent to-transparent h-1/3" />
                  <div className="absolute bottom-12 left-12 serif text-white/90 text-2xl italic tracking-widest text-shadow-gold font-bold italic italic">Transit Handshake v1.0</div>
               </div>
            </motion.div>
        </div>

        {/* 🚗 TRANSIT TIER GRID */}
        <div className="grid md:grid-cols-3 gap-12 py-20 border-t border-white/5">
           {tiers.map((item, i) => (
             <motion.div
               key={item.name}
               initial={{ opacity: 0, y: 40 }}
               whileInView={{ opacity: 1, y: 0 }}
               transition={{ delay: i * 0.2 }}
               className="glass p-12 space-y-8 hover:border-champagne/40 transition-all transition-duration-700 group relative overflow-hidden"
             >
                <div className="absolute -right-8 -bottom-8 opacity-5 font-serif text-8xl italic champagne-glow">TRANSIT</div>
                <div className="space-y-4">
                   <div className="text-[10px] tracking-[0.5em] text-champagne uppercase font-bold italic">{item.cat}</div>
                   <h2 className="serif text-3xl text-white/95">{item.name}</h2>
                </div>
                <p className="text-white/40 font-light leading-relaxed text-sm italic">{item.desc}</p>
             </motion.div>
           ))}
        </div>
      </section>
    </main>
  );
}
