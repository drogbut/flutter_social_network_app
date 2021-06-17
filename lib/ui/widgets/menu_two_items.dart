import 'package:flutter/material.dart';
import '../../constants.dart';

class Menu2Items extends StatelessWidget {
  final String item1, item2;
  final PageController pageController;

  const Menu2Items(
      {Key? key,
      required this.item1,
      required this.item2,
      required this.pageController})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50,
      decoration: BoxDecoration(
          color: pointer,
          borderRadius: BorderRadius.all(Radius.circular(25.0))),
      child: Row(
        children: [itemButton(item1), itemButton(item2)],
      ),
    );
  }

  Expanded itemButton(String name) {
    return Expanded(child: MaterialButton(
      onPressed: () {
        int page = (pageController.page == 0.0) ? 1 : 0;
        pageController.animateToPage(page,
            duration: Duration(microseconds: 500), curve: Curves.decelerate);
      },
      child: Text(name),
    ));
  }
}
