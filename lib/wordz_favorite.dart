
import 'package:flutter/material.dart';
import 'words.dart';

class WordzFavorite extends StatelessWidget {
  final Set<String> likedWords;
  final Function(String) onRemove;

  const WordzFavorite({
    super.key,
    required this.likedWords,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final favorites = words
        .where((word) => likedWords.contains(word.name))
        .toList();

    return Padding(
      padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 15),

          const Text(
            'Favorites ♥',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC00063),
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: favorites.isEmpty
                ? const Center(
                    child: Text(
                      'No favorite words yet ❤️\nStart exploring!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  )

                : ListView.builder(
                    itemCount: favorites.length,

                    itemBuilder: (context, index) {
                      final word = favorites[index];

                      return Card(
                        color: const Color(0xFFFFF9FC),
                        elevation: 0,
                        margin: const EdgeInsets.only(
                          bottom: 12,
                        ),

                        child: ListTile(
                          title: Text(
                            word.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          subtitle: Text(word.meaning),

                          trailing: IconButton(
                            icon: const Icon(
                              Icons.favorite,
                              color: Color(0xFFC00063),
                            ),

                            onPressed: () {
                              onRemove(word.name);
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
