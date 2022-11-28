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
import 'package:geolocator/geolocator.dart';

class ItemAdd extends StatefulWidget {
  @override
  State<ItemAdd> createState() => _ItemAddState();
}

class _ItemAddState extends State<ItemAdd> {
  @override
  initState() {
    super.initState();

    Provider.of<HomeProvider>(context, listen: false).getCategories();

    getLocation();
  }

  @override
  Authentication authentication = Authentication();
  final ImagePicker _picker = ImagePicker();
  File pickedImage = File("");
  File pickedImage2 = File("");

  bool isPicked = false;
  bool isPicked2 = false;

  final nameController = new TextEditingController();
  final emailController = new TextEditingController();
  final numberController = new TextEditingController();
  final locationController = new TextEditingController();
  final descController = new TextEditingController();
  final itemController = new TextEditingController();
  final phoneController = new TextEditingController();

  var selectedSub = null;
  var selecteCategory = null;
  var selectedType = null;

  late var lat = 0.0;
  late var lng = 0.0;
  List types = ["contact", "item"];

  var _formKey = GlobalKey<FormState>();

  void getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    // return await Geolocator.getCurrentPosition();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(position.latitude);
    print(position.longitude);
    lat = position.latitude;
    lng = position.longitude;
  }

  void openGallery(e) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (e == "photo") {
        print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        pickedImage = File(image.path);
        setState(() {
          isPicked = true;
        });
      } else {
        print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<");

        pickedImage2 = File(image.path);
        setState(() {
          isPicked2 = true;
        });
      }
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
                  'Add a New Item',
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
                            height: 58.0,
                          ),

                          Text(
                            'TYPE',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButtonFormField<dynamic>(
                              validator: (value) => value == null
                                  ? "This field is required"
                                  : null,
                              // iconEnabledColor: Color(0xff602439),
                              value: selectedType,
                              isExpanded: true,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(top: 3, bottom: 3),
                                errorBorder: OutlineInputBorder(
                                    //<-- SEE HERE
                                    borderSide:
                                        BorderSide(color: Colors.red, width: 1),
                                    borderRadius: BorderRadius.circular(12)),
                                enabledBorder: OutlineInputBorder(
                                    //<-- SEE HERE
                                    borderSide: BorderSide(
                                        color: Color(0xffEEEEEE), width: 1),
                                    borderRadius: BorderRadius.circular(12)),
                                focusedBorder: OutlineInputBorder(
                                  //<-- SEE HERE
                                  borderSide: BorderSide(
                                      color: Color(0xffEEEEEE), width: 1),
                                ),
                              ),
                              hint: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  "Type",
                                ),
                              ),
                              items: (types)
                                  .map<DropdownMenuItem<String>>((answer) {
                                return DropdownMenuItem(
                                  value: answer,
                                  child: Container(
                                    padding: EdgeInsets.only(left: 12),
                                    child: Text(
                                      answer,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedType = value;
                                  // buildName = typeReqestList[value]["name"];
                                  print("$value id of compny");
                                });
                                // print(companyValue.runtimeType);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 18.0,
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
                              : DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField<dynamic>(
                                    // iconEnabledColor: Color(0xff602439),
                                    validator: (value) => value == null
                                        ? "This field is required"
                                        : null,
                                    value: selecteCategory,
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(top: 3, bottom: 3),
                                      errorBorder: OutlineInputBorder(
                                          //<-- SEE HERE
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      enabledBorder: OutlineInputBorder(
                                          //<-- SEE HERE
                                          borderSide: BorderSide(
                                              color: Color(0xffEEEEEE),
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      focusedBorder: OutlineInputBorder(
                                        //<-- SEE HERE
                                        borderSide: BorderSide(
                                            color: Color(0xffEEEEEE), width: 1),
                                      ),
                                    ),
                                    hint: Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Text(
                                        "Select A Category",
                                      ),
                                    ),
                                    items: (data.homePageData.categories)
                                        .map<DropdownMenuItem<String>>(
                                            (answer) {
                                      return DropdownMenuItem(
                                        value: answer.id,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 12),
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
                                      data.getCategory(value);
                                      // print(companyValue.runtimeType);
                                    },
                                  ),
                                ),
                          SizedBox(
                            height: 18.0,
                          ),
                          Text(
                            'SUB CATEGORY',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButtonFormField<dynamic>(
                              // iconEnabledColor: Color(0xff602439),
                              value: selectedSub,
                              validator: (value) => value == null
                                  ? "This field is required"
                                  : null,
                              isExpanded: true,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(top: 3, bottom: 3),
                                errorBorder: OutlineInputBorder(
                                    //<-- SEE HERE
                                    borderSide:
                                        BorderSide(color: Colors.red, width: 1),
                                    borderRadius: BorderRadius.circular(12)),
                                enabledBorder: OutlineInputBorder(
                                    //<-- SEE HERE
                                    borderSide: BorderSide(
                                        color: Color(0xffEEEEEE), width: 1),
                                    borderRadius: BorderRadius.circular(12)),
                                focusedBorder: OutlineInputBorder(
                                  //<-- SEE HERE
                                  borderSide: BorderSide(
                                      color: Color(0xffEEEEEE), width: 1),
                                ),
                              ),
                              hint: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  "Select Sub Category",
                                ),
                              ),
                              items: (data.category.subCategories)
                                  .map<DropdownMenuItem<String>>((answer) {
                                return DropdownMenuItem(
                                  value: answer["id"],
                                  child: Container(
                                    padding: EdgeInsets.only(left: 12),
                                    child: Text(
                                      answer["category_name"],
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedSub = value;
                                  // buildName = typeReqestList[value]["name"];
                                  print("$value id of compny");
                                });

                                // print(companyValue.runtimeType);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 18.0,
                          ),
                          selectedType == "contact"
                              ? SizedBox()
                              : Text(
                                  'SHORT DESCRIPTION',
                                  style: TextStyle(fontSize: 14.0),
                                ),
                          SizedBox(
                            height: 8.0,
                          ),
                          selectedType == "contact"
                              ? SizedBox()
                              : InputForm(
                                  passedContoller: descController,
                                  type: TextInputType.text,
                                ),

                          selectedType == "contact"
                              ? SizedBox()
                              : SizedBox(
                                  height: 18.0,
                                ),
                          Text(
                            "ITEM IMAGE",
                            style: TextStyle(fontSize: 14.0),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          isPicked2
                              ? GestureDetector(
                                  onTap: () {
                                    openGallery("image");
                                  },
                                  child: Image.file(
                                    pickedImage2,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
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
                                      openGallery("image");
                                    },
                                  ),
                                ),
                          SizedBox(
                            height: 18.0,
                          ),
                          Text(
                            'ITEM NAME',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          InputForm(
                            passedContoller: itemController,
                            type: TextInputType.text,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          // SizedBox(
                          //   height: 10.0,
                          // ),
                          Text(
                            'PHONE NUMBER',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          InputForm2(
                            passedContoller: phoneController,
                            type: TextInputType.number,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          // SizedBox(
                          //   height: 10.0,
                          // ),
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

                                    if (pickedImage2.path == "") {
                                      authentication.displaySnackBar(
                                          "Please select an item image",
                                          context);
                                    } else {
                                      print("image ${pickedImage.path}");
                                      print("image ${numberController.text}");
                                      print("lat $lat");
                                      print("lng $lng");
                                      print("lng $selecteCategory");
                                      data.addItem(
                                          phoneController.text,
                                          pickedImage2,
                                          selectedType,
                                          selecteCategory,
                                          selectedSub,
                                          itemController.text,
                                          descController.text==null?"":descController.text,
                                          locationController.text,
                                          numberController.text,
                                          lat == "" ? "0000" : lat.toString(),
                                          lng == "" ? "0000" : lng.toString(),
                                          context);
                                      // data.signUpData(
                                      //     widget.number,
                                      //     pickedImage,
                                      //     nameController.text,
                                      //     selectedType,
                                      //     selecteCategory == ""
                                      //         ? data
                                      //             .homePageData.categories[0].id
                                      //         : selecteCategory,
                                      //     selectedSub,
                                      //     itemController.text,
                                      //     pickedImage2,
                                      //     descController.text,

                                      //     locationController.text,
                                      //     numberController.text,
                                      //     lat == "" ? "0000" : lat.toString(),
                                      //     lng == "" ? "0000" : lng.toString(),
                                      //     context);
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
                                      'Save',
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
