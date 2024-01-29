import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";
import "package:presistentbottomnavbar/home_screens.dart";

import "add_screen.dart";


void main() => runApp(const MyApp(key: Key('a'),));

// BuildContext testContext ;

class MyApp extends StatelessWidget {
  const MyApp({ required final Key key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => MaterialApp(
    title: "Persistent Bottom Navigation Bar example project",
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const MyHome(key: Key('0'),),
    initialRoute: "/",
    routes: {
      "/first": (final context) =>  const HomeScreen2(),
      "/second": (final context) =>  const HomeScreen3(),
    },
  );
}

class MyHome extends StatefulWidget {
  const MyHome({required final Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final _controller = PersistentTabController(initialIndex: 0);
  late bool _hideNavBar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _hideNavBar = false;
  }

  @override
  Widget build(final BuildContext context) =>

       PersistentTabView(
            context,
            hideNavigationBar: _hideNavBar,
            controller: _controller,
            screens: _buildScreens(context),
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: Colors.white,
            // Default is Colors.white.
            handleAndroidBackButtonPress: true,
            // Default is true.
            resizeToAvoidBottomInset: true,
            // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true,
            // Default is true.
            hideNavigationBarWhenKeyboardShows: true,
            // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle
                .style12,
      );

  List<Widget> _buildScreens(BuildContext context) {
    return [
      HomeScreen(
        menuScreenContext: context,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },

      ),
      HomeScreen(
        menuScreenContext: context,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },

      ),
      AddScreen(
        menuScreenContext: context,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },

      ),
      Container(),
      // SettingsScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [

      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            // '/login': (final context) => const LoginPage(),
          },
        ),
        // /Navigator.of(context).popUntil(ModalRoute.withName("/"));
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite_border),
        title: ("Login"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            // '/login': (final context) => const LoginPage(),
          },
        ),
        // /Navigator.of(context).popUntil(ModalRoute.withName("/"));
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add),
        title: ("add"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            // '/login': (final context) => const LoginPage(),
          },
        ),
        // /Navigator.of(context).popUntil(ModalRoute.withName("/"));
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.book),
        title: ("blog"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}