import 'package:flutter/material.dart';
import 'package:frontend_apps/ui/widgets/alert_helper.dart';
import 'package:frontend_apps/ui/widgets/constants.dart';
import 'package:frontend_apps/ui/widgets/widgets.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  late TextEditingController _mail;
  late TextEditingController _pwd;
  late TextEditingController _name;
  late TextEditingController _surname;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _mail = TextEditingController();
    _pwd = TextEditingController();
    _name = TextEditingController();
    _surname = TextEditingController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _mail.dispose();
    _pwd.dispose();
    _name.dispose();
    _surname.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      /// [NotificationListener] notified about the current scroll position
      /// you can wrap the Scrollable in a NotificationListener to listen for ScrollNotification
      body: NotificationListener(
        child: InkWell(
          onTap: keyBoards,
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
                      pageController: _pageController,), top: 25.0, bottom: 25.0,),
                    Expanded(flex: 2, child: PageView(controller: _pageController, children: [logView(0), logView(2)],),
                    ),
                  ],
                ),
              )
            ),
          ),
        ),
      ),
    );
  }

  Widget logView(int index) {
    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Column(
        children: [
          PaddingWith(widget: Card(
            elevation: 7.5,
            color: white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0),),
             child: PaddingWith(widget: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: listItems(index == 0),
               ), left: 15.0, right: 15.0,),
          ),
          top: 15.0, bottom: 15.0,),
          PaddingWith(widget: Card(
            elevation: 7.5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              width: 350.0,
              height: 60.0,
              decoration: MyGradiant(startColor: baseAccent, endColor: base, radius: 20.0, isHorizontal: true),
              child: MaterialButton(
                  onPressed: (){
                    signIn(index == 0);
                  },
                child: MyText((index == 0) ? "Se connecter" : "Creer un compte",),
              ),
            ),
          ), top: 25.0, bottom: 25.0,)
        ],
      ),
    );
  }

  List<Widget> listItems(bool exists) {
    List<Widget> list = [];

    if(!exists){
      list.add(MyTextFiled(controller: _name, hint: "Entrer votre nom",));
      list.add(MyTextFiled(controller: _surname, hint: "Entrer votre prenom",));
    }
    list.add(MyTextFiled(controller: _mail, hint: "Entrer votre adresse mail", type: TextInputType.emailAddress,));
    list.add(MyTextFiled(controller: _pwd, hint: "Entrer votre mot de passe", obscure: true ,));

    return list;
  }

  void signIn (bool exists) {
    keyBoards();

    if(_mail.text != "") {
      if(_pwd.text != "") {
        if(exists) {
          // connection
          AlertHelper().error(context, "Tout est ok");
        }else{
           // verifier nom et premon puis inscription
          if(_name.text != "") {
            if(_surname.text != "") {
              AlertHelper().error(context, "Tout est ok");
            }else{
              // entrer votre prenom
              AlertHelper().error(context, "Entrer votre prenom");
            }
          }else{
            // ENtrer votre nom
            AlertHelper().error(context, "Entrer votre nom");
          }
        }
      }else{
        // Alert entrer votre mot de passe
        AlertHelper().error(context, "Entrer votre mot de passe");
      }
    }else{
      // Alert entrer votre adresse mail
      AlertHelper().error(context, "Entrer votre adresse mail");
    }



  }

  void keyBoards(){
    FocusScope.of(context).requestFocus(FocusNode());
  }


}
