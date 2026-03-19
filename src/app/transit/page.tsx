'use client';
import Link from 'next/link';
import { motion } from 'framer-motion';

export default function TransitPage() {
  const fleet = [
    { name: "Executive Sedan", tier: "Blacklane Elite", desc: "For the minimalist traveler. Perfect for private airport transfers and inner-city transit." },
    { name: "Luxe Sprinter", tier: "Group Transit", desc: "Full-standing height, Wi-Fi, and a private cabin for circle consensus on the move." },
    { name: "Armored Vanguard", tier: "High-Tier Security", desc: "B6/B7 armored protection with a professional security detail for high-risk zones." }
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
          <div className="text-xs uppercase tracking-[0.5em] text-champagne">Elite Mobility</div>
          <h1 className="serif text-6xl md:text-8xl italic">Seamless <br/> <span className="not-italic">Transit</span></h1>
          <p className="text-xl md:text-2xl font-light text-white/50 leading-relaxed max-w-2xl">
            Nexus Transit is powered by **Blacklane** and a vetted network of global chauffeur services. 
            We replace 'ride-hailing' with 'pre-emptive mobility'.
          </p>
        </motion.div>

        {/* 🏙️ CINEMATIC FLEET BACKDROP */}
        <div className="relative h-[500px] w-full glass rounded-sm overflow-hidden p-1 shadow-2xl">
           <img 
              src="/assets/transit-bg.png" 
              alt="Elite Transit Fleet" 
              className="w-full h-full object-cover opacity-60 transition-transform duration-[20s] hover:scale-105"
           />
           <div className="absolute inset-0 bg-gradient-to-t from-black via-transparent to-black/20" />
           <div className="absolute bottom-12 left-12 flex items-center space-x-6">
              <div className="h-2 w-2 bg-champagne rounded-full animate-pulse" />
              <div className="serif text-white/80 text-xl md:text-2xl italic tracking-widest text-shadow-gold text-right">GLOBAL CHAUFFEUR NETWORK ACTIVE</div>
           </div>
        </div>

        {/* 🚘 FLEET GRID */}
        <div className="grid md:grid-cols-3 gap-12 py-20 border-t border-white/5">
           {fleet.map((item, i) => (
             <motion.div
               key={item.name}
               initial={{ opacity: 0, y: 20 }}
               animate={{ opacity: 1, y: 0 }}
               transition={{ delay: i * 0.2, duration: 0.8 }}
               className="glass p-12 space-y-8 hover:border-champagne/40 transition-all duration-500 group"
             >
                <div className="space-y-4">
                   <div className="text-[10px] tracking-[0.5em] text-champagne uppercase">{item.tier}</div>
                   <h2 className="serif text-3xl text-white/90">{item.name}</h2>
                </div>
                <p className="text-white/40 font-light leading-relaxed text-sm">{item.desc}</p>
             </motion.div>
           ))}
        </div>

        {/* ⚖️ THE "GUARDIAN" PROMISE */}
        <div className="bg-black p-20 text-center space-y-12">
           <h3 className="serif text-3xl italic">The Guardian Protocol</h3>
           <p className="text-white/40 max-w-xl mx-auto font-light leading-loose">
              Before your flight leaves the ground, your chauffeur is already in the terminal buffer. 
              Nova monitors real-time traffic swells and flight delays, adjusting your pickup 
              to ensure the 'Final Mile' is the most peaceful part of your journey.
           </p>
        </div>
      </section>
    </main>
  );
}
