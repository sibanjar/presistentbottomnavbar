import "package:flutter/material.dart";
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {super.key,required this.menuScreenContext,
        required this.onScreenHideButtonPressed,
        this.hideStatus = false});
  final BuildContext menuScreenContext;
  final VoidCallback onScreenHideButtonPressed;
  final bool hideStatus;

  @override
  Widget build(final BuildContext context) => SingleChildScrollView(
    child: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        backgroundColor: Colors.indigo,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: TextField(
                decoration: InputDecoration(hintText: "Test Text Field"),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    settings: const RouteSettings(name: "/home"),
                    screen: const HomeScreen2(key: Key('value'),),
                    pageTransitionAnimation:
                    PageTransitionAnimation.scaleRotate,
                  );
                },
                child: const Text(
                  "Go to home Screen 2->",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: onScreenHideButtonPressed,
                child: Text(
                  hideStatus
                      ? "Unhide Navigation Bar"
                      : "Hide Navigation Bar",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    ),
  );
}

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('hello'),),
    backgroundColor: Colors.teal,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              PersistentNavBarNavigator.pushNewScreen(context,
                  screen: const HomeScreen3());
            },
            child: const Text(
              "Go to home Screen 3",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Go Back to Home Screen",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}

class HomeScreen3 extends StatelessWidget {
  const HomeScreen3({super.key}) ;

  @override
  Widget build(final BuildContext context) => Scaffold(
    backgroundColor: Colors.deepOrangeAccent,
    body: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          "Go Back to HomeScreen 2",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

