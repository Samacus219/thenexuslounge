import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/theme/nexus_theme.dart';

class ResultOption {
  final String id;
  final String title;
  final String location;
  final String price;
  final String imageUrl;
  final List<String> highlights;

  const ResultOption({
    required this.id,
    required this.title,
    required this.location,
    required this.price,
    required this.imageUrl,
    required this.highlights,
  });
}

class ConciergeResultCard extends StatefulWidget {
  final ResultOption option;
  final bool isSelected;
  final VoidCallback onToggleSelection;

  const ConciergeResultCard({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onToggleSelection,
  });

  @override
  State<ConciergeResultCard> createState() => _ConciergeResultCardState();
}

class _ConciergeResultCardState extends State<ConciergeResultCard> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 800), // 🌬️ SLOW UNHURRIED SLIDE
      curve: Curves.easeInOutExpo,
      width: MediaQuery.of(context).size.width * 0.82, // 💎 INCREASED BREATH
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 24), // 💎 INCREASED BREATH
      decoration: BoxDecoration(
        color: NexusTheme.charcoal.withOpacity(0.4),
        borderRadius: BorderRadius.circular(40), // 💎 AGGRESSIVE RADIUS
        border: Border.all(
          color: widget.isSelected ? NexusTheme.champagne : NexusTheme.champagne.withOpacity(0.12),
          width: 0.5,
        ),
        boxShadow: widget.isSelected ? [
          BoxShadow(
            color: NexusTheme.champagne.withOpacity(0.1),
            blurRadius: 80, // 🌑 INCREASED GLOW DEPTH
            spreadRadius: 4,
          )
        ] : [],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Stack(
          children: [
            // 📸 THE HERO (4:5 ASPECT RATIO)
            Positioned.fill(
              child: Image.network(
                widget.option.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: CircularProgressIndicator(color: NexusTheme.champagne.withOpacity(0.05), strokeWidth: 1));
                },
                errorBuilder: (context, error, stackTrace) => Container(color: NexusTheme.charcoal),
              ),
            ),

            // 🌑 THE GRADIENT OVERLAY (Bottom-to-Top Absolute Black)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.95), // 💎 INCREASED CONTRAST
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                    ],
                    stops: const [0.15, 0.5, 0.9],
                  ),
                ),
              ),
            ),

            // ✍️ THE TYPOGRAPHY HIERARCHY (Maximizing Breath)
            Positioned(
              bottom: 40, // 💎 INCREASED BREATH
              left: 40,
              right: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.option.location.toUpperCase(),
                    style: const TextStyle(
                      color: NexusTheme.champagne, 
                      fontSize: 8, 
                      letterSpacing: 4, 
                      fontWeight: FontWeight.bold,
                      height: 2.0, // 💎 MAXIMIZING BREATH
                    )),
                  const SizedBox(height: 16),
                  Text(widget.option.title,
                    style: const TextStyle(
                      fontFamily: 'Serif', 
                      color: Colors.white,
                      fontSize: 36, // 💎 SLIGHTLY LARGER FOR IMPACT
                      fontStyle: FontStyle.italic,
                      letterSpacing: -1,
                      height: 1.2,
                    )),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(widget.option.price,
                        style: const TextStyle(
                          color: Colors.white38, 
                          fontSize: 14, 
                          fontWeight: FontWeight.w200, 
                          letterSpacing: 1,
                        )),
                      const Spacer(),
                      ...widget.option.highlights.map((h) => Container(
                        margin: const EdgeInsets.only(left: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: NexusTheme.glassWhite, 
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: NexusTheme.champagne.withOpacity(0.1), width: 0.5),
                        ),
                        child: Text(h, style: const TextStyle(color: NexusTheme.champagne, fontSize: 8, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                      )),
                    ],
                  ),
                ],
              ),
            ),

            // 💍 THE SOCIAL SIGNATURE (CONSENSUS RING)
            Positioned(
              top: 32, // 💎 INCREASED BREATH
              right: 32,
              child: GestureDetector(
                onTap: () {
                  HapticFeedback.lightImpact(); 
                  widget.onToggleSelection();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.isSelected ? NexusTheme.champagne : Colors.black.withOpacity(0.4),
                    border: Border.all(
                      color: widget.isSelected ? NexusTheme.champagne : NexusTheme.champagne.withOpacity(0.35),
                      width: 0.5, // 🌬️ PRECISION BORDER
                    ),
                    boxShadow: widget.isSelected ? [
                      BoxShadow(color: NexusTheme.champagne.withOpacity(0.2), blurRadius: 25, spreadRadius: 4)
                    ] : [],
                  ),
                  child: Icon(
                    widget.isSelected ? Icons.check : Icons.circle_outlined,
                    color: widget.isSelected ? NexusTheme.black : NexusTheme.champagne,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
