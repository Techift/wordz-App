
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'words.dart';
import 'wordz_home.dart';
import 'wordz_favorite.dart';

void main() {
  runApp(const WordzApp());
}

class WordzApp extends StatefulWidget {
  const WordzApp({super.key});

  @override
  State<WordzApp> createState() => _WordzAppState();
}

class _WordzAppState extends State<WordzApp> {
  int currentIndex = 0;
  int selectedTab = 0;

  Set<String> likedWords = {};

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      likedWords =
          (prefs.getStringList('likedWords') ?? []).toSet();
    });
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(
      'likedWords',
      likedWords.toList(),
    );
  }

  void toggleLike(String word) {
    setState(() {
      if (likedWords.contains(word)) {
        likedWords.remove(word);
      } else {
        likedWords.add(word);
      }
    });

    saveFavorites();
  }

  void nextWord() {
    setState(() {
      currentIndex = (currentIndex + 1) % words.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 247, 157, 202),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC00063),
        ),
      ),

      home: Scaffold(
        body: SafeArea(
          child: selectedTab == 0
              ? WordzHome(
                  word: words[currentIndex],
                  isLiked: likedWords.contains(
                    words[currentIndex].name,
                  ),
                  onLike: () {
                    toggleLike(words[currentIndex].name);
                  },
                  onNext: nextWord,
                )
              : WordzFavorite(
                  likedWords: likedWords,
                  onRemove: toggleLike,
                ),
        ),

        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedTab,
          backgroundColor: const Color(0xFFFFF9FC),
          indicatorColor: const Color(0xFFFFD9E2),

          onDestinationSelected: (index) {
            setState(() {
              selectedTab = index;
            });
          },

          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_outline),
              selectedIcon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
          ],
        ),
      ),
    );
  }
}
