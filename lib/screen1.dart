import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:z_food_ordering/detailScreen.dart';
import 'package:z_food_ordering/reusableCard.dart';
import 'package:z_food_ordering/reusableTabcard.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with SingleTickerProviderStateMixin {
  List<ReusableCard> _items = <ReusableCard>[];
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 500) {
        return WideLayout(items: _items);
      } else {
        return NarrowLayout(items: _items, tabController: _tabController);
      }
    });
  }
}

class WideLayout extends StatelessWidget {
  WideLayout({this.items});

  final List<ReusableCard> items;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.list,
            color: Colors.black,
            size: 35,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.account_circle_rounded,
                color: Colors.black,
                size: 35,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'SEARCH FOR ITEMS',
                  style: GoogleFonts.rubik(
                      fontSize: 30, fontWeight: FontWeight.w600),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[500],
                    ),
                    hintText: 'Search',
                    hintStyle: GoogleFonts.rubik(
                      fontSize: 20,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                Text(
                  'Recommended',
                  style: GoogleFonts.rubik(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    child: ListView.builder(
                      itemBuilder: (context, int i) {
                        if (i >= items.length) {
                          items.add(ReusableCard(
                            cardPrice: '20',
                            isHorizontal: true,
                            cardName: 'Wine',
                            cardIcon: Icons.wine_bar_sharp,
                            cardColor: Colors.deepPurpleAccent,
                          ));
                        }

                        return ReusableCard(
                          cardPrice: '20',
                          isHorizontal: true,
                          cardName: 'Wine',
                          cardIcon: Icons.wine_bar_sharp,
                          cardColor: Colors.deepPurpleAccent,
                        );
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

class NarrowLayout extends StatelessWidget {
  NarrowLayout({this.items, this.tabController});
  final List<ReusableCard> items;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.list,
            color: Colors.black,
            size: 35,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.account_circle_rounded,
                color: Colors.black,
                size: 35,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'SEARCH FOR ITEMS',
                style: GoogleFonts.rubik(
                    fontSize: 35, fontWeight: FontWeight.w600),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[500],
                  ),
                  hintText: 'Search',
                  hintStyle: GoogleFonts.rubik(
                    fontSize: 20,
                    color: Colors.grey[500],
                  ),
                ),
              ),
              Text(
                'Recommended',
                style: GoogleFonts.rubik(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  //    itemCount: _items.length,
                  itemBuilder: (context, int i) {
                    if (i >= items.length) {
                      items.add(
                        ReusableCard(
                          cardName: 'Ice-Cream',
                          cardColor: Colors.deepOrangeAccent[100],
                          cardIcon: Icons.icecream,
                          isHorizontal: true,
                          cardPrice: 'Rs.100',
                          onCardTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailScreen(
                                cardIcon: Icons.icecream,
                                cardName: 'Ice-Cream',
                              );
                            }));
                          },
                        ),
                      );
                    }
                    return ReusableCard(
                      cardName: 'Ice-Cream',
                      cardColor: Colors.deepOrangeAccent[100],
                      cardIcon: Icons.icecream,
                      isHorizontal: true,
                      cardPrice: 'Rs.100',
                      onCardTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailScreen(
                            cardIcon: Icons.icecream,
                            cardName: 'Ice-Cream',
                          );
                        }));
                      },
                    );
                  },
                ),
              ),
              // Container(
              //   height: 400,
              //   child: ListView.builder(itemBuilder: (context, int index) {
              //     return ReusableCard(
              //       cardIcon: Icons.wine_bar_sharp,
              //       cardColor: Colors.pink[100],
              //       cardName: 'Wine',
              //       isHorizontal: false,
              //       cardPrice: 'Rs.200',
              //     );
              //   }),
              // ),
              Container(
                child: TabBar(
                    controller: tabController,
                    isScrollable: true,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey.withOpacity(0.5),
                    labelStyle: GoogleFonts.rubik(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    unselectedLabelStyle: GoogleFonts.rubik(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Tab(
                        child: Text('FEATURED'),
                      ),
                      Tab(
                        child: Text('COMBO'),
                      ),
                      Tab(
                        child: Text('FAVOURITES'),
                      ),
                      Tab(
                        child: Text('OFFERS'),
                      ),
                    ]),
              ),
              Container(
                height: 400,
                child: TabBarView(
                  children: [
                    ListView.builder(itemBuilder: (context, int index) {
                      return ReusableTabCard(
                        cardName: 'Wine',
                        cardColor: Colors.deepOrangeAccent[100],
                        cardIcon: Icons.wine_bar,
                        cardPrice: 'Rs.300',
                      );
                    }),
                    ListView.builder(itemBuilder: (context, int index) {
                      return ReusableTabCard(
                        cardName: 'Wine',
                        cardColor: Colors.deepOrangeAccent[100],
                        cardIcon: Icons.wine_bar,
                        cardPrice: 'Rs.300',
                      );
                    }),
                    ListView.builder(itemBuilder: (context, int index) {
                      return ReusableTabCard(
                        cardName: 'Wine',
                        cardColor: Colors.deepOrangeAccent[100],
                        cardIcon: Icons.wine_bar,
                        cardPrice: 'Rs.300',
                      );
                    }),
                    ListView.builder(itemBuilder: (context, int index) {
                      return ReusableTabCard(
                        cardName: 'Wine',
                        cardColor: Colors.deepOrangeAccent[100],
                        cardIcon: Icons.wine_bar,
                        cardPrice: 'Rs.300',
                      );
                    }),
                  ],
                  controller: tabController,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
