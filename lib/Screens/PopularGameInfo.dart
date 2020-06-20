import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gameapi/ScreenConfig.dart';
import 'package:google_fonts/google_fonts.dart';
class PopularGameInfo extends StatefulWidget {
  var json,imageUrl,index;
  PopularGameInfo({this.json,this.imageUrl,this.index});

  @override
  _PopularGameInfoState createState() => _PopularGameInfoState();
}

class _PopularGameInfoState extends State<PopularGameInfo> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: SizeConfig.blockSizeHorizontal * 100,
                  height: SizeConfig.blockSizeVertical * 33,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                    child: Hero(
                      tag: widget.imageUrl,
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
                  )
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 1),
              Center(child:Text(widget.json["results"][widget.index]["name"],style: GoogleFonts.righteous(color: Colors.white,fontSize: 30),textAlign: TextAlign.center,)),
              SizedBox(height: SizeConfig.blockSizeVertical * 2,),
              Text("Rating: ",style: GoogleFonts.righteous(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              SizedBox(height: SizeConfig.blockSizeVertical*1,),
              Card(
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
                      Text(widget.json["results"][widget.index]["rating"].toString(),style: GoogleFonts.righteous(color: Colors.white,fontSize: 22),textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 3,),
              Text("Platform:",style: GoogleFonts.righteous(color: Colors.red,fontWeight: FontWeight.w900,fontSize: 18),),
              SizedBox(height: SizeConfig.blockSizeVertical * 1,),
              SizedBox(
                height: SizeConfig.blockSizeVertical *8,
                child: ListView.separated(
                  separatorBuilder: (context,index){
                    return Row(
                      children: <Widget>[
                        SizedBox(width: SizeConfig.blockSizeHorizontal * 1,),
                      ],
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.json["results"][widget.index]['platforms'].length,
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
                            Text(widget.json["results"][widget.index]['platforms'][index]['platform']['name'],style: GoogleFonts.righteous(color: Colors.white,fontSize: 15),textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                    );
                  },

                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 4,),
              Text("Stores:",style: GoogleFonts.righteous(color: Colors.red,fontWeight: FontWeight.w900,fontSize: 18),),
              SizedBox(height: SizeConfig.blockSizeVertical * 1,),
              SizedBox(
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
                  itemCount: widget.json["results"][widget.index]['stores'].length,
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
                            Text(widget.json["results"][widget.index]['stores'][index]['store']['name'],style: GoogleFonts.righteous(color: Colors.white,fontSize: 15),textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                    );

                  },
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 4,),
              Text("Released:",style: GoogleFonts.righteous(color: Colors.red,fontWeight: FontWeight.w900,fontSize: 18),),
              SizedBox(height: SizeConfig.blockSizeVertical * 1,),
              Card(
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
                      Text("${widget.json["results"][widget.index]["released"]}",style: GoogleFonts.righteous(color: Colors.white,fontSize: 15),)
                    ],
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 4,),
              Text("Generes:",style: GoogleFonts.righteous(color: Colors.red,fontWeight: FontWeight.w900,fontSize: 18),),
              SizedBox(height: SizeConfig.blockSizeVertical * 1,),
              SizedBox(
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
                  itemCount: widget.json["results"][widget.index]['genres'].length,
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
                            Text(widget.json["results"][widget.index]['genres'][index]['name'],style: GoogleFonts.righteous(color: Colors.white,fontSize: 15),)
                          ],
                        ),
                      ),
                    );

                  },
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 4,),
              Text("Screenshots:",style: GoogleFonts.righteous(color: Colors.red,fontWeight: FontWeight.w900,fontSize: 18),),
              SizedBox(height: SizeConfig.blockSizeVertical * 1,),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 30,
                child: ListView.separated(
                  separatorBuilder: (context,index){
                    return SizedBox(width: 10,);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.json["results"][widget.index]['short_screenshots'].length,
                  itemBuilder: (context,index){
                    return Container(
                      width: SizeConfig.blockSizeVertical * 55,
                      child:ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: CachedNetworkImage(
                          imageUrl: widget.json["results"][widget.index]['short_screenshots'][index]['image'],
                          placeholder: (context,url)=>Container(child: Center(child: SpinKitPouringHourglass(
                            color: Colors.white,
                          ),),),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
