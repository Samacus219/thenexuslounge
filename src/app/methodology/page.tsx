'use client';
import Link from 'next/link';
import { motion } from 'framer-motion';

export default function MethodologyPage() {
  const steps = [
    {
       step: "01",
       title: "Semantic Intake",
       description: "We don't just process text; we interpret the social intent. Nova considers the mood, the group size, and the unspoken standards of your circle."
    },
    {
       step: "02",
       title: "The Consensus Engine",
       description: "Instead of back-and-forth messaging, Nova generates a unified 'Consensus Map'. One vote, and the path is rendered."
    },
    {
       step: "03",
       title: "Guardian Monitoring",
       description: "Real-time edge telemetry. Flight delays, traffic swells, even weather shifts in Tokyo are monitored to ensure your transit is never interrupted."
    }
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
          <div className="text-xs uppercase tracking-[0.5em] text-champagne">Nova Engine Architecture</div>
          <h1 className="serif text-6xl md:text-8xl">The Methodology of <br/> <span className="italic">Foresight</span></h1>
          <p className="text-xl md:text-2xl font-light text-white/50 leading-relaxed max-w-2xl">
            Nexus operates on a system of anticipatory curation. We have weaponized time by removing the friction of planning, 
            replacing it with the elegance of autonomous execution.
          </p>
        </motion.div>

        {/* 🧠 THE "STITCHED" AI BACKDROP */}
        <div className="relative h-[600px] w-full glass rounded-sm overflow-hidden p-1 shadow-2xl">
           <img 
              src="/assets/nova-bg.png" 
              alt="Nova Sentient Architecture" 
              className="w-full h-full object-cover opacity-60 hover:scale-105 transition-transform duration-[20s]"
           />
           <div className="absolute inset-0 bg-gradient-to-t from-black via-transparent to-black/40" />
           <div className="absolute inset-0 flex items-center justify-center">
              <div className="text-center space-y-4">
                 <div className="serif text-champagne text-4xl italic text-shadow-gold">SENTIENT ENGINE v1.0</div>
                 <div className="text-[10px] tracking-[0.5em] text-white/40 uppercase">A Gaia-Class Intelligence Layer</div>
              </div>
           </div>
        </div>

        {/* 🛠️ PROCESS GRID */}
        <div className="grid md:grid-cols-3 gap-20 py-24">
           {steps.map((item, i) => (
             <motion.div
               key={item.step}
               initial={{ opacity: 0, x: -20 }}
               animate={{ opacity: 1, x: 0 }}
               transition={{ delay: i * 0.3, duration: 1 }}
               className="space-y-8"
             >
                <div className="serif text-5xl text-champagne/10">{item.step}</div>
                <h2 className="serif text-3xl text-champagne">{item.title}</h2>
                <p className="text-white/40 font-light leading-relaxed">{item.description}</p>
             </motion.div>
           ))}
        </div>
      </section>

      {/* 🤝 PARTNER SECTION: THE CONDUIT */}
      <section className="bg-black py-48 border-t border-white/5">
         <div className="max-w-4xl mx-auto text-center px-8 space-y-16">
            <h3 className="serif text-4xl">Technological Conduits</h3>
            <p className="font-light text-white/50 leading-loose text-lg">
               Nexus does not compete with global hospitality brands; we enhance them. 
               By acting as a tech-enabled conduit for the Agoda, Expedia, and Blacklane networks, 
               we provide the digital intelligence that transforms a simple booking into an elite experience.
            </p>
         </div>
      </section>
    </main>
  );
}
