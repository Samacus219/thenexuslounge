'use client';
import Link from 'next/link';
import { motion } from 'framer-motion';
import WaitlistForm from '@/components/WaitlistForm';

export default function HomePage() {
  return (
    <main className="min-h-screen luxury-gradient selection:bg-champagne/30 text-white">
      {/* 🚀 NAV: THE ELITE SIDEBAR MENU */}
      <nav className="fixed top-0 w-full z-50 glass px-8 py-6 flex justify-between items-center">
        <div className="flex items-center space-x-12">
          <Link href="/" className="serif text-2xl tracking-[0.4em] text-champagne">N E X U S</Link>
          <div className="hidden lg:flex items-center space-x-8">
            <Link href="/transit" className="text-[10px] tracking-widest text-white/50 hover:text-white transition-all uppercase">Transit</Link>
            <Link href="/service" className="text-[10px] tracking-widest text-white/50 hover:text-white transition-all uppercase">Lounge</Link>
            <Link href="/methodology" className="text-[10px] tracking-widest text-white/50 hover:text-white transition-all uppercase">Intelligence</Link>
            <Link href="/partners" className="text-[10px] tracking-widest text-white/50 hover:text-white transition-all uppercase">Partners</Link>
          </div>
        </div>
        <div className="flex items-center space-x-8">
          <Link href="/auth" className="hidden md:block border border-white/20 px-8 py-2 text-[10px] tracking-[0.3em] uppercase text-white/60 hover:border-champagne hover:text-white transition-all">Member Login</Link>
          <div className="h-10 w-10 border border-champagne/40 rotate-45 flex items-center justify-center champagne-glow animate-spin-slow">
            <img src="/assets/diamond-logo.png" alt="Diamond" className="-rotate-45 w-6 h-6 object-contain" />
          </div>
        </div>
      </nav>

      {/* 🏙️ HERO: The Sentient Curation */}
      <section className="relative h-screen flex flex-col items-center justify-center text-center px-4 overflow-hidden">
        {/* 🎬 THE CINEMATIC BACKDROP */}
        <div 
          className="absolute inset-0 z-0 bg-cover bg-center bg-no-repeat transition-transform duration-[20s] hover:scale-110"
          style={{ backgroundImage: "url('/assets/hero-bg.png')" }}
        >
          <div className="absolute inset-0 bg-gradient-to-b from-black/80 via-black/40 to-black/90" />
        </div>
        
        <div className="relative z-10 space-y-12 max-w-4xl">
          <div className="mb-6 flex justify-center">
             <div className="h-16 w-16 border border-champagne/40 rotate-45 flex items-center justify-center p-2 mb-4 champagne-glow animate-breathe">
                <span className="text-champagne -rotate-45 text-2xl font-light tracking-widest">N</span>
             </div>
          </div>

          <p className="text-champagne/80 italic serif text-2xl">
            &quot;The most precious luxury isn&apos;t the destination; it&apos;s the peace of mind of your group.&quot;
          </p>
          <h1 className="serif text-5xl md:text-8xl leading-none text-shadow-gold">
            The <span className="text-champagne italic">Project</span> <br/>
            of Foresight.
          </h1>
          <p className="text-sm md:text-base font-light text-white/50 max-w-xl mx-auto leading-relaxed tracking-[0.3em] uppercase">
            Coordinating elite retreats through sentient delegation.
          </p>
          
          <div className="pt-8 w-full max-w-sm mx-auto">
             <WaitlistForm />
          </div>
        </div>
      </section>

      {/* 🥂 SECTION: THE MOBILE SHOWCASE (LUXURY FUN) */}
      <section className="py-48 px-8 max-w-7xl mx-auto space-y-32">
        <div className="flex flex-col lg:flex-row gap-24 items-center">
            <div className="lg:w-1/2 space-y-12">
              <div className="text-xs uppercase tracking-[0.5em] text-champagne">Visual Consensus</div>
              <h2 className="serif text-5xl md:text-7xl leading-tight">
                Designed for <br /> <span className="italic">The Social Circle</span>
              </h2>
              <p className="text-lg font-light text-white/50 leading-loose max-w-xl">
                Nexus isn&apos;t just a concierge; it&apos;s a shared experience. From the &quot;Final Mile&quot; 
                coordination to the group voting Lounge, every interaction is curated to maximize 
                pleasure and minimize planning.
              </p>
            </div>
            <div className="lg:w-1/2 grid grid-cols-2 gap-8 relative">
               <motion.div 
                 initial={{ opacity: 0, x: -20 }}
                 whileInView={{ opacity: 1, x: 0 }}
                 className="glass p-1 rounded-2xl rotate-[-5deg] shadow-2xl"
               >
                 <img src="/assets/mobile-onboarding.png" alt="Onboarding" className="rounded-xl" />
               </motion.div>
               <motion.div 
                 initial={{ opacity: 0, x: 20 }}
                 whileInView={{ opacity: 1, x: 0 }}
                 className="glass p-1 rounded-2xl rotate-[5deg] mt-20 shadow-2xl"
               >
                 <img src="/assets/mobile-transit.png" alt="Transit Alert" className="rounded-xl" />
               </motion.div>
            </div>
        </div>

        {/* 🛡️ SECTION: THE GUARDIAN (AGENTIC SERVICE) */}
        <div className="flex flex-col-reverse lg:flex-row gap-24 items-center">
            <div className="lg:w-1/2 relative">
               <div className="absolute -inset-10 bg-champagne/5 blur-[100px] rounded-full" />
               <motion.div 
                 initial={{ opacity: 0, scale: 0.9 }}
                 whileInView={{ opacity: 1, scale: 1 }}
                 className="glass p-2 rounded-3xl relative z-10"
               >
                 <img src="/assets/mobile-guardian.png" alt="Guardian Protocol" className="rounded-2xl" />
               </motion.div>
            </div>
            <div className="lg:w-1/2 space-y-12">
              <div className="text-xs uppercase tracking-[0.5em] text-champagne">Security & Serenity</div>
              <h2 className="serif text-5xl md:text-7xl leading-tight">
                The <span className="italic">Guardian</span><br /> Protocol
              </h2>
              <p className="text-lg font-light text-white/50 leading-loose">
                Real-time edge monitoring for your entire circle. Whether it&apos;s Tokyo rain 
                adjusting your transit, or biometric-secured document storage in the 
                Private Vault, we shield your peace of mind.
              </p>
              <div className="pt-8">
                 <Link href="/methodology" className="border-b border-champagne text-champagne text-xs uppercase tracking-[0.3em] pb-2 hover:text-white hover:border-white transition-all">
                    View Methodology
                 </Link>
              </div>
            </div>
        </div>
      </section>

      {/* 🖼️ SECTION: THE ARCHIVE (SOCIAL FUN) */}
      <section className="py-48 bg-black/50">
         <div className="max-w-7xl mx-auto px-8 grid lg:grid-cols-2 gap-24 items-center">
            <div className="space-y-12">
               <div className="text-xs uppercase tracking-[0.5em] text-champagne">Shared Memory</div>
               <h2 className="serif text-5xl md:text-7xl leading-tight">The <span className="italic">Elite</span> Archive</h2>
               <p className="text-lg font-light text-white/50 leading-loose">
                 Every sunset at the beach club, every private jet dining experience—automatically 
                 curated into a high-res masonry archive for your circle. Luxury isn&apos;t just 
                 the moment; it&apos;s the legacy.
               </p>
            </div>
            <div className="relative group">
               <motion.div
                 initial={{ opacity: 0, y: 40 }}
                 whileInView={{ opacity: 1, y: 0 }}
                 className="glass p-2 rounded-2xl overflow-hidden shadow-2xl"
               >
                  <img 
                    src="/assets/mobile-archive.png" 
                    alt="Event Archive" 
                    className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-[10s]" 
                  />
               </motion.div>
            </div>
         </div>
      </section>

      {/* 🤝 PARTNERS: For Affiliate Approval */}
      <section id="partners" className="py-32 bg-black border-y border-white/5">
        <div className="max-w-7xl mx-auto px-8 text-center space-y-16">
          <h3 className="serif text-3xl text-white/80">Affiliate Partnerships</h3>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-12 items-center opacity-30 grayscale hover:grayscale-0 transition-all duration-700">
            {/* These logos establish credibility for networks like Impact and CJ */}
            <div className="serif text-xl p-8 border border-white/10">EXPEDIA</div>
            <div className="serif text-xl p-8 border border-white/10">BOOKING</div>
            <div className="serif text-xl p-8 border border-white/10">AGODA</div>
            <div className="serif text-xl p-8 border border-white/10">BLACKLANE</div>
          </div>
          <p className="text-xs tracking-widest uppercase text-white/30">
            Nexus acts as a tech-enabled conduit for official physical travel vendors.
          </p>
        </div>
      </section>

      {/* ✉️ FOOTER: Compliance */}
      <footer className="py-20 px-8 border-t border-white/5 bg-[#050505]">
        <div className="max-w-7xl mx-auto grid md:grid-cols-2 gap-12 items-end">
          <div className="space-y-8">
             <div className="serif text-xl tracking-[0.4em] text-champagne">N E X U S</div>
             <p className="text-sm text-white/40 max-w-sm font-light leading-relaxed">
               © 2026 Nexus Private Concierge. All reservations are secured via Tier-1 global hospitality providers and protected by biometric authorization.
             </p>
          </div>
          <div className="flex space-x-8 text-[10px] tracking-[0.3em] uppercase text-white/40 justify-end">
            <Link href="/privacy" className="hover:text-white transition-colors">Privacy Policy</Link>
            <Link href="/terms" className="hover:text-white transition-colors">Terms of Service</Link>
            <Link href="/contact" className="hover:text-white transition-colors">Contact</Link>
          </div>
        </div>
      </footer>
    </main>
  );
}
