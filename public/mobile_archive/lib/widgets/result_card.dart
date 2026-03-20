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
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: NexusTheme.charcoal,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: widget.isSelected ? NexusTheme.champagne : NexusTheme.glassWhite,
          width: 1,
        ),
        boxShadow: widget.isSelected ? [
          BoxShadow(
            color: NexusTheme.champagne.withOpacity(0.1),
            blurRadius: 40,
            spreadRadius: 2,
          )
        ] : [],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Stack(
          children: [
            // 📸 THE HERO (4:5 ASPECT RATIO)
            Positioned.fill(
              child: Image.network(
                widget.option.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: CircularProgressIndicator(color: NexusTheme.champagne.withOpacity(0.2), strokeWidth: 1));
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
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(0.4),
                      Colors.transparent,
                    ],
                    stops: const [0.1, 0.5, 0.8],
                  ),
                ),
              ),
            ),

            // ✍️ THE TYPOGRAPHY HIERARCHY
            Positioned(
              bottom: 32,
              left: 32,
              right: 32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.option.location.toUpperCase(),
                    style: const TextStyle(color: NexusTheme.champagne, fontSize: 10, letterSpacing: 4, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text(widget.option.title,
                    style: const TextStyle(
                      fontFamily: 'Serif', // Fallback, will be Playfair in final build
                      color: Colors.white,
                      fontSize: 32,
                      fontStyle: FontStyle.italic,
                      letterSpacing: -1,
                    )),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(widget.option.price,
                        style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w200, letterSpacing: 1)),
                      const Spacer(),
                      // 🌬️ IN-BUILT CHIPS
                      ...widget.option.highlights.map((h) => Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: NexusTheme.glassDecoration.copyWith(borderRadius: BorderRadius.circular(8)),
                        child: Text(h, style: const TextStyle(color: NexusTheme.champagne, fontSize: 8, fontWeight: FontWeight.bold)),
                      )),
                    ],
                  ),
                ],
              ),
            ),

            // 💍 THE SOCIAL SIGNATURE (CONSENSUS RING)
            Positioned(
              top: 24,
              right: 24,
              child: GestureDetector(
                onTap: () {
                  HapticFeedback.lightImpact(); // 🌬️ SYNCED HAPTIC
                  widget.onToggleSelection();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.isSelected ? NexusTheme.champagne : Colors.black.withOpacity(0.5),
                    border: Border.all(
                      color: widget.isSelected ? NexusTheme.champagne : NexusTheme.champagne.withOpacity(0.4),
                      width: 1.5,
                    ),
                    boxShadow: widget.isSelected ? [
                      BoxShadow(color: NexusTheme.champagne.withOpacity(0.3), blurRadius: 15, spreadRadius: 2)
                    ] : [],
                  ),
                  child: Icon(
                    widget.isSelected ? Icons.check : Icons.circle_outlined,
                    color: widget.isSelected ? NexusTheme.black : NexusTheme.champagne,
                    size: 20,
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
