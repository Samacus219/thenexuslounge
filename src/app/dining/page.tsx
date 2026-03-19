'use client';
import Link from 'next/link';
import { motion } from 'framer-motion';

export default function DiningPage() {
  const experiences = [
    { name: "Omakase Masterclass", loc: "Ginza, Tokyo", desc: "A 22-course journey through the deepest traditions of Edomae sushi. Nova handles the 6-month waitlist for your circle." },
    { name: "Rooftop Resonance", loc: "Bangkok", desc: "Private access to the city's most exclusive skyline lounges. Table consensus reached and secured before you arrive." },
    { name: "Alpine Gastronomy", loc: "Courchevel", desc: "Michelin-starred dining in the heart of the Trois Vallées. Chauffeur synchronization included." }
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
          <div className="text-xs uppercase tracking-[0.5em] text-champagne">Elite Gastronomy</div>
          <h1 className="serif text-6xl md:text-8xl italic">Curation of <br/> <span className="not-italic">Taste</span></h1>
          <p className="text-xl md:text-2xl font-light text-white/50 leading-relaxed max-w-2xl">
            Nexus Dining isn&apos;t just about food; it&apos;s about access. Nova weaponizes our network of concierges 
            to secure tables that don&apos;t officially exist on public apps.
          </p>
        </motion.div>

        {/* 🍱 CINEMATIC DINING BACKDROP */}
        <div className="relative h-[500px] w-full glass rounded-sm overflow-hidden p-1 shadow-2xl">
           <img 
              src="/assets/dining-bg.png" 
              alt="Exclusive Omakase Experience" 
              className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-[20s]"
           />
           <div className="absolute inset-0 bg-gradient-to-t from-black via-transparent to-black/10" />
           <div className="absolute bottom-12 right-12 text-right space-y-2">
              <div className="serif text-white/90 text-2xl md:text-3xl italic tracking-widest text-shadow-gold">OMAKASE GINZA v1.0</div>
              <div className="text-[10px] tracking-[0.5em] text-champagne uppercase">Secured by Nova Concierge</div>
           </div>
        </div>

        {/* 🍲 CURATION GRID */}
        <div className="grid md:grid-cols-3 gap-12 py-20 border-t border-white/5">
           {experiences.map((item, i) => (
             <motion.div
               key={item.name}
               initial={{ opacity: 0, y: 30 }}
               whileInView={{ opacity: 1, y: 0 }}
               transition={{ delay: i * 0.2 }}
               className="glass p-12 space-y-8 hover:border-champagne/40 transition-all group"
             >
                <div className="space-y-4">
                   <div className="text-[10px] tracking-[0.5em] text-champagne uppercase font-bold">{item.loc}</div>
                   <h2 className="serif text-3xl text-white/95">{item.name}</h2>
                </div>
                <p className="text-white/40 font-light leading-relaxed text-sm italic">{item.desc}</p>
             </motion.div>
           ))}
        </div>

        {/* 🥂 THE "RESERVATION" PROMISE */}
        <div className="bg-black p-20 text-center space-y-12 rounded-sm border border-white/5">
           <h3 className="serif text-3xl">Beyond the Menu</h3>
           <p className="text-white/40 max-w-xl mx-auto font-light leading-loose text-lg">
              Every Nexus dining reservation includes our signature **Consensus Signature** logic. 
              The group votes on the menu, the budget is split in the Vault, and the table is secured 
              before you ever leave the lounge.
           </p>
        </div>
      </section>
    </main>
  );
}
