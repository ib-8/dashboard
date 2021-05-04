import 'package:flutter/material.dart';

class Howdy extends StatefulWidget {
  @override
  _HowdyState createState() => _HowdyState();
}

class _HowdyState extends State<Howdy> with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, initialIndex: 0, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (_, __) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              pinned: true,
              title: Text('Howdy'),
              bottom: TabBar(
                controller: tabController,
                tabs: [
                  Tab(text: 'CHATS'),
                  Tab(text: 'STATUS'),
                  Tab(text: 'CALLS'),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: [
            Container(
              height: 900,
            ),
            Container(),
            Container(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
