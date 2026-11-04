
import 'package:flutter/material.dart';
import 'words.dart';

class WordzHome extends StatelessWidget {
  final Word word;
  final bool isLiked;
  final VoidCallback onLike;
  final VoidCallback onNext;

  const WordzHome({
    super.key,
    required this.word,
    required this.isLiked,
    required this.onLike,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              'WORDZ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
                color: Color(0xFFC00063),
              ),
            ),

            const SizedBox(height: 35),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 35,
              ),

              decoration: BoxDecoration(
                color: const Color(0xFFC00063),
                borderRadius: BorderRadius.circular(18),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                children: [

                  Text(
                    word.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    word.meaning,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton.icon(
                  onPressed: onLike,

                  icon: Icon(
                    isLiked
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),

                  label: Text(
                    isLiked ? 'Liked' : 'Like',
                  ),

                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFFC00063),
                    backgroundColor: const Color(0xFFFFF0F5),
                    elevation: 1,
                  ),
                ),

                const SizedBox(width: 12),

                ElevatedButton(
                  onPressed: onNext,

                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFFC00063),
                    backgroundColor: const Color(0xFFFFF0F5),
                    elevation: 1,
                  ),

                  child: const Text('Next →'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
