'use client';
import Link from 'next/link';
import { motion } from 'framer-motion';

export default function PartnersPage() {
  const networks = [
    { name: "Agoda Elite", category: "Hospitality & Stays", status: "Network Integration" },
    { name: "Expedia Group", category: "Global Inventory", status: "Service Conduit" },
    { name: "Blacklane", category: "Chauffeur Services", status: "Transit Tier-1" },
    { name: "Impact Radius", category: "Partner Governance", status: "Network Authority" }
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
          <div className="text-xs uppercase tracking-[0.5em] text-champagne">Official Alliances</div>
          <h1 className="serif text-5xl md:text-8xl italic">Partner <span className="not-italic">Ecosystem</span></h1>
          <p className="text-xl md:text-2xl font-light text-white/50 leading-relaxed max-w-2xl">
            Nexus coordinates with a vetted network of global hospitality and transit leaders. 
            We provide the sentient interface that connects your circle to the world’s elite providers.
          </p>
        </motion.div>

        {/* 🏙️ CINEMATIC PARTNERS BACKDROP */}
        <div className="relative h-[400px] w-full glass rounded-sm overflow-hidden p-1 shadow-2xl">
           <img 
              src="/assets/partners-bg.png" 
              alt="Elite Hospitality Partners" 
              className="w-full h-full object-cover opacity-50 contrast-125"
           />
           <div className="absolute inset-0 bg-gradient-to-r from-black via-transparent to-black/20" />
           <div className="absolute inset-0 flex items-center p-12">
              <div className="serif text-white/80 text-3xl md:text-4xl italic tracking-widest text-shadow-gold">THE GLOBAL NETWORK</div>
           </div>
        </div>

        {/* 🛡️ PARTNER CARDS */}
        <div className="grid md:grid-cols-2 gap-8 py-20 border-t border-white/5">
           {networks.map((network, i) => (
             <motion.div
               key={network.name}
               initial={{ opacity: 0, y: 20 }}
               animate={{ opacity: 1, y: 0 }}
               transition={{ delay: i * 0.2, duration: 0.8 }}
               className="glass p-12 flex flex-col justify-between hover:border-champagne/50 transition-all duration-500 group"
             >
                <div className="space-y-4">
                   <div className="text-[10px] tracking-[0.5em] text-white/30 uppercase">{network.category}</div>
                   <h2 className="serif text-4xl text-white/90 group-hover:text-champagne transition-colors">{network.name}</h2>
                </div>
                <div className="mt-12 flex items-center space-x-4">
                   <div className="h-1 w-1 bg-champagne rounded-full" />
                   <div className="text-[10px] tracking-widest text-white/40 uppercase">{network.status}</div>
                </div>
             </motion.div>
           ))}
        </div>

        {/* ✉️ CONTACT REDIRECT */}
        <div className="bg-black p-20 text-center space-y-12">
           <h3 className="serif text-3xl">Interested in a Strategic Alliance?</h3>
           <p className="text-white/40 max-w-xl mx-auto font-light leading-loose">
              If you represent an elite hospitality group or luxury travel service, our concierge engine 
              provides the technological bridge to high-net-worth social circles globally.
           </p>
           <a 
              href="mailto:concierge@thenexuslounge.com"
              className="inline-block border border-champagne/40 px-12 py-4 text-xs uppercase tracking-[0.5em] text-champagne hover:bg-champagne hover:text-black transition-all"
           >
              Alliance Inquiry
           </a>
        </div>
      </section>
    </main>
  );
}
