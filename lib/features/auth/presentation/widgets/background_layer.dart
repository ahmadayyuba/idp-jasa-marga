import 'package:flutter/material.dart';

class BackgroundLayer extends StatelessWidget {
  const BackgroundLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?q=80&w=1000',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: const Color(0xFF001E3C).withValues
          (alpha: 0.75),
        ),
      ],
    );
  }
}
