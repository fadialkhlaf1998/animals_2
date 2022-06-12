import 'package:animals/controller/home_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_widget/zoom_widget.dart';

class Contact extends StatelessWidget {
  final HomeController homeController = Get.find();

  final GlobalKey<ScaffoldState> myKey = GlobalKey();

  Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: myKey,
      endDrawer: App.myDrawer(context, homeController,myKey),
      body: RefreshIndicator(
        onRefresh: ()async{
          Get.offAllNamed("/");
        },
        child: Zoom(
          maxZoomWidth: MediaQuery.of(context).size.width,
          maxZoomHeight: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/image/Background.png")
                      )
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.width>App.mid?MediaQuery.of(context).size.height*0.15:MediaQuery.of(context).size.height*0.1,),
                        _body(context,
                        //title
                        MediaQuery.of(context).size.width>App.larg?30
                            :MediaQuery.of(context).size.width>App.big?22
                            :MediaQuery.of(context).size.width>App.mid?16
                            :MediaQuery.of(context).size.width>App.small?12:7,
                        //body
                        MediaQuery.of(context).size.width>App.larg?25
                            :MediaQuery.of(context).size.width>App.big?15
                            :MediaQuery.of(context).size.width>App.mid?12
                            :MediaQuery.of(context).size.width>App.small?9:6,
                        ),
                        App.footer(context,homeController),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("© 2022 by The Barkley Pet Camp",
                                  style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(child: App.header(context, homeController,myKey)),
              ],
            ),
          ),
        ),
      ),
    );
  }
  _body(BuildContext context,double title, double body){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width*0.4,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/image/contact_cover.jpg"),
              fit: BoxFit.fitHeight
          )
      ),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width*0.4,
          height: MediaQuery.of(context).size.width<400?100:MediaQuery.of(context).size.width*0.3,
          color: App.green.withOpacity(0.75),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.3,
              height:  MediaQuery.of(context).size.width<400?80:MediaQuery.of(context).size.width*0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dubai, United Arab Emirates",style: TextStyle(fontWeight: FontWeight.bold,fontSize: title),maxLines: 1,),
                  SizedBox(height:MediaQuery.of(context).size.width*0.01),
                  Text("Tel: 04 123 4567",style: TextStyle(fontSize: body,color: App.auto),maxLines: 1,),
                  Text("Ras Al Khor Industrial Area 2",style: TextStyle(fontSize: body,color: App.auto),maxLines: 1,),
                  Text("Dubai, United Arab Emirates",style: TextStyle(fontSize: body,color: App.auto),maxLines: 1,),
                  SizedBox(height:MediaQuery.of(context).size.width*0.02),


                  Text("Opening Hours",style: TextStyle(fontSize: title,fontWeight: FontWeight.bold),maxLines: 1,),
                  SizedBox(height:MediaQuery.of(context).size.width*0.01),
                  Text("Monday - Saturday: 7am - 10pm",style: TextStyle(fontSize: body,color: App.auto),maxLines: 1,),
                  Text("Sunday: Closed",style: TextStyle(fontSize: body,color: App.auto),maxLines: 1,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
