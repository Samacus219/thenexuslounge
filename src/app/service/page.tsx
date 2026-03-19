import Link from 'next/link';
import { motion } from 'framer-motion';

export default function ServicePage() {
  const benefits = [
    {
      title: "Effortless Delegation",
      description: "Drop a natural language request. Nova curates, compares, and secures the options, presenting only the elite path forward.",
      icon: "✨"
    },
    {
      title: "The Social Lounge",
      description: "A private digital room where groups reach consensus without friction. Decisions are voted on, and the final choice is executed instantly.",
      icon: "🥂"
    },
    {
      title: "The Secure Vault",
      description: "A biometric-secured financial layer for splitting payments and managing group funds. No Venmo, no friction, just pure security.",
      icon: "🛡️"
    },
    {
      title: "Guardian Protocol",
      description: "Anticipatory security for your time. Nexus monitors flight delays and transit windows, rerouting your circle before you even notice.",
      icon: "⚖️"
    }
  ];

  return (
    <main className="min-h-screen luxury-gradient text-white selection:bg-champagne/30">
      {/* 🚀 NAV: CONSISTENT BRANDING */}
      <nav className="fixed top-0 w-full z-50 glass px-8 py-6 flex justify-between items-center">
        <Link href="/" className="serif text-2xl tracking-[0.4em] text-champagne">N E X U S</Link>
        <div className="flex items-center space-x-12">
           <Link href="/" className="text-xs uppercase tracking-widest text-white/50 hover:text-white transition-colors">Return</Link>
        </div>
      </nav>

      {/* 🏹 HERO: THE CULTURE OF SERVICE */}
      <section className="pt-48 pb-20 px-8 max-w-7xl mx-auto space-y-16">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 1 }}
          className="space-y-6 max-w-4xl"
        >
          <div className="text-xs uppercase tracking-[0.5em] text-champagne mb-8">Service Philosophy</div>
          <h1 className="serif text-6xl md:text-8xl leading-tight">
            The Project of <br/> <span className="italic">Deep Service</span>
          </h1>
          <p className="text-xl md:text-2xl font-light text-white/50 leading-relaxed max-w-3xl">
            In an era of decision-fatigue, luxury is the absence of choice in the presence of excellence. 
            Nexus is not a booking app; it is a sentient concierge that weaponizes foresight on behalf of your circle.
          </p>
        </motion.div>

        {/* 🍾 THE BENEFIT GRID */}
        <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-8 pt-20 border-t border-white/10">
          {benefits.map((benefit, i) => (
            <motion.div
              key={benefit.title}
              initial={{ opacity: 0, y: 30 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: i * 0.2, duration: 0.8 }}
              className="glass p-8 space-y-6 hover:border-champagne/40 transition-all duration-500 group"
            >
              <div className="text-3xl grayscale group-hover:grayscale-0 transition-all">{benefit.icon}</div>
              <h2 className="serif text-2xl text-champagne">{benefit.title}</h2>
              <p className="text-sm font-light leading-loose text-white/40">{benefit.description}</p>
            </motion.div>
          ))}
        </div>
      </section>

      {/* 🛡️ SECURITY DEEP-DIVE */}
      <section className="relative py-48 mt-20 overflow-hidden">
        <div 
          className="absolute inset-0 z-0 opacity-20 bg-cover bg-center grayscale scale-125"
          style={{ backgroundImage: "url('/assets/vault-bg.png')" }}
        />
        <div className="relative z-10 max-w-4xl mx-auto px-8 text-center space-y-12">
          <h2 className="serif text-4xl md:text-5xl">The <span className="text-champagne italic">Nexus Security</span> Charter</h2>
          <div className="space-y-8 font-light text-white/50 leading-loose text-lg text-left glass p-12">
             <p>
               Every financial interaction within the Nexus Vault is secured by **Tier-1 Identity Verification**. 
               Before a transaction is cleared, members must authorize via biometric handshake—ensuring that your group&apos;s 
               pooled funds are as secure as a private bank vault.
             </p>
             <p>
               We employ **APP Scam Mitigation Protocols**, meaning every transit and hospitality vendor is vetted 
               and payments are held in escrow until service is rendered. We defend your capital as fiercely as we defend your time.
             </p>
          </div>
        </div>
      </section>

      {/* ✉️ CTA: JOIN THE CIRCLE */}
      <section className="py-48 text-center space-y-12 bg-black">
        <h3 className="serif text-3xl md:text-4xl">Ready to delegate?</h3>
        <Link 
          href="/"
          className="inline-block border border-champagne px-12 py-4 text-xs uppercase tracking-[0.5em] text-champagne hover:bg-champagne hover:text-black transition-all"
        >
          Request Invitation
        </Link>
      </section>
    </main>
  );
}
