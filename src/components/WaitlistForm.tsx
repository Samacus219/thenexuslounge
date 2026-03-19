'use client';

import { useState } from 'react';
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
            initial={{ opacity: 0, y: 10 }}
            animate={{ opacity: 1, y: 0 }}
            className="text-center space-y-4 py-8"
          >
            <div className="serif text-champagne text-2xl italic tracking-wide">
              Invitation Logged
            </div>
            <p className="text-white/40 text-[10px] tracking-[0.2em] uppercase leading-relaxed font-light">
              Your credentials have been securely added to the waitlist. <br />
              Nova will notify you when a lounge becomes available.
            </p>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}
