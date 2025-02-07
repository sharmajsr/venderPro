import 'package:flutter/material.dart';
import 'package:vender_pro/pages/dashboard-page.dart';
import 'package:vender_pro/pages/my-websites-page.dart';
import 'package:vender_pro/pages/profile-page.dart';
import 'package:vender_pro/pages/select-category-page.dart';
import 'productlist-page.dart';

final GlobalKey<ScaffoldState> homeKey = new GlobalKey<ScaffoldState>();

class Home extends StatefulWidget {
  static const routeName = '/homePage';

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int selectedIndex = 0;
  void updateTabSelection(int index) {
    print(index);
    setState(() => selectedIndex = index);
  }

  final List<Widget> _widgets = [
    DashBoard(),
    MyWebsitesPage(),
    ProductList(),
    ProfilePage()
  ];
  final List<String> _title = [
    'Dashboard',
    'My Websites',
    'Products',
    'User Profile'
  ];
  final List<IconData> _bottomAppBar = [
    Icons.dashboard,
    Icons.web_asset,
    Icons.archive,
    Icons.account_circle
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(key: homeKey,
      appBar: AppBar(
        elevation: 3,
        title: Text(_title[selectedIndex]),
      ),
      body: _widgets[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(SelectCategory.routeName),
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Icon(Icons.add),
        ),
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                _bottomAppBar.length,
                (index) => Padding(
                      padding: index == 1
                          ? EdgeInsets.only(right: 25)
                          : index == 2
                              ? EdgeInsets.only(left: 25)
                              : EdgeInsets.all(5),
                      child: IconButton(
                        onPressed: () => updateTabSelection(index),
                        iconSize: 27.0,
                        icon: Icon(
                          _bottomAppBar[index],
                          color: selectedIndex == index
                              ? Colors.black //Theme.of(context).primaryColor
                              : Colors.grey.shade400,
                        ),
                      ),
                    )),
          ),
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
