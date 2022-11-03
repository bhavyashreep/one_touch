import 'dart:io';

import 'package:flutter/material.dart';
import 'package:one_touch/Providers/HomeProvider.dart';
import 'package:one_touch/infrastructure/firebase.dart';
import 'package:one_touch/presentation/components/Categories.dart';
import 'package:one_touch/presentation/pages/Login/textfield.dart';
// import 'package:happy_bump/presentation/Subscription_changes/plan_list.dart';
// import 'package:happy_bump/presentation/signup/dateform.dart';
// import 'package:happy_bump/presentation/signup/subscription.dart';
// import 'package:happy_bump/presentation/signup/textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
// import 'package:geolocator/geolocator.dart';

class RegisterForm extends StatefulWidget {
  final number;
  RegisterForm({required this.number});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  initState() {
    super.initState();
    var data =
        Provider.of<HomeProvider>(context, listen: false).getCategories();
    // getLocation();
  }

  @override
  Authentication authentication = Authentication();
  final ImagePicker _picker = ImagePicker();
  File pickedImage = File("");
  
  bool isPicked = false;
  final nameController = new TextEditingController();
  final emailController = new TextEditingController();
  final numberController = new TextEditingController();
  final locationController = new TextEditingController();
  String selecteCategory = "";
  late var lat=0.0;
  late var lng=0.0;

  var _formKey = GlobalKey<FormState>();

  // void getLocation() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.low);
  //   print(position.latitude);
  //   print(position.longitude);
  //   lat = position.latitude;
  //   lng = position.longitude;
  // }

  void openGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage = File(image.path);
      setState(() {
        isPicked = true;
      });
    }
  }

  Widget build(BuildContext context) {
    var data = Provider.of<HomeProvider>(context);

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                // alignment: Alignment.topCenter,
                child: Text(
                  'Registration',
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                    // height: MediaQuery.of(context).size.height / 2,
                    color: Colors.white60,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 38.0,
                          ),
                          isPicked
                              ? Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      openGallery();
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.file(
                                        pickedImage,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )
                              : Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.0),
                                    child: Container(
                                      // padding: EdgeInsets.only(right: 10),
                                      color: Colors.grey[300],
                                      height: 100,
                                      width: 100,
                                      child: GestureDetector(
                                        child:
                                            //  imageList.isEmpty || imageList.length <= 1
                                            //     ?
                                            Center(
                                          child: new Icon(
                                            Icons.person_rounded,
                                            color: Colors.white70,
                                            size: 70,
                                          ),
                                        ),
                                        //   : Image.file(imageList[1]),
                                        onTap: () {
                                          openGallery();
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: 58.0,
                          ),
                          Text(
                            'NAME',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          InputForm(
                            passedContoller: nameController,
                            type: TextInputType.text,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'EMAIL',
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          InputForm(
                            passedContoller: emailController,
                            type: TextInputType.text,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'WHATSAPP NUMBER',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          InputForm2(
                            passedContoller: numberController,
                            type: TextInputType.number,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'LOCATION',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          InputForm(
                            passedContoller: locationController,
                            type: TextInputType.text,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'CATEGORY',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          data.homePageData.categories == null ||
                                  data.homePageData.categories.length == 0
                              ? SizedBox()
                              : Container(
                                  height: 58,
                                  // color: Color.fromRGBO(96, 36, 57, 0.08),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .white, //background color of dropdown button
                                      border: Border.all(
                                          color: Color(0xffEEEEEE),
                                          width: 1), //border of dropdown button
                                      borderRadius: BorderRadius.circular(
                                          12), //border raiuds of dropdown button
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<dynamic>(
                                        // iconEnabledColor: Color(0xff602439),
                                        value: selecteCategory == "" ||
                                                selecteCategory == null
                                            ? data.homePageData.categories[0].id
                                            : selecteCategory,
                                        isExpanded: true,

                                        hint: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 12),
                                          child: Text(
                                            "Type of Request",
                                            style: TextStyle(
                                                color: Color(0xff602439)),
                                          ),
                                        ),
                                        items: (data.homePageData.categories)
                                            .map<DropdownMenuItem<String>>(
                                                (answer) {
                                          return DropdownMenuItem(
                                            value: answer.id,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(left: 12),
                                              child: Text(
                                                answer.categoryName,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            selecteCategory = value;
                                            // buildName = typeReqestList[value]["name"];
                                            print("$value id of compny");
                                          });
                                          // print(companyValue.runtimeType);
                                        },
                                      ),
                                    ),
                                  )),
                          SizedBox(
                            height: 18.0,
                          ),
                          data.isLoading
                              ? Container(
                                  margin: EdgeInsets.only(bottom: 36),
                                  height: 50.0,
                                  width: 325.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13.0),
                                      color: Color(0xff39C7A5)),
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.white,
                                  )))
                              : GestureDetector(
                                  onTap: () {
                                    print(
                                        "-------------------${locationController.text}"); // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) => PlanList()),
                                    // );
                                    final isValid =
                                        _formKey.currentState!.validate();
                                    if (!isValid) {
                                      return;
                                    }
                                    _formKey.currentState!.save();

                                    if (pickedImage.path == "") {
                                      authentication.displaySnackBar(
                                          "Please select your profile picture",
                                          context);
                                    } else {
                                      print("image ${pickedImage.path}");
                                      print("image ${numberController.text}");

                                      data.signUpData(
                                          selecteCategory == ""
                                              ? data
                                                  .homePageData.categories[0].id
                                              : selecteCategory,
                                          pickedImage,
                                          lat == "" ? "0000" : lat.toString(),
                                          lng == "" ? "0000" : lng.toString(),
                                          locationController.text,
                                          nameController.text,
                                          numberController.text,
                                          numberController.text,
                                          context);
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 36),
                                    height: 50.0,
                                    width: 325.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(13.0),
                                        color: Color(0xff39C7A5)),
                                    child: Center(
                                        child: Text(
                                      'Finish',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          letterSpacing: .5),
                                    )),
                                  ),
                                )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
