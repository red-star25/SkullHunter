import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gameapi/Screens/GameSearch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:gameapi/ScreenConfig.dart';
class MoreCrackedGames extends StatefulWidget {
  @override
  _MoreCrackedGamesState createState() => _MoreCrackedGamesState();
}

class _MoreCrackedGamesState extends State<MoreCrackedGames> {


  Future get_More_Cracked_Games_Data() async {
    final url = "https://api.crackwatch.com/api/games?page=0&sort_by=crack_date&is_cracked=true";
    final response = await http.get(url);
    final json = await jsonDecode(response.body);
    json_more_cracked_games_Data = json;
   setState(() {

   });
  }
  @override
  void initState() {
    get_More_Cracked_Games_Data();
    super.initState();
  }
  var json_more_cracked_games_Data;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.black,
        body:json_more_cracked_games_Data!=null?Container(
          height: SizeConfig.blockSizeVertical * 100,
          width: SizeConfig.blockSizeHorizontal * 100,
          color: Colors.black,
          child: Column(
            children: <Widget>[
              SizedBox( height: SizeConfig.blockSizeVertical * 3,),
              Text("Cracked Games",style: GoogleFonts.righteous(fontSize: 30,color: Colors.white),),
              SizedBox( height: SizeConfig.blockSizeVertical * 1,),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 86,
                child: ListView.separated(
                  separatorBuilder: (context,index){
                    return SizedBox(height: SizeConfig.blockSizeVertical * 3,);
                  },
                  itemCount: json_more_cracked_games_Data.length,
                  itemBuilder: (context,index){
                    return Column(
                      children: <Widget>[
                        json_more_cracked_games_Data!=null?InkWell(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>GameSearchPage(gameName: json_more_cracked_games_Data[index]["title"],index: index,
                            ),),);
                          },
                          child: Container(
                            child: Opacity(
                                opacity: 0.8,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: CachedNetworkImage(
                                      placeholder: (context,url)=>Container(child: Center(child:SpinKitPouringHourglass(
                                        color: Colors.white,
                                      ),),),
                                      imageUrl: json_more_cracked_games_Data[index]["image"],fit: BoxFit.cover,))),
                          ),
                        ):SpinKitPouringHourglass(
                          color: Colors.white,
                        ),
                        Center(child:Text(json_more_cracked_games_Data[index]["title"],style: GoogleFonts.righteous(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),textAlign: TextAlign.center,))
                      ],
                    );
                  },
                ),
              ),

            ],
          ),
        ):Center(child: SpinKitPouringHourglass(
          color: Colors.white,
        ),)
    );
  }
}
