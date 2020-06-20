import 'dart:convert';
import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gameapi/Screens/CrackStatusInfo.dart';
import 'package:gameapi/Screens/GameSearch.dart';
import 'package:gameapi/Screens/GenresCategory.dart';
import 'package:gameapi/Screens/PopularGameInfo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:gameapi/ScreenConfig.dart';


class GameHomePage extends StatefulWidget {
  @override
  _GameHomePageState createState() => _GameHomePageState();
}

class _GameHomePageState extends State<GameHomePage> {
  var catList = [
    "Popular",
    "Cracked",
    "Upcoming",
  ];
  var _isSelected = 0;

  final apiKey =
      "RAWG_API";
  final apiCrackedKey =
      "CRACKWATCH_API";
  final apiUpcomingKey = "CRACKWATCH_UPCOMING_API";

  Future getPopularData() async {
    final url = apiKey;
    final response = await http.get(url);
    final jsonPopularData = await jsonDecode(response.body);
   return jsonPopularData;
  }

  Future getCrackedData() async {
    final url = apiCrackedKey;
    final response = await http.get(url);
    final jsonCrackedData = await jsonDecode(response.body);
    return jsonCrackedData;
  }

  Future getUpcomingData() async {
    final url = apiUpcomingKey;
    final response = await http.get(url);
    final jsonUpcomingData = await jsonDecode(response.body);
    return jsonUpcomingData;
  }

  String genreApi = "RAWG_GENRE_API";

  Future getGenresData() async {
    final url = genreApi;
    final response = await http.get(url);
    final jsonGenresData = await jsonDecode(response.body);
    return jsonGenresData;
  }

  Future<bool> _onBackPressed() {
    exit(0);
  }


