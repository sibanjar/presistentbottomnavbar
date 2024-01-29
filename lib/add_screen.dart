import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AddScreen extends StatelessWidget {
  const AddScreen(
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
            Center(
              child: IconButton(
                onPressed: () {
                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    settings: const RouteSettings(name: "/home"),
                    screen: const AddScreen1(),
                    withNavBar: false,
                    pageTransitionAnimation:
                    PageTransitionAnimation.fade,
                  );
                },
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,

                ),
                icon: const Icon(Icons.add,size: 30,),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(child: Text('Press It',style: TextStyle(color: Colors.white),)),
          ],
        ),
      ),
    ),
  );
}
class AddScreen1 extends StatelessWidget {
  const AddScreen1({super.key}) ;

  @override
  Widget build(final BuildContext context) => Scaffold(
    backgroundColor: Colors.deepOrangeAccent,
    body: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          "Go Back to Second Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}