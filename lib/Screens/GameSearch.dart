import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart'as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gameapi/ScreenConfig.dart';
class GameSearchPage extends StatefulWidget {
  String gameName;
  int index;
  GameSearchPage({this.gameName,this.index});

  @override
  _GameSearchPageState createState() => _GameSearchPageState();
}

class _GameSearchPageState extends State<GameSearchPage> {


  Future get_SearchedGame_Data() async {
    final url = "https://api.rawg.io/api/games?search=${widget.gameName}";
    final response = await http.get(url);
    final json = await jsonDecode(response.body);
    jsonData = json;
    print(jsonData);
    if(jsonData["count"]==0){
      final snackBar = SnackBar(
        content: Text(
          'Game not Found',
          style: GoogleFonts.righteous(fontSize: 16),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      );
      scaffold_state.currentState.showSnackBar(snackBar);
      Future.delayed(Duration(seconds: 2),(){
        Navigator.pop(context);
      });
    }
    else{
      setState(() {});
    }
  }
  var jsonData;
  GlobalKey<ScaffoldState> scaffold_state = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    get_SearchedGame_Data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: scaffold_state,
      backgroundColor: Colors.black,
      body: jsonData!=null?Container(
        color: Colors.black,
        height: SizeConfig.blockSizeVertical * 100,
        width: SizeConfig.blockSizeHorizontal * 100,
        child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            jsonData["results"][0]["background_image"]!=""||jsonData["results"][0]["background_image"]!=null?Container(
                width: SizeConfig.blockSizeHorizontal * 100,
                height: SizeConfig.blockSizeVertical * 33,
                child: ElasticInRight(
                  duration: Duration(seconds: 2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                    child: CachedNetworkImage(
                      placeholder: (context, url) => Container(
                        child: Center(
                          child: Text("Loading..."),
                        ),
                      ),
                      imageUrl:jsonData["results"][0]["background_image"],
                      fit: BoxFit.cover,
                    ),
                  ),
                )
            ):SizedBox(),
            SizedBox(height: SizeConfig.blockSizeVertical * 1),
            jsonData["results"][0]["name"]!=""||jsonData["results"][0]["name"]!=null?Center(child:Text(jsonData["results"][0]["name"],style: GoogleFonts.righteous(color: Colors.white,fontSize: 30),textAlign: TextAlign.center,)):SizedBox(),
            SizedBox(height: SizeConfig.blockSizeVertical * 2,),
            Text("Rating: ",style: GoogleFonts.righteous(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            jsonData["results"][0]["rating"]!=""||  jsonData["results"][0]["rating"]!=null?Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              elevation: 30.0,
              shadowColor: Colors.red,
              child:Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),topLeft:Radius.circular(20) ),
                    gradient: LinearGradient(colors: [Colors.red,Colors.deepOrange])
                ),
                height: SizeConfig.blockSizeVertical * 8,
                width: SizeConfig.blockSizeHorizontal * 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(jsonData["results"][0]["rating"].toString(),style: GoogleFonts.righteous(color: Colors.white,fontSize: 22),textAlign: TextAlign.center,)
                  ],
                ),
              ),
            ):SizedBox(),
            SizedBox(height: SizeConfig.blockSizeVertical * 3,),
            Text("Platform:",style: GoogleFonts.righteous(color: Colors.red,fontWeight: FontWeight.w900,fontSize: 18),),
            SizedBox(height: SizeConfig.blockSizeVertical * 1,),
            jsonData["results"][0]['platforms']!=null?SizedBox(
              height: SizeConfig.blockSizeVertical *8,
              child:ListView.separated(
                separatorBuilder: (context,index){
                  return Row(
                    children: <Widget>[
                      SizedBox(width: SizeConfig.blockSizeHorizontal * 1,),
                    ],
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: jsonData["results"][0]['platforms'].length,
                itemBuilder: (context,index){
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    elevation: 30.0,
                    shadowColor: Colors.red,
                    child:Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft:Radius.circular(20) ),
                          gradient: LinearGradient(colors: [Colors.red,Colors.deepOrange])
                      ),
                      height: SizeConfig.blockSizeVertical * 10,
                      width: SizeConfig.blockSizeHorizontal * 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(jsonData["results"][0]['platforms'][index]['platform']['name'],style: GoogleFonts.righteous(color: Colors.white,fontSize:  SizeConfig.blockSizeVertical * 2),textAlign: TextAlign.center,)
                        ],
                      ),
                    ),
                  );
                },

              ),
            ):SizedBox(),
            SizedBox(height: SizeConfig.blockSizeVertical * 4,),
            Text("Stores:",style: GoogleFonts.righteous(color: Colors.red,fontWeight: FontWeight.w900,fontSize: 18),),
            SizedBox(height: SizeConfig.blockSizeVertical * 1,),
            jsonData["results"][0]['stores']!=null?SizedBox(
              height: SizeConfig.blockSizeVertical * 8,
              child: ListView.separated(
                separatorBuilder: (context,index){
                  return Row(
                    children: <Widget>[
                      SizedBox(height: SizeConfig.blockSizeVertical * 20,),
                    ],
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: jsonData["results"][widget.index]['stores'].length,
                itemBuilder: (context,index){
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    elevation: 30.0,
                    shadowColor: Colors.red,
                    child:Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft:Radius.circular(20) ),
                          gradient: LinearGradient(colors: [Colors.red,Colors.deepOrange])
                      ),
                      height: SizeConfig.blockSizeVertical * 10,
                      width: SizeConfig.blockSizeHorizontal * 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(jsonData["results"][widget.index]['stores'][index]['store']['name'],style: GoogleFonts.righteous(color: Colors.white,fontSize:  SizeConfig.blockSizeVertical * 2),textAlign: TextAlign.center,)
                        ],
                      ),
                    ),
                  );

                },
              ),
            ):SizedBox(),
            SizedBox(height: SizeConfig.blockSizeVertical * 4,),
            Text("Released:",style: GoogleFonts.righteous(color: Colors.red,fontWeight: FontWeight.w900,fontSize:  SizeConfig.blockSizeVertical * 2),),
            SizedBox(height: SizeConfig.blockSizeVertical * 1,),
            jsonData["results"][0]["released"]!=""||jsonData["results"][0]["released"]!=null?Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              elevation: 30.0,
              shadowColor: Colors.red,
              child:Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft:Radius.circular(20) ),
                    gradient: LinearGradient(colors: [Colors.red,Colors.deepOrange])
                ),
                height: SizeConfig.blockSizeVertical * 8,
                width: SizeConfig.blockSizeHorizontal * 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("${jsonData["results"][0]["released"]}",style: GoogleFonts.righteous(color: Colors.white,fontSize: 15),)
                  ],
                ),
              ),
            ):SizedBox(),
            SizedBox(height: SizeConfig.blockSizeVertical * 4,),
            Text("Generes:",style: GoogleFonts.righteous(color: Colors.red,fontWeight: FontWeight.w900,fontSize: 18),),
            SizedBox(height: SizeConfig.blockSizeVertical * 1,),
            jsonData["results"][0]['genres']!=null||jsonData["results"][0]['genres']!=""?SizedBox(
              height: SizeConfig.blockSizeVertical * 8,
              child: ListView.separated(
                separatorBuilder: (context,index){
                  return Row(
                    children: <Widget>[
                      SizedBox(width: SizeConfig.blockSizeHorizontal * 2,),
                    ],
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: jsonData["results"][0]['genres'].length,
                itemBuilder: (context,index){
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    elevation: 30.0,
                    shadowColor: Colors.red,
                    child:Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft:Radius.circular(20) ),
                          gradient: LinearGradient(colors: [Colors.red,Colors.deepOrange])
                      ),
                      width: SizeConfig.blockSizeHorizontal * 25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(jsonData["results"][0]['genres'][index]['name'],style: GoogleFonts.righteous(color: Colors.white,fontSize: 15),)
                        ],
                      ),
                    ),
                  );

                },
              ),
            ):SizedBox(),
            SizedBox(height: SizeConfig.blockSizeVertical * 4,),
            Text("Screenshots:",style: GoogleFonts.righteous(color: Colors.red,fontWeight: FontWeight.w900,fontSize: 18),),
            SizedBox(height: SizeConfig.blockSizeVertical * 1,),
            jsonData['results'][0]['short_screenshots']!=null||jsonData['results'][0]['short_screenshots']!=""?SizedBox(
              height: SizeConfig.blockSizeVertical * 30,
              child: ListView.separated(
                separatorBuilder: (context,index){
                  return SizedBox(width: 10,);
                },
                scrollDirection: Axis.horizontal,
                itemCount: jsonData['results'][0]['short_screenshots'].length,
                itemBuilder: (context,index){
                  return Container(
                    width: SizeConfig.blockSizeVertical * 55,
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: CachedNetworkImage(
                        imageUrl: jsonData['results'][0]['short_screenshots'][index]['image'],
                        placeholder: (context,url)=>Container(child: Center(child: SpinKitPouringHourglass(
                          color: Colors.white,
                        ),),),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ):SizedBox(),
            SizedBox(height: 30,),
          ],
        ),
      ),
      ):Center(child:SpinKitPouringHourglass(
        color: Colors.white,
      ),)
    );
  }
}
