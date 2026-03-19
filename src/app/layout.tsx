import type { Metadata } from "next";
import { Inter, Playfair_Display } from "next/font/google";
import "./globals.css";

const inter = Inter({ subsets: ["latin"], variable: "--font-inter" });
const playfair = Playfair_Display({ subsets: ["latin"], variable: "--font-playfair" });

export const metadata: Metadata = {
  title: "Nexus Concierge | The Pre-eminent Social Lounge",
  description: "Experience a culture of service. Nexus coordinates luxury retreats, group dining, and elite transit through effortless delegation and sentient curation.",
  keywords: ["luxury concierge bangkok", "group travel coordinator", "private concierge app", "exclusive retreat planning", "nexus lounge", "high-end social concierge"],
  metadataBase: new URL('https://www.thenexuslounge.com'),
  openGraph: {
    title: 'Nexus Concierge | The Project of Foresight',
    description: 'Coordinating elite social retreats through sentient curation.',
    url: 'https://www.thenexuslounge.com',
    siteName: 'Nexus Lounge',
    images: [
      {
        url: 'https://www.thenexuslounge.com/og-image.jpg',
        width: 1200,
        height: 630,
        alt: 'Nexus Private Concierge',
      },
    ],
    locale: 'en_US',
    type: 'website',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Nexus Concierge',
    description: 'The pre-eminent social concierge platform.',
    images: ['https://www.thenexuslounge.com/og-image.jpg'],
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={`${inter.variable} ${playfair.variable} antialiased`}>
        {children}
      </body>
    </html>
  );
}
