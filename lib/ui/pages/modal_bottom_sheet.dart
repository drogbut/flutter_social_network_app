

import 'dart:io';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_apps/bloc/fire_helper.dart';
import 'package:frontend_apps/ui/widgets/constants.dart';
import 'package:frontend_apps/ui/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';

class ModalBottomSheet extends StatefulWidget {

  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {

  late TextEditingController _textEditingController;
  File? imageTaken;
  File imageHelper = File("");
  ImagePicker imagePicker = new ImagePicker();


  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      color: base,
      child: Container(
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight:  Radius.circular(25.0),
            )
        ),
        child: InkWell(
          onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyText("Ecrivez quelque chose...", color: baseAccent, fontSize: 30,),
              Container(color: baseAccent, width: double.infinity, height: 1,),
              PaddingWith(widget: MyTextFiled(controller: _textEditingController, icon: writeIcon, hint: "Exprimez-vous",),
                right: 15.0, left: 15.0,),
              PaddingWith(
                widget: Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        IconButton(onPressed: (() async => takePicture(ImageSource.camera)), icon: cameraIcon),
                        IconButton(onPressed: (() async => takePicture(ImageSource.gallery)), icon: galleryIcon),
                      ],
                    ),
                    PaddingWith(
                      widget: Container(
                        color: baseAccent,
                         width: 150.0,
                           height: 100.0,
                           child: (imageTaken == null) ? Center(child: MyText("Aucune image", fontSize: 13.0,))
                               : Image.file(imageTaken!, fit: BoxFit.cover,)
                  ), right: 25.0,
                    ),
                  ],
                ),left: 50,
              ),
              PaddingWith(widget: MyButtonGradiant(onPressed: (() => sendToFirebase()),text: "Envoyer",))
            ],
          ),
        ),
      ),

    );
  }

  Future<void> takePicture(ImageSource source) async {
    final pickedFile  = await imagePicker.getImage(source: ImageSource.camera, maxWidth: 500.0,  maxHeight: 500.0);

    setState(() {
        imageTaken = File(pickedFile.path);
    });
  }

  sendToFirebase() {
    //File helper = File("");
    FocusScope.of(context).requestFocus(FocusNode());
    print("Debug ImageTaken =" + imageTaken.toString());
    if(imageTaken == null && (_textEditingController.text != "")){
      FireHelper().addPost(myUser!.uid!, _textEditingController.text, imageHelper);
    }
    else if(imageTaken != null && (_textEditingController.text != "")){
      FireHelper().addPost(myUser!.uid!, _textEditingController.text, imageTaken!);
    } else{
      print("Debug sendToFirebase: the text can't be an empty string. Nothing is sending to server");
    }
  }
}
