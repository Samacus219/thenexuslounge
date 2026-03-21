import 'package:flutter/material.dart';
import 'package:mobile/theme/nexus_theme.dart';

class DropBox extends StatefulWidget {
  final Function(String) onCommandSubmitted;

  const DropBox({super.key, required this.onCommandSubmitted});

  @override
  State<DropBox> createState() => _DropBoxState();
}

class _DropBoxState extends State<DropBox> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  final TextEditingController _textController = TextEditingController();
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_textController.text.trim().isNotEmpty) {
      widget.onCommandSubmitted(_textController.text.trim());
      _textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: NexusTheme.glassDecoration.copyWith(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: NexusTheme.champagne.withOpacity(0.05),
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              // 🎙️ THE CHAMPAGNE MICROPHONE (Dictation Priority)
              GestureDetector(
                onLongPressStart: (_) => setState(() => _isListening = true),
                onLongPressEnd: (_) => setState(() => _isListening = false),
                child: AnimatedBuilder(
                  animation: _pulseController,
                  builder: (context, child) {
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _isListening 
                          ? NexusTheme.champagne.withOpacity(0.2 + (_pulseController.value * 0.1))
                          : Colors.transparent,
                      ),
                      child: Icon(
                        _isListening ? Icons.graphic_eq : Icons.mic_none_outlined,
                        color: NexusTheme.champagne,
                        size: 28,
                      ),
                    );
                  },
                ),
              ),

              // 🖋️ THE COMMAND INPUT
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _textController,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.5,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Command Nova...', // Commanding Micro-copy
                      hintStyle: TextStyle(
                        color: Colors.white24,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 1,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    onSubmitted: (_) => _handleSubmit(),
                  ),
                ),
              ),

              // 🚀 THE SEND ACTION (Subtle)
              IconButton(
                onPressed: _handleSubmit,
                icon: const Icon(Icons.north_east, color: NexusTheme.champagne, size: 20),
                style: IconButton.styleFrom(
                  backgroundColor: NexusTheme.glassWhite,
                  padding: const EdgeInsets.all(12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
