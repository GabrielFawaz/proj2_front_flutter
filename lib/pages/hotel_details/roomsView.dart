import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:image_card/image_card.dart';
import 'package:untitled1/controllers/hotel_details/roomView_controller.dart';


import '../../constant/color.dart';


Color customColor = Color(0xFF2B74FE);


class roomsView extends GetView<RoomViewsController> {

  final List<Room> room = [
    Room(
      imageUrl: 'assets/images/p1.jpg',
      type: 'suite',
      des:
      "Nestled amidst lush greenery, our hotel offers a serene escape from the hustle and bustle of city life.",
      price: 100.0,
        addFeatures: ['with a terrace'],
        capacity:[Capacity.two.name],
      startBookingDate: DateTime.tryParse("2024-10-07"),
      endBookingDate: DateTime.tryParse("2024-10-18")
    ),
    Room(
        imageUrl: 'assets/images/p3.jpg',
        type: 'suite',
        des:
        "Discover a fusion of modern elegance and traditional charm at our boutique hotel, where personalized experiences await around every corner.",
        price: 500.0,
        addFeatures: [ 'Sea View', 'with a terrace']
    ),

    Room(
      imageUrl: 'assets/images/p3.jpg',
      type: 'room',
      des:
      "With breathtaking views of the ocean, our beachfront hotel promises a rejuvenating stay filled with sun, sand, and sea.",
      price: 1000.0,
      addFeatures: [ 'Sea View', 'with a terrace'],
  startBookingDate: DateTime.tryParse("2024-10-02"),
  endBookingDate: DateTime.tryParse("2024-11-01")

    ),
    Room(
      imageUrl: 'assets/images/p2.jpg',
      type: 'room',
      des:
      "Experience unparalleled luxury and impeccable service at our five-star hotel, where every detail is meticulously crafted to exceed your expectations.",
      price: 250.0,
        addFeatures: [ 'Sea View',],
       capacity: [Capacity.one.name]
      
    ),
    Room(
      imageUrl: 'assets/images/p3.jpg',
      type: 'room',
      des:
      "With breathtaking views of the ocean, our beachfront hotel promises a rejuvenating stay filled with sun, sand, and sea.",
      price: 1000.0,
        capacity: [Capacity.one.name,Capacity.two.name],
        startBookingDate: DateTime.tryParse("2024-12-21"),
        endBookingDate: DateTime.tryParse("2024-12-26")
    ),
    Room(
      imageUrl: 'assets/images/p1.jpg',
      type: 'room',
      des:
      "Nestled amidst lush greenery, our hotel offers a serene escape from the hustle and bustle of city life.",
      price: 100.0,
        addFeatures: [ 'Sea View'],
        startBookingDate: DateTime.tryParse("2024-09-27"),
        endBookingDate: DateTime.tryParse("2024-11-05")
    ),

  ];

  Map<String, bool> additionalFeatures = {
    'Sea View': false,
    'with a terrace': false,
  };
  Map<String, bool>  roomsFor = {
    'one person': false,
    'two people': false,
  };
  String type='room';

