'use client';
import Link from 'next/link';
import { motion } from 'framer-motion';

export default function DiningPage() {
  const experiences = [
    { name: "Omakase Masterclass", loc: "Ginza, Tokyo", desc: "A 22-course journey through the deepest traditions of sushi, secured via our exclusive Ginza relationship network." },
    { name: "Rooftop Resonance", loc: "Bangkok, Thailand", desc: "Private sunset tables at the world's most exclusive skyline lounges, synchronized with your arrival time via the Guardian." },
    { name: "Alpine Gastronomy", loc: "Courchevel, France", desc: "Michelin-starred dining on the slopes, with private chauffeur and equipment handling managed by Nova." }
  ];

  return (
    <main className="min-h-screen luxury-gradient text-white">
      {/* 🚀 NAV */}
      <nav className="fixed top-0 w-full z-50 glass px-8 py-6 flex justify-between items-center">
        <Link href="/" className="serif text-2xl tracking-[0.4em] text-champagne">N E X U S</Link>
        <Link href="/" className="text-xs uppercase tracking-widest text-white/50 hover:text-white transition-colors">Return</Link>
      </nav>

      {/* 🍣 HERO: Gastronomy Pursuit */}
      <section className="relative h-[80vh] flex flex-col items-center justify-center text-center px-4 overflow-hidden pt-20">
        <div className="absolute inset-x-4 inset-y-20 z-0 glass border border-white/5 rounded-2xl overflow-hidden shadow-2xl">
           <img 
              src="/assets/dining-hero-sharp.png" 
              alt="Elite Omakase Experience" 
              className="w-full h-full object-cover brightness-75 hover:scale-105 transition-transform duration-[20s]" 
           />
           <div className="absolute inset-0 bg-gradient-to-t from-black via-black/20 to-transparent" />
        </div>
        
        <motion.div 
           initial={{ opacity: 0, y: 30 }}
           animate={{ opacity: 1, y: 0 }}
           className="relative z-10 space-y-6 max-w-4xl pt-40"
        >
           <div className="text-[10px] tracking-[1em] text-champagne uppercase font-bold italic">The Elite Table</div>
           <h1 className="serif text-6xl md:text-9xl italic leading-tight text-shadow-gold">Fine <br/> <span className="not-italic">Dining</span></h1>
        </motion.div>
      </section>

      {/* 🍽️ SECTION: TIERED GASTRONOMY */}
      <section className="py-48 px-8 max-w-7xl mx-auto space-y-48">
        <div className="grid md:grid-cols-3 gap-12">
           {experiences.map((exp, i) => (
             <motion.div
               key={exp.name}
               initial={{ opacity: 0, y: 20 }}
               whileInView={{ opacity: 1, y: 0 }}
               transition={{ delay: i * 0.2 }}
               className="glass p-12 space-y-8 border border-white/5 group hover:border-champagne/40 transition-all transition-duration-700"
             >
                <div className="text-[10px] tracking-[0.5em] text-champagne uppercase font-bold">0{i+1} • {exp.loc}</div>
                <h3 className="serif text-3xl">{exp.name}</h3>
                <p className="text-white/40 font-light leading-relaxed italic">{exp.desc}</p>
             </motion.div>
           ))}
        </div>

        {/* 🤝 SECTION: MENU CONSENSUS (THE UI PREVIEW) */}
        <div className="flex flex-col lg:flex-row gap-24 items-center">
            <motion.div 
               initial={{ opacity: 0, scale: 0.95 }}
               whileInView={{ opacity: 1, scale: 1 }}
               className="lg:w-1/2"
            >
               <div className="glass p-1 rounded-2xl shadow-2xl relative border border-white/10 group overflow-hidden shadow-gold">
                  <img src="/assets/dining-ui-sharp.png" alt="Consensus Dining UI" className="rounded-xl w-full h-full object-cover group-hover:scale-105 transition-transform duration-[12s]" />
                  <div className="absolute inset-x-0 bottom-0 bg-gradient-to-t from-black via-transparent to-transparent h-1/3" />
                  <div className="absolute bottom-12 left-12 serif text-white/90 text-2xl italic tracking-widest text-shadow-gold font-bold">Menu Consensus v1.0</div>
               </div>
            </motion.div>
            <div className="lg:w-1/2 space-y-12">
               <div className="text-xs uppercase tracking-[0.5em] text-champagne font-bold italic">The Sentient Menu</div>
               <h2 className="serif text-5xl md:text-8xl italic">Taste <br/> <span className="not-italic">Collective</span></h2>
               <p className="text-xl font-light text-white/50 leading-relaxed max-w-xl">
                 Nova doesn&apos;t just book the table; she manages the entire experience. 
                 Your group can vote on the multi-course menu, pre-select the wine pairing 
                 via the **Consensus UI**, and notify the chef of specific dietary needs before you reach the elevator.
               </p>
               <div className="flex items-center space-x-6 text-[10px] tracking-[0.4em] uppercase text-champagne bg-black/40 p-6 border-l-4 border-champagne">
                  <div className="h-2 w-2 bg-champagne rounded-full animate-ping" />
                  <span>Real-time Vibe Check active for Tokyo/London</span>
               </div>
            </div>
        </div>
      </section>
    </main>
  );
}
