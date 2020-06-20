import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gameapi/Screens/GameSearch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:gameapi/ScreenConfig.dart';
class GenresCategory extends StatefulWidget {
  String genresName;
  GenresCategory({this.genresName});
  @override
  _GenresCategoryState createState() => _GenresCategoryState();
}

class _GenresCategoryState extends State<GenresCategory> {
  
  
  Future getGenresData() async {
    final url = "https://api.rawg.io/api/games?genres=${widget.genresName.toLowerCase()}";
    final response = await http.get(url);
    final json = await jsonDecode(response.body);
    jsonGenresData = json;
    if(jsonGenresData["count"]==0){
      final snackBar = SnackBar(
        content: Text(
          'Sorry  We have No Games In this Genres At this time !!!',
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
  @override
  void initState() {
    getGenresData();
    super.initState();
  }
  var jsonGenresData;
  GlobalKey<ScaffoldState> scaffold_state = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: scaffold_state,
        backgroundColor: Colors.black,
        body:jsonGenresData!=null?Container(
          height: SizeConfig.blockSizeVertical * 100,
          width: SizeConfig.blockSizeHorizontal * 100,
          color: Colors.black,
          child: Column(
            children: <Widget>[
              SizedBox( height: SizeConfig.blockSizeVertical * 5,),
              Container(
                  width: SizeConfig.blockSizeHorizontal * 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(colors: [Colors.deepOrange,Colors.red])
                ),
                  child: Center(child: Text(widget.genresName,style: GoogleFonts.righteous(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),))),
              SizedBox(height: SizeConfig.blockSizeVertical * 4,),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 84.3,
                child: ListView.separated(
                  separatorBuilder: (context,index){
                    return SizedBox(height: SizeConfig.blockSizeVertical * 3,);
                  },
                  itemCount: jsonGenresData["results"].length,
                  itemBuilder: (context,index){
                    return Column(
                      children: <Widget>[
                        InkWell(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>GameSearchPage(gameName: jsonGenresData["results"][index]["name"],index: 0,)));
                          },
                          child: Container(
                            child: Opacity(
                                opacity: 0.8,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                    child: CachedNetworkImage(
                                      placeholder: (context,url)=>Container(child: Center(child: SpinKitPouringHourglass(color: Colors.white,),),),
                                      imageUrl: jsonGenresData["results"][index]["background_image"],fit: BoxFit.cover,))),
                            height: SizeConfig.blockSizeVertical*40,
                          ),
                        ),
                        Center(child:Text(jsonGenresData["results"][index]["name"],style: GoogleFonts.righteous(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),textAlign: TextAlign.center,))
                      ],
                    );
                  },
                ),
              ),

            ],
          ),
        ):Center(child: SpinKitPouringHourglass(color: Colors.white,),)
    );
  }
}
