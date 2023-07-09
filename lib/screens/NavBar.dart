import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rrq_news/screens/bookmarks_screen.dart';
import 'package:rrq_news/screens/helpcenter_screen.dart';

import '../auth.dart';
import '../widget_tree.dart';

class NavBar extends StatelessWidget {
  final User? user = Auth().currentUser;

  Future<void> signOut(BuildContext context) async {
    await Auth().signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => WidgetTree()),
      (Route<dynamic> route) => false,
    );
  }

  get bookmarkedArticles => null;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              user?.displayName ?? '',
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      user?.email ?? '',
                      style: TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/john.gif',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/kingrrq.jpg',
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.bookmark),
            title: Text('Bookmarks'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BookmarksScreen(
                bookmarkedArticles: [],
              ),
            )),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Help Center'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ChatPage(),
            )),
          ),
          Divider(),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => signOut(context),
          ),
        ],
      ),
    );
  }
}
