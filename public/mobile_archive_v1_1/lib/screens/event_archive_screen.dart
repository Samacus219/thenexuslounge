import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class EventArchiveScreen extends StatelessWidget {
  final String groupId;
  const EventArchiveScreen({super.key, required this.groupId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _buildArchiveHeader(),
              _buildArchiveGrid(),
            ],
          ),
          _buildContributeButton(),
        ],
      ),
    );
  }

  Widget _buildArchiveHeader() {
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: const Text(
          "T H E  A R C H I V E",
          style: TextStyle(
            color: Color(0xFFF7E7CE),
            fontSize: 14,
            letterSpacing: 4.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        background: ShaderMask(
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black.withOpacity(0.4), Colors.black],
          ).createShader(rect),
          blendMode: BlendMode.dstIn,
          child: Container(
            color: const Color(0xFF131313), // Placeholder for Cinematic Hero Image
            child: const Center(
              child: Icon(Icons.auto_awesome_outlined, color: Colors.white12, size: 60),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildArchiveGrid() {
    return SliverPadding(
      padding: const EdgeInsets.all(12),
      sliver: SliverMasonryGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        itemBuilder: (context, index) {
          return _buildMemoryTile(index);
        },
        childCount: 12, // Initially loading the most recent high-res memories
      ),
    );
  }

  Widget _buildMemoryTile(int index) {
    // 🎨 Masonry Aesthetic: Varied heights, soft corners, zero social noise
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AspectRatio(
          aspectRatio: index.isEven ? 0.8 : 1.2, // Creating the curated staggered look
          child: Container(
            color: const Color(0xFF1E1E1E),
            child: Center(
              child: Icon(Icons.image_outlined, color: Colors.white.withOpacity(0.1)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContributeButton() {
    return Positioned(
      bottom: 40,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: const Color(0xFFF7E7CE).withOpacity(0.4)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFF7E7CE).withOpacity(0.05),
                blurRadius: 20,
              )
            ],
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add, color: Color(0xFFF7E7CE), size: 18),
              SizedBox(width: 12),
              Text(
                "Contribute to the Archive",
                style: TextStyle(
                  color: Color(0xFFF7E7CE),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
