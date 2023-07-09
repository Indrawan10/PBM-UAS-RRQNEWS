import 'package:flutter/material.dart';

import '../widgets/image_container.dart';
import 'package:rrq_news/screens/article_screen.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({Key? key, required List bookmarkedArticles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[200],
        ),
        child: ListView.builder(
          itemCount: bookmarkedArticles.length,
          itemBuilder: (context, index) {
            final article = bookmarkedArticles[index];
            return ListTile(
              leading: ImageContainer(
                imageUrl: article.imageUrl,
                width: 50,
                height: 50,
              ),
              title: Text(article.title),
              subtitle: Text(article.subtitle),
            );
          },
        ),
      ),
    );
  }
}
