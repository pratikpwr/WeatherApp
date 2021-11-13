import 'package:app/src/config/color_const.dart';
import 'package:app/src/views/views.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    FavScreen(),
    HistoryScreen(),
    MapScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_selectedIndex].currentState!.maybePop();

        debugPrint(
            'isFirstRouteInCurrentTab: ' + isFirstRouteInCurrentTab.toString());

        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: ColorConstants.iconColor,
          unselectedItemColor: Colors.grey[500],
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          selectedLabelStyle: GoogleFonts.poppins(),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_rounded,
                ),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.book,
                ),
                label: "History"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.map_rounded,
                ),
                label: "Maps"),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/bottomNavBar': (context) {
        return [HomeScreen(), FavScreen(), HistoryScreen(), MapScreen()]
            .elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    Map<String, Widget Function(BuildContext)> routeBuilders =
        _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (RouteSettings routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}
