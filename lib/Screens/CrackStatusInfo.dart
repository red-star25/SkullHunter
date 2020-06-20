import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gameapi/ScreenConfig.dart';
import 'package:google_fonts/google_fonts.dart';
class CrackStatusInfo extends StatefulWidget {
  var json,imageUrl,index;
  CrackStatusInfo({this.json,this.imageUrl,this.index});

  @override
  _CrackStatusInfoState createState() => _CrackStatusInfoState();
}

class _CrackStatusInfoState extends State<CrackStatusInfo> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: SizeConfig.blockSizeVertical * 100,
        width: SizeConfig.blockSizeHorizontal * 100,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: SizeConfig.blockSizeVertical * 30,
                child: CachedNetworkImage(
                  placeholder: (context, url) => Container(
                    child: Center(
                      child: SpinKitPouringHourglass(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  imageUrl:widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox( height: SizeConfig.blockSizeVertical * 1,),
              Center(child:Text(widget.json[widget.index]["title"],style: GoogleFonts.righteous(color: Colors.white,fontSize: SizeConfig.blockSizeVertical * 4),textAlign: TextAlign.center,)),
              SizedBox( height: SizeConfig.blockSizeVertical * 2,),
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green,
                        blurRadius: 10.0, // has the effect of softening the shadow
                        spreadRadius: 1.0, // has the effect of extending the shadow
                        offset: Offset(
                          5.0, // horizontal, move right 10
                          5.0, // vertical, move down 10
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft:Radius.circular(20) ),
                    gradient: LinearGradient(colors: [Colors.green,Colors.teal])
                ),
                height: SizeConfig.blockSizeVertical * 10,
                width: SizeConfig.blockSizeHorizontal * 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Cracked",style: GoogleFonts.righteous(color: Colors.white,fontSize: SizeConfig.blockSizeVertical * 3,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red,
                            blurRadius: 10.0, // has the effect of softening the shadow
                            spreadRadius: 1.0, // has the effect of extending the shadow
                            offset: Offset(
                              5.0, // horizontal, move right 10
                              5.0, // vertical, move down 10
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight:Radius.circular(20) ),
                        gradient: LinearGradient(colors: [Colors.red,Colors.deepOrange])
                    ),
                    height: SizeConfig.blockSizeVertical * 12,
                    width: SizeConfig.blockSizeHorizontal * 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("AAA: ",style: GoogleFonts.righteous(color: Colors.black,fontSize: SizeConfig.blockSizeVertical * 3,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                        Text(widget.json[widget.index]["isAAA"]?"Yes":"No",style: GoogleFonts.righteous(color: Colors.white,fontSize: SizeConfig.blockSizeVertical * 3),textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red,
                            blurRadius: 10.0, // has the effect of softening the shadow
                            spreadRadius: 1.0, // has the effect of extending the shadow
                            offset: Offset(
                              5.0, // horizontal, move right 10
                              5.0, // vertical, move down 10
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight:Radius.circular(20) ),
                        gradient: LinearGradient(colors: [Colors.red,Colors.deepOrange])
                    ),
                    height: SizeConfig.blockSizeVertical * 12,
                    width: SizeConfig.blockSizeHorizontal * 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Followeres:",style: GoogleFonts.righteous(color: Colors.black,fontWeight: FontWeight.w900,fontSize: SizeConfig.blockSizeVertical * 2),textAlign: TextAlign.center,),
                        SizedBox(width: 10,),
                        Text(widget.json[widget.index]["followersCount"].toString(),style: GoogleFonts.righteous(color: Colors.white,fontWeight: FontWeight.w900,fontSize: SizeConfig.blockSizeVertical * 3),),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red,
                            blurRadius: 10.0, // has the effect of softening the shadow
                            spreadRadius: 1.0, // has the effect of extending the shadow
                            offset: Offset(
                              5.0, // horizontal, move right 10
                              5.0, // vertical, move down 10
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight:Radius.circular(20) ),
                        gradient: LinearGradient(colors: [Colors.red,Colors.deepOrange])
                    ),
                    height: SizeConfig.blockSizeVertical * 12,
                    width: SizeConfig.blockSizeHorizontal * 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Released:",style: GoogleFonts.righteous(color: Colors.black,fontWeight: FontWeight.w900,fontSize: SizeConfig.blockSizeVertical * 3),textAlign: TextAlign.center,),
                        SizedBox(width: 10,),
                        Text("${widget.json[widget.index]["releaseDate"].toString().substring(0,10)}",style: GoogleFonts.righteous(color: Colors.white,fontSize: SizeConfig.blockSizeVertical * 2,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red,
                            blurRadius: 10.0, // has the effect of softening the shadow
                            spreadRadius: 1.0, // has the effect of extending the shadow
                            offset: Offset(
                              5.0, // horizontal, move right 10
                              5.0, // vertical, move down 10
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight:Radius.circular(20) ),
                        gradient: LinearGradient(colors: [Colors.red,Colors.deepOrange])
                    ),
                    height: SizeConfig.blockSizeVertical * 12,
                    width: SizeConfig.blockSizeHorizontal * 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Protection:",style: GoogleFonts.righteous(color: Colors.black,fontWeight: FontWeight.w900,fontSize: SizeConfig.blockSizeVertical * 2.3),textAlign: TextAlign.center,),
                        SizedBox(height: 10,),
                        Text(widget.json[widget.index]["protections"][0],style: GoogleFonts.righteous(color: Colors.white,fontWeight:FontWeight.bold,fontSize: SizeConfig.blockSizeVertical * 2),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 5,),
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red,
                        blurRadius: 10.0, // has the effect of softening the shadow
                        spreadRadius: 1.0, // has the effect of extending the shadow
                        offset: Offset(
                          5.0, // horizontal, move right 10
                          5.0, // vertical, move down 10
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight:Radius.circular(20) ),
                    gradient: LinearGradient(colors: [Colors.red,Colors.deepOrange])
                ),
                height: SizeConfig.blockSizeVertical * 12,
                width: SizeConfig.blockSizeHorizontal * 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("UpdatedAt:",style: GoogleFonts.righteous(color: Colors.black,fontWeight: FontWeight.w900,fontSize: SizeConfig.blockSizeVertical * 2),textAlign: TextAlign.center,),
                    SizedBox(height: 10,),
                    Text(widget.json[widget.index]["updatedAt"].toString().substring(0,10),style: GoogleFonts.righteous(color: Colors.white,fontWeight: FontWeight.w900,fontSize: SizeConfig.blockSizeVertical * 2),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
