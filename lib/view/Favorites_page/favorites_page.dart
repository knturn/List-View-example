import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
part 'favorites_page_string.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key, required this.favorites}) : super(key: key);
  final Set<WordPair> favorites;
  @override
  // ignore: no_logic_in_create_state
  _FavoritesPageState createState() => _FavoritesPageState(favorites);
}

class _FavoritesPageState extends State<FavoritesPage> {
  _FavoritesPageState(this.favorites);
  FavoritesString alltext = FavoritesString();
  final Set<WordPair> favorites;

  @override
  Widget build(BuildContext context) {
    final List<WordPair> favoriteslist = favorites.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(alltext.favoritesPageTitle),
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) =>
              const Divider(color: Colors.red),
          itemCount: favoriteslist.length,
          itemBuilder: (context, index) {
            WordPair name = favoriteslist[index];
            return ListTile(
              title: Text(name.asPascalCase),
            );
          }),
    );
  }
}
