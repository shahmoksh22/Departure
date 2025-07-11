import 'package:bhagavad_gita/views/screens/Verse_view.dart';
import 'package:bhagavad_gita/views/screens/bookmark_view.dart';
import 'package:bhagavad_gita/views/screens/chapter_view.dart';
import 'package:bhagavad_gita/views/screens/favorite_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xFFE8E5CE),
            leading: Image.asset("assets/images/Logo.png"),
            title: Text(
              "Bhagavad Gita",
              style: TextStyle(fontSize: 18),
            ),
            floating: true,
            centerTitle: true,
            bottom: TabBar(
              controller: tabController,
              tabs: const [
                Tab(
                  text: "Chapter",
                ),
                Tab(
                  text: "Verse's",
                ),
                Tab(
                  text: "Favorite",
                ),
                Tab(
                  text: "Bookmark",
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: tabController,
              children: [
                ChapterView(),
                VerseView(),
                FavoritePage(),
                BookmarkPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
