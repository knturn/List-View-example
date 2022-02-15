import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:homework_1/view/Favorites_page/favorites_page.dart';

part 'home_string.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _HomeString appText = _HomeString();
  final suggestions = <WordPair>[];
  final saved = <WordPair>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: createAppBar(context), body: createBody());
  }

  AppBar createAppBar(BuildContext context) {
    return AppBar(
      title: Text(appText.homePageTitle),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FavoritesPage(favorites: saved)),
            );
          },
          icon: const Icon(Icons.favorite, color: Colors.red),
        )
      ],
    );
  }

  Widget createBody() {
    suggestions.addAll(generateWordPairs().take(100));
    return ListView.separated(
        separatorBuilder: (context, index) => const Divider(color: Colors.red),
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          WordPair name = suggestions[index];
          final isfavorited = saved.contains(name);
          return ListTile(
            title: Text(name.asPascalCase),
            trailing: IconButton(
              icon: Icon(
                  isfavorited ? Icons.favorite : Icons.favorite_border_sharp),
              color: isfavorited ? Colors.orange : null,
              onPressed: () {
                setState(() {
                  if (saved.contains(name)) {
                    saved.remove(name);
                  } else {
                    saved.add(name);
                  }
                });
              },
            ),
          );
        });
  }
}
