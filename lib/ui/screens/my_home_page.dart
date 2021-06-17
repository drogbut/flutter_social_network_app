import 'package:flutter/material.dart';
import 'package:frontend_apps/constants.dart';
import 'package:frontend_apps/ui/widgets/widgets.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: NotificationListener(
        child: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            height: (screenHeight >= 650.0) ? screenHeight : 650,
            decoration: MyGradiant(startColor: base, endColor: baseAccent),
            child: SafeArea(
              child: Column(
                children: [
                  PaddingWith(widget: Image(image: logoImage, height: 100,), top: 25.0,),
                  PaddingWith(widget: Menu2Items(item1: "Connexion", item2: "Creation",
                    pageController: _pageController,
                  ), top: 25.0, bottom: 25.0,
                  ),
                  Expanded(
                    flex: 2,
                    child: PageView(
                      controller: _pageController,
                      children: [logView(0), logView(2)],
                    ),
                  ),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }

  Widget logView(int index) {
    return Container(
      color: (index == 0) ? pointer : white,
    );
  }
}
