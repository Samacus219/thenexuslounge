'use client';
import Link from 'next/link';
import { motion } from 'framer-motion';

export default function ContactPage() {
  return (
    <main className="min-h-screen luxury-gradient text-white">
      {/* 🚀 NAV */}
      <nav className="fixed top-0 w-full z-50 glass px-8 py-6 flex justify-between items-center">
        <Link href="/" className="serif text-2xl tracking-[0.4em] text-champagne">N E X U S</Link>
        <Link href="/" className="text-xs uppercase tracking-widest text-white/50 hover:text-white transition-colors">Return</Link>
      </nav>

      <section className="pt-48 pb-20 px-8 max-w-7xl mx-auto">
        <div className="grid lg:grid-cols-2 gap-24">
           {/* LEFT: TEXT */}
           <motion.div 
             initial={{ opacity: 0, x: -20 }}
             animate={{ opacity: 1, x: 0 }}
             className="space-y-12"
           >
              <div className="text-xs uppercase tracking-[0.5em] text-champagne">Direct Line</div>
              <h1 className="serif text-6xl md:text-8xl italic">The <br/> <span className="not-italic">Concierge</span></h1>
              <p className="text-xl md:text-2xl font-light text-white/50 leading-relaxed max-w-md">
                Nexus is built on **Human Discretion** and **Sentient Intelligence**. For membership 
                inquiries, partnership proposals, or urgent transit coordination.
              </p>
              
              <div className="space-y-8 pt-12 border-t border-white/5">
                 <div className="space-y-2">
                    <div className="text-[10px] tracking-[0.4em] text-champagne uppercase font-bold">Inquiries</div>
                    <p className="serif text-2xl">concierge@thenexuslounge.com</p>
                 </div>
                 <div className="space-y-2">
                    <div className="text-[10px] tracking-[0.4em] text-champagne uppercase font-bold">HQ</div>
                    <p className="text-white/40 font-light italic">Bangkok • London • New York</p>
                 </div>
              </div>
           </motion.div>

           {/* RIGHT: THE INQUIRY VAULT */}
           <motion.div 
             initial={{ opacity: 0, scale: 0.95 }}
             animate={{ opacity: 1, scale: 1 }}
             className="glass p-12 lg:p-20 space-y-12 border border-white/5 shadow-2xl"
           >
              <h2 className="serif text-3xl">Secure Inquiry Vault</h2>
              <p className="text-white/40 font-light">
                Drop your message into the encrypted vault. Nova will triage and route to 
                the appropriate agentic tier within 15 minutes.
              </p>
              
              <form className="space-y-8">
                 <div className="space-y-2">
                    <label className="text-[10px] tracking-[0.4em] text-white/30 uppercase">Email</label>
                    <input type="email" className="w-full bg-transparent border-b border-white/10 py-4 focus:border-champagne outline-none transition-colors text-white" placeholder="your@email.com" />
                 </div>
                 <div className="space-y-2">
                    <label className="text-[10px] tracking-[0.4em] text-white/30 uppercase">Subject</label>
                    <select className="w-full bg-transparent border-b border-white/10 py-4 focus:border-champagne outline-none transition-colors text-white/50">
                       <option className="bg-[#0A0A0A]">Membership Initiation</option>
                       <option className="bg-[#0A0A0A]">Elite Partner Network</option>
                       <option className="bg-[#0A0A0A]">Guardian Support</option>
                    </select>
                 </div>
                 <div className="space-y-2">
                    <label className="text-[10px] tracking-[0.4em] text-white/30 uppercase">Message</label>
                    <textarea className="w-full bg-transparent border-b border-white/10 py-4 focus:border-champagne outline-none transition-colors h-32 text-white" placeholder="Secure message..."></textarea>
                 </div>
                 <button className="w-full py-6 glass border border-champagne/20 text-champagne text-xs uppercase tracking-[0.5em] hover:bg-champagne hover:text-black transition-all">Submit Handshake</button>
              </form>
           </motion.div>
        </div>
      </section>
    </main>
  );
}
