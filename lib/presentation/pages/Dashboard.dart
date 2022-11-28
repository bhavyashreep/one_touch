import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_touch/Providers/HomeProvider.dart';

import 'package:one_touch/presentation/common/SearchBox.dart';

import 'package:one_touch/presentation/common/TitleBarHome.dart';
import 'package:one_touch/presentation/pages/Notifications.dart';

import 'package:one_touch/presentation/components/Categories.dart';
import 'package:one_touch/presentation/components/DrawerComponent.dart';
import 'package:one_touch/presentation/components/HomeSlider.dart';
import 'package:one_touch/presentation/components/MainMenu.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PageController _controller = PageController();
  var token;
  final scrollController=ScrollController();

@override
  initState() {
    super.initState();
    scrollController.addListener((){
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
      print(" scrolling ends");
        Provider.of<HomeProvider>(context, listen: false).getCategories();
      print(" scrolling ends again");



      }else{
      print(" scrolling scrolling");

      }
    });
    var data =
        Provider.of<HomeProvider>(context, listen: false).getCategories();
        // Provider.of<HomeProvider>(context, listen: false).getProfile();
        checkLoggedIn();

  }

  
  @override
  Future<void> checkLoggedIn() async {
    final viewData2 = await SharedPreferences.getInstance();
    setState(() {
      token = viewData2.getString('token');
    });
    if(viewData2.getString('token')!=null){
      Provider.of<HomeProvider>(context, listen: false).getProfile();
    }
    print("view $token");
  }
  Widget build(BuildContext context) {

    var data = Provider.of<HomeProvider>(context);
      print(">>>>>>>>>>><<<<<<<<<<<<<<<<${data.profDetails.user.profile.mobile}");

    
    return Scaffold(
      // appBar: AppBar(),
      drawer: Drawer(
        child: DrawerComponent(),
      ),
      body: 
        data.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Color(0xff39C7A5),
                ),
              )
            :
           RefreshIndicator(
              onRefresh: <Null>() async {
                // data.fetchCategories();
              },
              child: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         TitleBarHome(tokenn: token,details:data.profDetails.user,),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, top: 10),
                          child: Row(children: [
                            const Text(
                              "Hello,",
                              style: TextStyle(
                                  color: Color(0xff1C1D20),
                                  fontSize: 38,
                                  fontWeight: FontWeight.w400),
                            ),
                           token!=null?
                            Text(
                              " "+data.profDetails.user.profile.userName,
                              style: TextStyle(
                                  color: Color(0xff1C1D20),
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700),
                            ):SizedBox()
                          ]),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, bottom: 16),
                          // child: Text(
                          //   "Lorem ipsum dolor sit amet",
                          //   style: TextStyle(color: Color(0xff999DA0)),
                          // ),
                        ),
                        const SizedBox(
                          height: 21,
                        ),
                        const SearchBox(),
                        const SizedBox(
                          height: 35,
                        ),
                        Container(
                            height: 140,
                            // width: 200,
                            child: HomeSlider(controller: _controller)),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: SmoothPageIndicator(
                            controller: _controller,
                            count: data.homePageData.offers.length,
                            effect: WormEffect(
                              dotHeight: 6,
                              dotWidth: 6,
                              activeDotColor: Color(0xff39C7A5),
                              type: WormType.thin,
                              // strokeWidth: 5,
                            ),
                          ),
                        ),
                        // Image.asset("assets/images/banner.png"),
                        SizedBox(
                          height: 30,
                        ),
                        MainMenu(),

                        Padding(
                            padding: const EdgeInsets.only(bottom: 20, top: 20),
                            child: Text("Categories",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500))),
                        Categories()
                      ]),
                ),
              ),
            ),
    );
  }
  Future<void> fetchPosts() async{
void _scrollController(){

  }
}
}

