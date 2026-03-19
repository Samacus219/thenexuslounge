'use client';

import { useState } from 'react';
import Link from 'next/link';
import { db } from '@/lib/firebase';
import { collection, addDoc, serverTimestamp } from 'firebase/firestore';
import { motion, AnimatePresence } from 'framer-motion';

export default function WaitlistForm() {
  const [email, setEmail] = useState('');
  const [submitted, setSubmitted] = useState(false);
  const [isLoading, setIsLoading] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!email) return;

    setIsLoading(true);
    
    try {
      await addDoc(collection(db, "waitlist"), {
        email,
        timestamp: serverTimestamp(),
        source: 'nexus_web_v1',
        context: 'Waitlist Inquiry'
      });
      setSubmitted(true);
    } catch (e) {
      console.error("Inquiry Error:", e);
      // Fallback: We don't want to show an ugly error to a HNW user
      // We could use a soft-fail or toast here.
    }
    
    setIsLoading(false);
  };

  return (
    <div className="w-full max-w-md mx-auto relative group">
      <AnimatePresence mode="wait">
        {!submitted ? (
          <motion.form
            key="form"
            initial={{ opacity: 0, y: 10 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, scale: 0.95 }}
            onSubmit={handleSubmit}
            className="space-y-6"
          >
            <div className="relative">
              <input
                type="email"
                required
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                placeholder="Enter email to request access"
                className="w-full bg-transparent border-0 border-b border-champagne/20 py-4 text-champagne text-sm tracking-widest focus:ring-0 focus:border-champagne/60 transition-all placeholder:text-white/20 outline-none uppercase font-light"
              />
            </div>

            <button
              disabled={isLoading}
              className="w-full py-4 border border-champagne/40 text-[10px] tracking-[0.4em] uppercase text-champagne hover:bg-champagne hover:text-black transition-all duration-500 disabled:opacity-50"
            >
              {isLoading ? 'Processing Inquiry...' : 'Submit Inquiry'}
            </button>
          </motion.form>
        ) : (
          <motion.div
            key="success"
            initial={{ opacity: 0, scale: 0.9 }}
            animate={{ opacity: 1, scale: 1 }}
            transition={{ duration: 0.8, ease: "easeOut" }}
            className="text-center space-y-8 py-12 glass p-8 shadow-2xl relative overflow-hidden"
          >
            <div className="absolute inset-0 bg-gradient-to-b from-champagne/10 to-transparent opacity-20" />
            
            <div className="flex justify-center mb-4">
              <div className="h-12 w-12 border border-champagne/40 rotate-45 flex items-center justify-center champagne-glow animate-breathe">
                <span className="text-champagne -rotate-45 text-lg font-light tracking-[0.2em]">N</span>
              </div>
            </div>

            <div className="space-y-4 relative z-10">
              <div className="serif text-champagne text-3xl italic tracking-wide text-shadow-gold">
                Invitation Logged
              </div>
              <p className="text-white/40 text-[10px] tracking-[0.3em] uppercase leading-relaxed font-light max-w-sm mx-auto">
                Your credentials have been securely added to the waitlist. 
                Our system will notify you once a slot becomes available.
              </p>
            </div>

            <div className="pt-8 space-y-4">
               <div className="h-[1px] w-12 bg-champagne/20 mx-auto" />
               <p className="text-[9px] tracking-widest text-white/30 uppercase italic">already have an invite?</p>
               <Link 
                 href="/auth" 
                 className="text-[10px] tracking-[0.4em] text-champagne hover:text-white transition-colors block uppercase"
               >
                 Go to Member Lounge
               </Link>
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}
