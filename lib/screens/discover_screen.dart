import 'package:flutter/material.dart';
import 'package:rrq_news/widgets/image_container.dart';
import 'package:rrq_news/screens/screens.dart';

import '../models/article_model.dart';
import '../widgets/bottom_nav_bar.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  static const routeName = '/discover';

  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['News', 'Achievements', 'Match'];

    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        bottomNavigationBar: const BottomNavBar(index: 1),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            const _DiscoverNews(),
            _CategoryNews(tabs: tabs),
          ],
        ),
      ),
    );
  }
}

class _CategoryNews extends StatelessWidget {
  const _CategoryNews({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          indicatorColor: Colors.black,
          tabs: tabs
              .map(
                (tab) => Tab(
                  icon: Text(
                    tab,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
            children: tabs.map((tab) {
              if (tab == 'Achievements') {
                return _AchievementsContent();
              } else if (tab == 'Match') {
                return _TournamentsContent();
              } else {
                return _NewsContent();
              }
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Search',
              fillColor: Colors.grey.shade200,
              filled: true,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: const RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.tune,
                  color: Colors.grey,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _AchievementsContent extends StatelessWidget {
  const _AchievementsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const _AchievementCard(
          title: 'MPL SEASON 2',
          description: '2018 - 1st Place',
        ),
        const _AchievementCard(
          title: 'MPL SEASON 4',
          description: '2019 - 2nd Place',
        ),
        const _AchievementCard(
          title: 'MPL SEASON 5',
          description: '2020 - 1st Place',
        ),
        const _AchievementCard(
          title: 'MPL SEASON 6',
          description: '2020 - 1st Place',
        ),
        const _AchievementCard(
          title: 'MPL SEASON 8',
          description: '2021 - 2nd Place',
        ),
        const _AchievementCard(
          title: 'MPL SEASON 9',
          description: '2022 - 1st Place',
        ),
        const _AchievementCard(
          title: 'MPL SEASON 10',
          description: '2022 - 2nd Place',
        ),
      ],
    );
  }
}

class _TournamentsContent extends StatelessWidget {
  const _TournamentsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const _TournamentCard(
          title: 'H3RO E-SPORT 4.0',
          description: 'RRQ vs AE (1-2) LOSE ',
        ),
        const _TournamentCard(
          title: 'H3RO E-SPORT 4.0',
          description: 'RRQ vs AURA (0-2) LOSE ',
        ),
        const _TournamentCard(
          title: 'H3RO E-SPORT 4.0',
          description: 'RRQ vs ONIC (2-0) WIN ',
        ),
        const _TournamentCard(
          title: 'H3RO E-SPORT 4.0',
          description: 'RRQ vs EVOS (2-0) WIN ',
        ),
        const _TournamentCard(
          title: 'H3RO E-SPORT 4.0',
          description: 'RRQ vs BTR (0-2) LOSE ',
        ),
      ],
    );
  }
}

class _AchievementCard extends StatelessWidget {
  final String title;
  final String description;

  const _AchievementCard({
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        leading: Image.asset(
          'assets/MPL.png',
        ),
      ),
    );
  }
}

class _TournamentCard extends StatelessWidget {
  final String title;
  final String description;

  const _TournamentCard({
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        leading: Icon(Icons.sports_esports, color: Colors.blue),
      ),
    );
    // SizedBox(
    //   height: 10,
    // );
  }
}

class _NewsContent extends StatelessWidget {
  const _NewsContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final articles = Article.articles;
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              ArticleScreen.routeName,
              arguments: articles[index],
            );
          },
          child: Row(
            children: [
              ImageContainer(
                width: 80,
                height: 80,
                margin: const EdgeInsets.all(10.0),
                borderRadius: 5,
                imageUrl: articles[index].imageUrl,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      articles[index].title,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.schedule,
                          size: 18,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${DateTime.now().difference(articles[index].createdAt).inHours} hours ago',
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(width: 20),
                        const Icon(
                          Icons.visibility,
                          size: 18,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${articles[index].views} views',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