  @override
  void initState() {
    getPopularData();
    getCrackedData();
    getUpcomingData();
    getGenresData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: SizeConfig.blockSizeVertical * 100,
          width: SizeConfig.blockSizeHorizontal * 100,
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: SizeConfig.blockSizeVertical * 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Image(
                          image: AssetImage("images/skull.png"),
                          fit: BoxFit.cover,
                          height: SizeConfig.blockSizeVertical * 15,
                          width: SizeConfig.blockSizeHorizontal * 15,
                        )),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "S",
                                style: GoogleFonts.sonsieOne(
                                  color: Colors.red,
                                  fontSize: SizeConfig.blockSizeHorizontal * 7,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "kull",
                                style: GoogleFonts.creepster(
                                    color: Colors.white,
                                    fontSize: SizeConfig.blockSizeHorizontal * 7,
                                    letterSpacing: 2.0),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "H",
                                style: GoogleFonts.sonsieOne(
                                    color: Colors.red,
                                    fontSize: SizeConfig.blockSizeHorizontal * 7,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "unter",
                                style: GoogleFonts.creepster(
                                  color: Colors.white,
                                  letterSpacing: 2.0,
                                  fontSize: SizeConfig.blockSizeHorizontal * 7,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Text(
                            "Games",
                            style: GoogleFonts.sonsieOne(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeHorizontal * 7,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 4,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: SizeConfig.blockSizeVertical * 9,
                      width: SizeConfig.blockSizeHorizontal * 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: ListTile(
                          title: TextField(
                            onSubmitted: (gameName) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GameSearchPage(
                                            gameName: gameName,
                                            index: 0,
                                          )));
                            },
                            style: TextStyle(color: Colors.white, fontSize: SizeConfig.blockSizeVertical * 2),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.righteous(
                                color: Colors.white,
                              ),
                              enabledBorder: InputBorder.none,
                              hintText: "Search Games...",
                            ),
                          ),
                          leading: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal * 8,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(40.0))),
                                backgroundColor: Colors.black,
                                elevation: 10.0,
                                title: Text(
                                  "Category",
                                  style: GoogleFonts.germaniaOne(
                                      color: Colors.white, fontSize: 25),
                                ),
                                content: Container(
                                  height: SizeConfig.blockSizeVertical * 70,
                                  width: SizeConfig.blockSizeHorizontal * 90,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: SizeConfig.blockSizeVertical *
                                              100,
                                          child: FutureBuilder(
                                            future: getGenresData(),
                                            builder: (BuildContext context,snapshot){
                                              if(!snapshot.hasData){
                                                return Center(child:SpinKitPouringHourglass(color: Colors.white,));
                                              }
                                              else if(snapshot.hasData&&snapshot.connectionState==ConnectionState.done){
                                                return ListView.separated(
                                                  separatorBuilder: (context, index) {
                                                    return SizedBox(
                                                      height: 10,
                                                    );
                                                  },
                                                  itemCount: 19,
                                                  itemBuilder: (context, index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (contex) =>
                                                                GenresCategory(
                                                                  genresName:
                                                                  snapshot.data[
                                                                  "results"]
                                                                  [index]["name"],
                                                                ),
                                                          ),
                                                        );
                                                      },
                                                      child: Container(
                                                        height: SizeConfig
                                                            .blockSizeVertical *
                                                            20,
                                                        width: SizeConfig
                                                            .blockSizeHorizontal *
                                                            100,
                                                        child: Stack(
                                                          children: <Widget>[
                                                            Container(
                                                              height: SizeConfig
                                                                  .blockSizeVertical *
                                                                  100,
                                                              width: SizeConfig
                                                                  .blockSizeHorizontal *
                                                                  100,
                                                              child: Opacity(
                                                                opacity: 0.8,
                                                                child: ClipRRect(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        30),
                                                                    child:
                                                                    CachedNetworkImage(
                                                                      placeholder: (context,
                                                                          url) =>
                                                                          Container(
                                                                              child:
                                                                              Center(
                                                                                child:
                                                                                SpinKitPouringHourglass(
                                                                                  color: Colors
                                                                                      .white,
                                                                                ),
                                                                              )),
                                                                      imageUrl: snapshot.data[
                                                                      "results"]
                                                                      [index][
                                                                      "image_background"],
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    )),
                                                              ),
                                                            ),
                                                            Center(
                                                                child: Text(
                                                                  snapshot.data[
                                                                  "results"]
                                                                  [index]["name"],
                                                                  style:
                                                                  GoogleFonts.nosifer(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize: 20),
                                                                  textAlign:
                                                                  TextAlign.center,
                                                                ))
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              }
                                              else{
                                                return Center(child: SpinKitPouringHourglass(color: Colors.white,));
                                              }
                                              
                                            },
                                          )
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      child: Container(
                          height: SizeConfig.blockSizeVertical * 8,
                          width: SizeConfig.blockSizeHorizontal * 15,
                          decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.all_inclusive,
                            color: Colors.white,
                            size: 40,
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    color: Colors.white12,
                    splashColor: Colors.red,
                    onPressed: () {
                      setState(() {
                        _isSelected = 0;
                      });
                    },
                    child: Text(
                      "${catList[0]}",
                      style: GoogleFonts.nosifer(
                          color: Colors.white, fontSize: 9),
                    ),
                  ),
                  FlatButton(
                    color: Colors.white12,
                    splashColor: Colors.red,
                    onPressed: () {
                      setState(() {
                        _isSelected = 1;
                      });
                    },
                    child: Text(
                      "${catList[1]}",
                      style: GoogleFonts.nosifer(
                          color: Colors.white, fontSize: 9),
                    ),
                  ),
                  FlatButton(
                    color: Colors.white12,
                    splashColor: Colors.red,
                    onPressed: () {
                      setState(() {
                        _isSelected = 2;
                      });
                    },
                    child: Text(
                      "${catList[2]}",
                      style: GoogleFonts.nosifer(
                          color: Colors.white, fontSize: 9),
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 1,
              ),
              _isSelected == 0
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7.0, vertical: 10.0),
                      child: FutureBuilder(
                        future: getPopularData(),
                        builder: (BuildContext context,snapshot){
                          if(!snapshot.hasData){
                            return SpinKitPouringHourglass(color: Colors.grey,);
                          }
                          else if(snapshot.hasData&&snapshot.connectionState== ConnectionState.done){
                            return SizedBox(
                        height: SizeConfig.blockSizeVertical * 35,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PopularGameInfo(
                                        json: snapshot.data,
                                        imageUrl: snapshot.data["results"][index]
                                            ["background_image"],
                                        index: index,
                                      ),
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      width:
                                          SizeConfig.blockSizeHorizontal * 92,
                                      child: Hero(
                                              tag: snapshot.data["results"][index]
                                                  ["background_image"],
                                              child: ZoomIn(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: CachedNetworkImage(
                                                    placeholder:
                                                        (context, url) =>
                                                            Container(
                                                      child: Center(
                                                        child:
                                                            SpinKitPouringHourglass(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    imageUrl: snapshot.data[
                                                            "results"][index]
                                                        ["background_image"],
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            )
                                    ),
                                   Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              snapshot.data["results"][index]
                                                  ["name"],
                                              style: GoogleFonts.galindo(
                                                color: Colors.white,
                                                fontSize: 18,
                                                wordSpacing: 5.0,
                                              ),
                                            ),
                                          )
                                  ],
                                ),
                              );
                            },
                            itemCount: 10),
                            );
                          }
                          else if(snapshot.hasError){
                            return Center(child:Text("Error Occur While Loading",style: TextStyle(color: Colors.white),));
                          }
                          else{
                            return SpinKitPouringHourglass(color: Colors.grey,);
                          }
                        },
                      )
                    )
                  : _isSelected == 1
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7.0, vertical: 10.0),
                      child: FutureBuilder(
                    future: getCrackedData(),
                    builder: (BuildContext context,snapshot){
                      if(!snapshot.hasData){
                        return SpinKitPouringHourglass(color: Colors.grey,);
                      }
                      else if(snapshot.hasData&&snapshot.connectionState== ConnectionState.done){
                        return SizedBox(
                          height: SizeConfig.blockSizeVertical * 35,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CrackStatusInfo(
                                          json: snapshot.data,
                                          imageUrl: snapshot.data[index]["image"],
                                          index: index,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                            BorderRadius.circular(8)),
                                        width:
                                        SizeConfig.blockSizeHorizontal * 92,
                                        child: ZoomIn(
                                              duration:
                                              Duration(milliseconds: 500),
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(20),
                                                child: CachedNetworkImage(
                                                  placeholder:
                                                      (context, url) =>
                                                      Container(
                                                        child: Center(
                                                          child:
                                                          SpinKitPouringHourglass(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                  imageUrl: snapshot.data[index]["image"],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                        ),
                                      ),
                                     Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          snapshot.data[index]["title"],
                                          style: GoogleFonts.galindo(
                                            color: Colors.white,
                                            fontSize: 18,
                                            wordSpacing: 5.0,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                              itemCount: 10),
                        );
                      }
                      else if(snapshot.hasError){
                        return Center(child:Text("Error Occur While Loading",style: TextStyle(color: Colors.white),));
                      }
                      else{
                        return SpinKitPouringHourglass(color: Colors.grey,);
                      }
                    },
                  )
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7.0, vertical: 10.0),
                      child: FutureBuilder(
                    future: getUpcomingData(),
                    builder: (BuildContext context,snapshot){
                      if(!snapshot.hasData){
                        return SpinKitPouringHourglass(color: Colors.grey,);
                      }
                      else if(snapshot.hasData&&snapshot.connectionState== ConnectionState.done){
                        return SizedBox(
                          height: SizeConfig.blockSizeVertical * 35,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: <Widget>[
                                    Container(
                                      margin:
                                      EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                          BorderRadius.circular(8)),
                                      width:
                                      SizeConfig.blockSizeHorizontal * 92,
                                      child: ZoomIn(
                                            duration:
                                            Duration(milliseconds: 500),
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(20),
                                              child: CachedNetworkImage(
                                                placeholder:
                                                    (context, url) =>
                                                    Container(
                                                      child: Center(
                                                        child:
                                                        SpinKitPouringHourglass(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                imageUrl: snapshot.data[index]["image"],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                      ),
                                    ),
                                     Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        "${snapshot.data[index]["title"]}",
                                        style: GoogleFonts.galindo(
                                          color: Colors.white,
                                          fontSize: 18,
                                          wordSpacing: 5.0,
                                        ),
                                      )
                                    )
                                  ],
                                );
                              },
                              itemCount: 10),
                        );
                      }
                      else if(snapshot.hasError){
                        return Center(child:Text("Error Occur While Loading",style: TextStyle(color: Colors.white),));
                      }
                      else{
                        return SpinKitPouringHourglass(color: Colors.grey,);
                      }
                    },
                  )
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
