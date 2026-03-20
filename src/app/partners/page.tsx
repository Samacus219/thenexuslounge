'use client';
import Link from 'next/link';
import { motion } from 'framer-motion';

export default function PartnersPage() {
  const networks = [
    { name: "Hospitality Network", cat: "Elite Triage", partners: "Agoda, Expedia, Private Estates", desc: "Access to 1.2M+ high-end stays globally, triaged and curated by Nova for your group's specific sentiment." },
    { name: "Global Aviation", cat: "Private Mobilty", partners: "NetJets, Global Fleets, Private Charters", desc: "Direct API integration for private aviation. From hangar access to in-flight consensus, Nexus manages the cockpit-to-curb transition." },
    { name: "Financial Sanctuary", cat: "Secure Fiscal Triage", partners: "Stripe, Amex, Elite Banking", desc: "Our Vault Protocol is designed to integrate with Tier-1 global banking for seamless shared group settlements." }
  ];

  return (
    <main className="min-h-screen luxury-gradient text-white">
      {/* 🚀 NAV */}
      <nav className="fixed top-0 w-full z-50 glass px-8 py-6 flex justify-between items-center">
        <Link href="/" className="serif text-2xl tracking-[0.4em] text-champagne">N E X U S</Link>
        <Link href="/" className="text-xs uppercase tracking-widest text-white/50 hover:text-white transition-colors">Return</Link>
      </nav>

      {/* 🏢 HERO: The Affiliate Nexus */}
      <section className="relative h-[80vh] flex flex-col items-center justify-center text-center px-4 overflow-hidden pt-20">
        <div className="absolute inset-x-4 inset-y-20 z-0 glass border border-white/5 rounded-2xl overflow-hidden shadow-2xl">
           <img 
              src="/assets/partners-hero-sharp.png" 
              alt="Elite Brand Gallery" 
              className="w-full h-full object-cover brightness-75 hover:scale-105 transition-transform duration-[20s]" 
           />
           <div className="absolute inset-0 bg-gradient-to-t from-black via-black/20 to-transparent" />
        </div>
        
        <motion.div 
           initial={{ opacity: 0, y: 30 }}
           animate={{ opacity: 1, y: 0 }}
           className="relative z-10 space-y-6 max-w-4xl pt-40"
        >
           <div className="text-[10px] tracking-[1em] text-champagne uppercase font-bold italic">The Affiliate Ecosystem</div>
           <h1 className="serif text-6xl md:text-9xl italic leading-tight text-shadow-gold">Global <br/> <span className="not-italic font-bold text-white/90">Partners</span></h1>
        </motion.div>
      </section>

      {/* 🤝 SECTION: CORPORATE HANDSHAKE (TEXT/UI) */}
      <section className="py-48 px-8 max-w-7xl mx-auto space-y-48">
        <div className="flex flex-col lg:flex-row gap-24 items-center">
            <div className="lg:w-1/2 space-y-12">
               <div className="text-xs uppercase tracking-[0.5em] text-champagne font-bold italic">The Corporate Triage</div>
               <h2 className="serif text-5xl md:text-8xl leading-tight text-shadow-gold italic">Sentient <br/> <span className="not-italic">Supply</span></h2>
               <p className="text-xl font-light text-white/50 leading-relaxed max-w-xl border-l-2 border-champagne pl-6">
                 &quot;Nexus adds the value of consensus to the existing luxury infrastructure.&quot;
               </p>
               <p className="text-xl font-light text-white/50 leading-relaxed max-w-xl">
                 We act as the intelligent conduit for official travel vendors. By triaging 
                 high-net-worth group sentiment and securing pre-verified social bookings, 
                 we provide our partners with perfectly synchronized elite arrivals.
               </p>
               <div className="flex items-center space-x-6 text-[10px] tracking-[0.4em] uppercase text-champagne bg-black/40 p-6 border-l-4 border-champagne">
                  <div className="h-2 w-2 bg-champagne rounded-full animate-ping" />
                  <span>Sentinel Affiliate API: ACTIVE v2.4</span>
               </div>
            </div>
            
            <motion.div 
               initial={{ opacity: 0, scale: 0.95 }}
               whileInView={{ opacity: 1, scale: 1 }}
               className="lg:w-1/2"
            >
               {/* PLACEHOLDER: Glass UI for Partners (until quota reset) */}
               <div className="glass p-12 lg:p-20 rounded-2xl shadow-2xl border border-white/10 space-y-12 bg-charcoal/40 relative overflow-hidden group">
                  <div className="absolute -inset-10 bg-champagne/5 blur-[120px] rounded-full animate-pulse" />
                  <div className="relative z-10 space-y-8">
                     <div className="serif text-3xl italic tracking-widest text-shadow-gold text-white/90">Partner Dashboard</div>
                     <div className="space-y-6">
                        <div className="flex justify-between items-center border-b border-white/5 pb-4">
                           <span className="text-[10px] uppercase tracking-widest text-white/40 italic">Integration Tier</span>
                           <span className="text-champagne font-bold">SENTINEL GOLD</span>
                        </div>
                        <div className="flex justify-between items-center border-b border-white/5 pb-4">
                           <span className="text-[10px] uppercase tracking-widest text-white/40 italic">API Identity</span>
                           <span className="text-white/80 mono">NX-GLOBAL-TRIAGE</span>
                        </div>
                        <div className="flex justify-between items-center border-b border-white/5 pb-4">
                           <span className="text-[10px] uppercase tracking-widest text-white/40 italic">Incentive Status</span>
                           <span className="text-green-400 font-bold">SOCIALLY VERIFIED</span>
                        </div>
                     </div>
                     <div className="pt-8 flex justify-center">
                        <div className="serif text-champagne italic text-xl tracking-widest animate-pulse opacity-60 italic font-bold">Handshaking 1.2M Stays...</div>
                     </div>
                  </div>
               </div>
            </motion.div>
        </div>

        {/* 🏛️ PARTNER NETWORK GRID */}
        <div className="grid md:grid-cols-3 gap-12 py-20 border-t border-white/5">
           {networks.map((item, i) => (
             <motion.div
               key={item.name}
               initial={{ opacity: 0, y: 40 }}
               whileInView={{ opacity: 1, y: 0 }}
               transition={{ delay: i * 0.2 }}
               className="glass p-12 space-y-8 hover:border-champagne/40 transition-all transition-duration-700 group relative overflow-hidden h-full"
             >
                <div className="absolute -right-8 -bottom-8 opacity-5 font-serif text-8xl italic champagne-glow">API</div>
                <div className="space-y-4">
                   <div className="text-[10px] tracking-[0.5em] text-champagne uppercase font-bold italic">{item.cat}</div>
                   <h2 className="serif text-3xl text-white/95">{item.name}</h2>
                   <div className="text-[10px] tracking-widest text-white/30 uppercase italic">{item.partners}</div>
                </div>
                <p className="text-white/40 font-light leading-relaxed text-sm italic">{item.desc}</p>
             </motion.div>
           ))}
        </div>
      </section>
    </main>
  );
}
