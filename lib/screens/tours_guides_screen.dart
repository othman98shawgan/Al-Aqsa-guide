import 'package:flutter/material.dart';
import 'package:alaqsa_visitor_guide/screens/guides_screen.dart';
import 'package:alaqsa_visitor_guide/screens/tours_screen.dart';

class ToursGuidesScreen extends StatefulWidget {
  const ToursGuidesScreen({super.key});

  @override
  State<ToursGuidesScreen> createState() => _ToursGuidesScreenState();
}

class _ToursGuidesScreenState extends State<ToursGuidesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              // This is the scrollable header
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: Theme.of(context).primaryColor,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Guided Tours',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Explore Al-Aqsa Mosque with our knowledgeable guides who will provide historical context, cultural insights, and spiritual significance of this sacred site.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // This is the pinned tab bar
              SliverPersistentHeader(
                pinned: true,
                delegate: _TabBarDelegate(
                  TabBar(
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Theme.of(context).primaryColor,
                    tabs: [
                      Tab(text: "Tours"),
                      Tab(text: "Guides"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              ToursScreen(),
              GuidesScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

// Helper class to make the TabBar sticky
class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _TabBarDelegate(this._tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white, // TabBar background color
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
