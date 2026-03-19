'use client';
import Link from 'next/link';
import { motion } from 'framer-motion';

export default function StaysPage() {
  const tiers = [
    { name: "Private Sanctuary", cat: "Villa & Estates", desc: "Hand-vetted private estates in Bali, Mykonos, and the Amalfi Coast. Fully staffed, fully secured, and fully social." },
    { name: "Skyline Penthouse", cat: "Urban Luxury", desc: "The highest floor of the highest tower. Direct elevator access, private chef, and 360-degree city views." },
    { name: "Heritage Retreat", cat: "Culture Stays", desc: "Private access to historic châteaus and ryokans. Experience the deepest traditions with modern security." }
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
          <div className="text-xs uppercase tracking-[0.5em] text-champagne">High-Performance Hospitality</div>
          <h1 className="serif text-5xl md:text-8xl italic text-shadow-gold italic">Luxe <br/> <span className="not-italic">Stays</span></h1>
          <p className="text-xl md:text-2xl font-light text-white/50 leading-relaxed max-w-2xl">
            Nexus Stays are not just rooms; they are foundations for your circle. We replace the 
            word &quot;Booking&quot; with &quot;Consensus Selection&quot;.
          </p>
        </motion.div>

        {/* 🏊 CINEMATIC VILLA SOCIAL BACKDROP */}
        <div className="relative h-[650px] w-full glass rounded-sm overflow-hidden p-1 shadow-2xl group">
           <img 
              src="/assets/stays-bg.png" 
              alt="Elite Social Villa Experience" 
              className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-[25s]"
           />
           <div className="absolute inset-0 bg-gradient-to-t from-black via-transparent to-black/10" />
           <div className="absolute top-12 left-12 flex items-center space-x-6">
              <div className="h-3 w-3 bg-champagne rounded-full animate-ping" />
              <div className="serif text-white/80 text-xl md:text-2xl italic tracking-widest text-shadow-gold text-right uppercase font-bold">Consensus Villa Secured - Bali v1.0</div>
           </div>
           <div className="absolute bottom-12 left-12 max-w-md bg-black/40 backdrop-blur-md p-8 border-l-4 border-champagne">
              <p className="text-white/90 font-light leading-relaxed italic text-lg">
                &quot;The finest architecture is the one that frames your social circle.&quot;
              </p>
           </div>
        </div>

        {/* 🏰 TIER GRID */}
        <div className="grid md:grid-cols-3 gap-12 py-20 border-t border-white/5 px-4 md:px-0">
           {tiers.map((item, i) => (
             <motion.div
               key={item.name}
               initial={{ opacity: 0, y: 40 }}
               whileInView={{ opacity: 1, y: 0 }}
               transition={{ delay: i * 0.2 }}
               className="glass p-12 space-y-8 hover:border-champagne/40 transition-all group relative overflow-hidden"
             >
                <div className="absolute -right-8 -bottom-8 opacity-5 font-serif text-8xl italic champagne-glow">STAY</div>
                <div className="space-y-4">
                   <div className="text-[10px] tracking-[0.5em] text-champagne uppercase font-bold">{item.cat}</div>
                   <h2 className="serif text-3xl text-white/95">{item.name}</h2>
                </div>
                <p className="text-white/40 font-light leading-relaxed text-sm italic">{item.desc}</p>
             </motion.div>
           ))}
        </div>

        {/* 🤝 THE "CONSENSUS" HOSPITALITY PROMISE */}
        <div className="flex flex-col lg:flex-row gap-24 items-center py-20 bg-black/50 p-12 lg:p-24 rounded-sm border border-white/5 shadow-[0_0_100px_rgba(247,231,206,0.05)]">
           <div className="lg:w-1/2 space-y-12">
              <h3 className="serif text-4xl">The Consensus Split</h3>
              <p className="text-white/40 max-w-xl font-light leading-loose text-lg">
                Nexus doesn&apos;t just book a villa; we build a **Shared Financial Sanctuary**. 
                Nova identifies the finest estates, your group votes on the winner in the Lounge, 
                and the cost is split instantly in the Vault. No friction. Just celebration.
              </p>
           </div>
           <div className="lg:w-1/2 relative group">
              <div className="absolute -inset-8 bg-champagne/10 blur-[80px] rounded-full animate-pulse" />
              <div className="glass p-2 rounded-sm shadow-2xl relative shadow-gold group-hover:scale-105 transition-transform duration-700">
                <img src="/assets/mobile-vault.png" alt="Vault Consensus Split Preview" className="rounded-sm" />
                <div className="absolute inset-x-0 bottom-0 bg-gradient-to-t from-black via-transparent to-transparent h-1/2" />
                <div className="absolute bottom-6 left-6 text-[10px] tracking-widest text-champagne uppercase font-bold italic">Vault Handshake v1.0</div>
              </div>
           </div>
        </div>
      </section>
    </main>
  );
}
