// import 'package:flutter/material.dart';
// import 'package:one_touch/Providers/HomeProvider.dart';
// import 'package:one_touch/presentation/common/SearchBox.dart';
// import 'package:one_touch/presentation/common/TileType1.dart';
// import 'package:one_touch/presentation/common/TileType2.dart';
// import 'package:one_touch/presentation/common/TileType3.dart';
// import 'package:one_touch/presentation/common/TileType4.dart';
// import 'package:one_touch/presentation/common/TitleBar.dart';
// import 'package:provider/provider.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:url_launcher/url_launcher.dart';


// class News extends StatefulWidget {
//   const News({Key? key}) : super(key: key);

//   @override
//   State<News> createState() => _NewsState();
// }

// class _NewsState extends State<News> {
//   @override
//   initState() {
//     super.initState();
   
//         Provider.of<HomeProvider>(context, listen: false).getNews();
//   }
//   _launchURLBrowser(passedUrl) async {
//     var url = Uri.parse(passedUrl);
//     // if (await canLaunchUrl(url)) {
//     await launchUrl(url);
//     // } else {
//     //   throw 'Could not launch $url';
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var data2 = Provider.of<HomeProvider>(context);

//     return data2.isLoading?Center(child: CircularProgressIndicator(color: Color(0xff39C7A5),),):Scaffold(
//       body: SingleChildScrollView(
//           child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TitleBar(
//               title: "News",
//             ),
//             SizedBox(
//               height: 21,
//             ),
//             SearchBox(),
//             SizedBox(
//               height: 21,
//             ),
          
          
        
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 22),
//               child: Column(
//                   children: data2.news.news
//                       .map((e) => GestureDetector(
//                           onTap: () {
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(
//                             //     builder: (context) => Type2Expanded(
//                             //       item: e,
//                             //     ),
//                             //   ),
//                             // );
//                           },
//                           child: Container(
//       padding: EdgeInsets.symmetric(vertical: 12),
//       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//         Row(
//           children: [
//           e.image==""||e.image==null?SizedBox():  Container(
//               height: 73,
//               width: 73,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: CachedNetworkImage(
//                   fit: BoxFit.cover,
//                     errorWidget: (context, url, error) =>
//                         Image.asset("assets/images/default.png"),
//                     placeholder: (context, url) =>
//                         Image.asset("assets/images/default.png"),
//                     imageUrl:
//                         "http://137.184.74.132/api/files/${e.collectionId}/${e.id}/" +
//                             e.image),
//               ),
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
//             ),
//             SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(e.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
//                 Container(
//                   width:e.image==""||e.image==null? MediaQuery.of(context).size.width*0.66: MediaQuery.of(context).size.width*0.46,
//                   child: Text(
//                     e.decsription,
//                      maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(color: Color(0xff999DA0)),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         Row(
//           children: [
//             e.link != ""
//                 ? InkWell(
//                     onTap:(){_launchURLBrowser(e.link);} ,
//                     child:Text("View",style: TextStyle(color: Colors.blue),)
//                   )
//                 : const SizedBox(),
//             const SizedBox(
//               width: 20,
//             ),
            
//           ],
//         )
//       ]),
//     )))
//                       .toList()),
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }
