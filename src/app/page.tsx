import Link from 'next/link';
import WaitlistForm from '@/components/WaitlistForm';

export default function HomePage() {
  return (
    <main className="min-h-screen luxury-gradient selection:bg-champagne/30 text-white">
      {/* 🚀 NAV */}
      <nav className="fixed top-0 w-full z-50 glass px-8 py-6 flex justify-between items-center">
        <div className="serif text-2xl tracking-[0.4em] text-champagne">N E X U S</div>
        <div className="hidden md:flex space-x-12 text-sm tracking-widest uppercase text-white/60">
          <Link href="#service" className="hover:text-champagne transition-colors">Service</Link>
          <Link href="#methodology" className="hover:text-champagne transition-colors">Methodology</Link>
          <Link href="#partners" className="hover:text-champagne transition-colors">Partners</Link>
        </div>
        <Link href="/download" className="border border-champagne/40 px-6 py-2 text-xs tracking-[0.2em] uppercase text-champagne hover:bg-champagne hover:text-black transition-all">
          Request Access
        </Link>
      </nav>

      {/* 🏙️ HERO: The Sentient Curation */}
      <section className="relative h-screen flex flex-col items-center justify-center text-center px-4 overflow-hidden">
        <div className="absolute inset-0 z-0 opacity-40">
           {/* Placeholder for high-end cinematic video or image */}
           <div className="w-full h-full bg-[radial-gradient(circle_at_center,_var(--charcoal)_0%,_#000000_100%)]"></div>
        </div>
        
        <div className="relative z-10 space-y-12 max-w-4xl">
          <h1 className="serif text-5xl md:text-8xl leading-tight">
            The Pre-eminent <br/> 
            <span className="text-champagne italic">Social Concierge</span>
          </h1>
          <p className="text-lg md:text-xl font-light text-white/50 max-w-2xl mx-auto leading-relaxed">
            Coordinating luxury retreats, group dining, and elite transit through effortless delegation and sentient curation.
          </p>
          
          <div className="pt-12 w-full max-w-md mx-auto">
             <WaitlistForm />
          </div>
        </div>
      </section>

      {/* 💎 METHODOLOGY: Deep Service */}
      <section id="methodology" className="py-32 px-8 max-w-7xl mx-auto grid md:grid-cols-2 gap-20 items-center">
        <div className="space-y-12">
          <h2 className="serif text-4xl md:text-5xl leading-snug">
            A Culture of <br/> <span className="text-champagne">Effortless Delegation</span>
          </h2>
          <div className="space-y-8 text-white/60 font-light leading-loose text-lg">
            <p>
              Traditional travel is often a series of exhausting decisions. Nexus replaces friction with foresight. 
              Our AI, Nova, doesn&apos;t just search; she curates, considering the social context of your entire circle.
            </p>
            <p>
              From the Ginza rain-scenario where transit is dispatched before you ask, to the biometric-secured 
              split-payment vault, we defend your time and your peace.
            </p>
          </div>
        </div>
        <div className="glass aspect-[4/5] p-1 shadow-2xl rounded-sm">
          <div className="w-full h-full bg-[#131313] flex items-center justify-center">
            <span className="serif text-champagne/20 text-xl italic">[ System Interface Preview ]</span>
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
