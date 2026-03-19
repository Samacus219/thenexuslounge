'use client';
import { useState } from 'react';
import Link from 'next/link';
import { motion, AnimatePresence } from 'framer-motion';

export default function AuthPage() {
  const [email, setEmail] = useState('');
  const [phase, setPhase] = useState<'entry' | 'handshake'>('entry');

  const handleEntry = (e: React.FormEvent) => {
    e.preventDefault();
    if (!email) return;
    setPhase('handshake');
    // In a real high-luxe flow, this would trigger Firebase Magic Link
  };

  return (
    <main className="relative min-h-screen w-full overflow-hidden bg-black text-white">
      {/* 🏙️ THE "VELVET ROPE" BACKDROP */}
      <div 
        className="absolute inset-0 z-0 bg-cover bg-center grayscale opacity-40 transition-transform duration-[30s] hover:scale-110"
        style={{ backgroundImage: "url('/assets/auth-bg.png')" }}
      >
        <div className="absolute inset-0 bg-black/60" />
      </div>

      <div className="relative z-10 flex flex-col items-center justify-center min-h-screen px-6">
        <AnimatePresence mode="wait">
          {phase === 'entry' ? (
            <motion.div
              key="entry"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, scale: 0.95 }}
              className="glass max-w-md w-full p-12 space-y-12 text-center"
            >
              <div className="flex justify-center">
                 <div className="h-16 w-16 border border-champagne rotate-45 flex items-center justify-center champagne-glow animate-breathe">
                    <span className="text-champagne -rotate-45 text-2xl font-light tracking-widest">N</span>
                 </div>
              </div>

              <div className="space-y-4">
                <h1 className="serif text-3xl text-champagne italic">Lounge Access</h1>
                <p className="text-[10px] tracking-[0.4em] uppercase text-white/40 font-light">
                   Invite-Only Entry Required
                </p>
              </div>

              <form onSubmit={handleEntry} className="space-y-8">
                <input
                  type="email"
                  required
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  placeholder="Official Email Address"
                  className="w-full bg-transparent border-0 border-b border-white/10 py-4 text-center text-champagne text-sm tracking-[0.2em] focus:ring-0 focus:border-champagne/60 transition-all placeholder:text-white/10 outline-none uppercase font-light"
                />
                <button className="w-full py-4 border border-champagne text-[10px] tracking-[0.5em] uppercase text-champagne hover:bg-champagne hover:text-black transition-all duration-500">
                  Request Handshake
                </button>
              </form>

              <div className="pt-8">
                 <Link href="/" className="text-[9px] tracking-widest text-white/20 hover:text-white uppercase transition-colors">
                    Return to Public Facing
                 </Link>
              </div>
            </motion.div>
          ) : (
            <motion.div
              key="handshake"
              initial={{ opacity: 0, scale: 1.1 }}
              animate={{ opacity: 1, scale: 1 }}
              className="text-center space-y-12"
            >
               <div className="inline-block h-24 w-24 border border-champagne rotate-45 flex items-center justify-center champagne-glow animate-spin-slow">
                  <span className="text-champagne -rotate-45 text-4xl font-light">N</span>
               </div>
               <div className="space-y-6">
                 <h2 className="serif text-4xl text-champagne animate-pulse">Scanning Credentials...</h2>
                 <p className="text-sm tracking-[0.3em] uppercase text-white/40 max-w-sm mx-auto leading-loose">
                   A secure handshake link has been dispatched to <br/>
                   <span className="text-white">{email}</span>.
                 </p>
               </div>
               <p className="text-[10px] tracking-widest text-white/20 italic">
                  Handshake expires in 5:00
               </p>
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </main>
  );
}
