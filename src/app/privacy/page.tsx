export default function PrivacyPage() {
  return (
    <main className="min-h-screen bg-black text-white px-8 py-32 max-w-4xl mx-auto space-y-12">
      <h1 className="serif text-5xl text-champagne">Privacy Policy</h1>
      <div className="space-y-8 text-white/60 font-light leading-relaxed">
        <p>Nexus Concierge ("the App") respects your privacy. Our core business model is built on providing high-end travel facilitation, not data brokerage.</p>
        
        <h2 className="serif text-2xl text-white/90">Data Sovereignty</h2>
        <p>Your biometric data (FaceID/TouchID) is processed entirely within the local secure hardware enclave of your device. Nexus never receives or stores your biometric credentials.</p>
        
        <h2 className="serif text-2xl text-white/90">Travel Data & Affiliates</h2>
        <p>When searching for travel options, search parameters (destination, dates) are shared with our Tier-1 partners (Expedia, Booking, Agoda) via secure API calls. No personal identity is shared with these vendors until the moment of official booking.</p>
        
        <h2 className="serif text-2xl text-white/90">Stripe & Financial Safety</h2>
        <p>Payments are handled via Stripe Connect. Nexus does not store credit card numbers on its own servers.</p>
      </div>
    </main>
  );
}