  @override
  Widget build(BuildContext context) {
    Get.put(RoomViewsController());
    List<Room> list=room.where((element) => element.type==type).toList();

    return StatefulBuilder(
        builder: (context,setState) {
        return Scaffold(
          backgroundColor: Colors.blueGrey[50], // Set background color
          body: Padding(
            padding: const EdgeInsets.all(16),
            child:  Column(
              children: [
                Flexible(
flex: 5,
                  child:   Container(child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                SizedBox(height: 30,),
                Text(
                  'Choose Room Type :',
                  style:
                  TextStyle(color: Colors.black,fontSize: 18),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: ListTile(
                        minVerticalPadding: 0,
                        minLeadingWidth: 0,
                        horizontalTitleGap: 0,
                        title: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Room',
                            style:
                            TextStyle(color: Colors.black,),
                          ),
                        ),
                        leading: Transform.scale(
                          scale: 1.5,
                          child: Radio(
                            // splashRadius: 0.8,
                            hoverColor: Colors.black,
                            activeColor: customColor,
                            focusColor: Colors.black,
                            value: true,
                            groupValue: controller.typeVal,
                            onChanged: (newVal) {
                              setState((){
                                controller.typeVal=
                                newVal as bool;
                              type='room';
    list = room.where((element) => element.type == type).toList();


    if (controller.selectedFeatures.isNotEmpty) {
    list = list.where((item) =>
        controller.selectedFeatures.every((feature) => item.addFeatures?.contains(feature) ?? false)).toList();
    }


                              if (controller.selectedCapacity.isNotEmpty) {
                                list = list.where((item) =>
                                    controller.selectedCapacity.every((feature) => item.capacity?.contains(feature) ?? false)).toList();
                              }
          });
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        minVerticalPadding: 0,
                        minLeadingWidth: 0,
                        horizontalTitleGap: 0,
                        title: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'suite',
                            style:
                            TextStyle(color:Colors.black,),
                          ),
                        ),
                        leading: Transform.scale(
                          scale: 1.5,
                          child: Radio(
                            hoverColor: Colors.black,
                            activeColor: customColor,
                            focusColor: Colors.black,
                            value: false,
                            groupValue: controller.typeVal,
                            onChanged: (newVal) {
                              setState((){
                                controller.typeVal=
                                newVal as bool;
                                type='suite';
          list = room.where((element) => element.type == type).toList();


          if (controller.selectedFeatures.isNotEmpty) {
          list = list.where((item) =>
          controller.selectedFeatures.every((feature) => item.addFeatures?.contains(feature) ?? false)).toList();
          }


          if (controller.selectedCapacity.isNotEmpty) {
          list = list.where((item) =>
          controller.selectedCapacity.every((feature) => item.capacity?.contains(feature) ?? false)).toList();
          }

          });

                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'additional features :',
                  style:
                  TextStyle(color: Colors.black,fontSize: 18),
                ),
                SizedBox(height: 10,),


            ListView(
                    shrinkWrap: true,
                    children: additionalFeatures.keys.map((String key) {
                      return  CheckboxListTile(
                        title:  Text(key),
                        checkColor:Colors.black ,
                        activeColor:customColor ,
                        value: additionalFeatures[key],
                        onChanged: (bool? val) {
                          setState(() {
                            additionalFeatures[key] = val ?? false;
                            controller.selectedFeatures = additionalFeatures.entries
                                .where((entry) => entry.value)
                                .map((entry) => entry.key)
                                .toList();
          list = room.where((element) => element.type == type).toList();


          if (controller.selectedFeatures.isNotEmpty) {
          list = list.where((item) =>
              controller.selectedFeatures.every((feature) => item.addFeatures?.contains(feature) ?? false)).toList();
          }

                          });
                        },
                      );
                    }).toList(),),
          SizedBox(height: 10,),
          Text(
          ' room is for :',
          style:
          TextStyle(color: Colors.black,fontSize: 18),
        ),
          SizedBox(height: 10,),
                GridView(
                  shrinkWrap: true,
                  primary: false,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    mainAxisExtent: 200,
                  ),
                  children: roomsFor.keys.map((String key) {
                    return  CheckboxListTile(
                      title:  Text(key),
                      checkColor:Colors.black ,
                      activeColor:customColor ,
                      value: roomsFor[key],
                      onChanged: (bool? value) {
                        setState(() {
                          roomsFor[key] = value?? false;
                          controller.selectedCapacity = roomsFor.entries
                                .where((entry) => entry.value)
                                .map((entry) => entry.key)
                                .toList();
                            list = room.where((element) => element.type == type).toList();


                            if (controller.selectedCapacity.isNotEmpty) {
                              list = list.where((item) =>
                                  controller.selectedCapacity.every((feature) => item.capacity?.contains(feature) ?? false)).toList();
                            }


                        });
                      },
                    );
                  }).toList(),),


              ],
            ),),),
                SizedBox(height: 20,),
                Flexible(
                  flex: 4,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                        children:list.map((e)  => RoomCard(room: e,onTap:(){
                          dt(e) ;
                        })).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
  dt(Room room) {

    return Get.dialog(Dialog(
        insetAnimationDuration: const Duration(milliseconds: 100),
        insetAnimationCurve: Curves.easeInOut,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 0,
        child: Stack(
          alignment: AlignmentDirectional.center,

          children: <Widget>[
            StatefulBuilder(
                builder: (context,setState) {
                  return Container(
                    width: Get.width,
                    // height: Get.height/2,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(bottom: 45),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black, offset: Offset(0, 5), blurRadius: 5),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: ListView(
                          padding: EdgeInsets.all(0),
                          primary: false,
                          shrinkWrap: true,
                          children: [
                            SizedBox(height: 10,),
                            Text('set the date you want of booking :'.tr,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    // color: customColor,
                                    fontSize: 16.0)),
                            SizedBox(height: 5,),
                            room.startBookingDate!=null?
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:'and note that the ${room.type} is booked during the period \n',
                                    style: TextStyle(color:Colors.black,fontSize: 16.0)),
                                  TextSpan(
                                    text: "from date:",
                                    style: TextStyle(color:Colors.black,fontSize: 16.0),
                                  ),
                                  TextSpan(
                                    text: room.startBookingDate.toString().substring(0,10),
                                    style: TextStyle(color:customColor,fontSize: 16.0),
                                  ),
                                  TextSpan(
                                    text: "to date:",
                                    style: TextStyle(color:Colors.black,fontSize: 16.0),
                                  ),
                                  TextSpan(
                                    text: room.endBookingDate.toString().substring(0,10),
                                    style: TextStyle(color:customColor,fontSize: 16.0),
                                  ),
                                ],
                              ),
                            )
                            // Text('and note that the ${room.type} is booked during the period\n from date:${room.startBookingDate.toString().substring(0,10)}  to date:${room.endBookingDate.toString().substring(0,10)}',
                            //     textAlign: TextAlign.start,
                            //     style: TextStyle(
                            //         // color: customColor,
                            //         fontSize: 16.0))
                          :SizedBox(),
                            SizedBox(height: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('From :'.tr, style: TextStyle(fontSize: 18.0)),
                                Container(
                                  height: Get.height/6,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: customColor,
                                    ),
                                    borderRadius: BorderRadius.circular(12,),
                                  ),
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    initialDateTime: DateTime.now().add(Duration(days: 1)),
                                    minimumDate: DateTime.now(),
                                    maximumDate: DateTime.now().add(Duration(days: 364)) ,
                                    onDateTimeChanged: (newDateTime) {
                                      setState(() {
                                        controller.start = newDateTime;
                                      });

                                      print('$newDateTime');
                                    },
                                  ),
                                ),
                                Text('To :'.tr, style: TextStyle(fontSize: 18.0)),
                                Container(
                                  height: Get.height/6,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: customColor,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    initialDateTime:controller.start.add(Duration(days: 1)),
                                    minimumDate: controller.start,
                                    maximumDate: DateTime.now().add(Duration(days: 365)) ,
                                    onDateTimeChanged: (newDateTime) {
                                      setState(() {
                                        controller.end = newDateTime;
                                      });

                                      print('$newDateTime');
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),

                              ],
                            ),


                          ]),
                    ),
                  );
                }
            ),
            Positioned(
              bottom: -20,
              // left: 5,
              // right: 5,
              child: Row(
                mainAxisAlignment:  MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    //   radius: 45,
                    minRadius: 45.0,
                    maxRadius: 70.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(45)),
                      child: MaterialButton(

                        onPressed: () //async
                          async {
                          if(room.startBookingDate!=null &&room.endBookingDate!=null) {
                            bool isStartDateInRange = controller.start.isAfter(
                                room.startBookingDate!) &&
                                controller.start.isBefore(
                                    room.endBookingDate!);
                            bool isEndDateInRange = controller.end.isAfter(
                                room.startBookingDate!) &&
                                controller.end.isBefore(room.endBookingDate!);

                            if(isStartDateInRange || isEndDateInRange){
                              Get.defaultDialog(
                                  title: "\nRequest not sent Please be sure to select a valid date not booked in advance and then try again",
                                  content: Text(""),
                                  actions: [
                                    TextButton(onPressed: (){
                                      Get.back();
                                    },
                                        child: Text("ok",style: TextStyle(color:customColor,fontSize: 18),)),
                                  ]
                              );
                            }else{
                              Get.defaultDialog(
                                  title: "\nThe total cost of booking is: ${room.price*(controller.end.difference(controller.start).inDays)} \nAre you sure you're completing your booking?",
                                  content: Text(""),
                                  actions: [
                                    TextButton(onPressed: (){
                                      Get.back();
                                      GetReDialog(
                                          'Request sent\n \n You will be notified if the booking is completed.\nReference Number:10021763',
                                          'send_ok');
                                    },
                                        child: Text("ok",style: TextStyle(color:customColor,fontSize: 18),)),
                                    TextButton(onPressed: (){
                                      Get.back();
                                    },
                                        child: Text("cancel",style: TextStyle(color:customColor,fontSize: 18),)),
                                  ]
                              );
                         }
                          }else {
                            GetReDialog(
                                'Request sent\n \n You will be notified if the booking is completed.\nReference Number:10021763',
                                'send_ok');
                          }
                        },
                        color: customColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        child: SizedBox(
                          width: Get.width/5,
                          child: Text(
                            'confirm'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        )));
  }
}
enum Capacity{
one("one person"),
two("two people");
 final String name;

 const Capacity(
     this.name,
     );
}

class Room {
  final String imageUrl;
  final String type;
  final double price;
  final String des;
  final List<String>? addFeatures;
  final  List<String>? capacity;
  final  DateTime? startBookingDate;  
  final  DateTime? endBookingDate;

  Room({
    required this.imageUrl,
    required this.type,
    required this.des,
    required this.price,
    this.addFeatures,
    this.capacity,
    this.startBookingDate,
    this.endBookingDate
  });
}

class RoomCard extends StatefulWidget {
  final Room room;
  final Function onTap;
  RoomCard({required this.room,required this.onTap});

  @override
  State<RoomCard> createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width * 0.4, // Adjust as needed
      child: Column(
        children: [

          Container(
            decoration: BoxDecoration(
              color: Colors.white, // Set card background color
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: TransparentImageCard(
              width: 150,
              // height: 500,
              contentMarginTop: 50,
              // contentPadding: EdgeInsets.all(100),
              startColor: Colors.white,
              endColor: Colors.transparent ,
              imageProvider: AssetImage( widget.room.imageUrl),
              description:  FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(customColor)),
                        onPressed: () {
                          widget.onTap();
                        },
                        child:const Text("Booking",style: TextStyle(color: Colors.white),)),
                    SizedBox(width: 20,),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(customColor)),
                        onPressed: () {

                        },
                        child:const Text("Show more",style: TextStyle(color: Colors.white),)),
                  ],
                ),
              ),

                    tags:  [

              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "${widget.room.type}",
                  textAlign: TextAlign.start,
                  style: TextStyle(color:Colors.white,fontSize: 16),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "${widget.room.des}",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 6,
                      style: TextStyle(color:Colors.white.withOpacity(0.8),fontSize: 14),
                    ),
                  ),
                ),
              ),



                    ],
              title:     Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  '\$${widget.room.price?.toStringAsFixed(2)}',
                  textAlign: TextAlign.end,
                  style: TextStyle(color:customColor.withOpacity(0.8),fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),


            ),
          ),
        ],
      ),
    );
  }





}  GetReDialog(String text, String image) {
  Get.dialog(
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: 75,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25, top: 5),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/$image.gif',
                    width: Get.width / 1.5,
                    height: Get.height / 2,
                    color: customColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      text.tr,
                      textAlign:TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontSize: 20, inherit: false),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // transitionDuration: Duration(seconds: 4),
      barrierColor: Colors.black.withOpacity(0.7),
      barrierDismissible: false);

  Future.delayed(Duration(seconds: 4), () {
    Get.back();
    Get.back();

  });
}