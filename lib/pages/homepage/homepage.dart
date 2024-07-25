import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:reactive_flutter_rating_bar/reactive_flutter_rating_bar.dart';
import 'package:untitled1/pages/homepage/roomhill.dart';
import 'package:untitled1/pages/homepage/roompool.dart';
import 'package:untitled1/pages/homepage/roomsea.dart';
import 'package:untitled1/pages/services/mybookingservice.dart';
import '../../constant/appbar/circularappbarshape.dart';
import '../../controllers/homepage/homepage_controller.dart';
import '../../controllers/services/services_controller.dart';
import '../dashboard/dashboardscreen.dart';
import '../hotel_details/roomsView.dart';
import '../profile/profile.dart';
import '../report/reports.dart';
import '../rooms/roomscreen.dart';
import '../rooms/roomserachscreen.dart';
import '../services/servicerequestpage.dart';
import '../services/services.dart';
import '../services/servicespage.dart';
import 'hoteln.dart';
import 'hotelnp.dart';
import 'hotels.dart';





class HotelHome extends StatelessWidget {
  final String token;

 HotelHome({required this.token,Key? key}) : super(key: key);

  final HotelHomeController controller = Get.put(HotelHomeController());
  final ServicesController servicesController = Get.find<ServicesController>();

  // Define categories
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.beach_access, 'label': 'Sea'},
    {'icon': Icons.pool, 'label': 'Pool'},
    {'icon': Icons.terrain, 'label': 'Hill'},
  ];

  Widget _buildCategoryIcon(IconData icon, String label) {
    Widget destinationScreen;
    switch (label) {
      case 'Sea':
        destinationScreen = RoomSeaView();
        break;
      case 'Pool':
        destinationScreen = RoomPoolView();
        break;
      case 'Hill':
        destinationScreen = RooHillView();
        break;
      default:
        destinationScreen = Container();
        break;
    }

    return GestureDetector(
      onTap: () {
        Get.to(() => destinationScreen);
      },
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 35),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              //color: Color(0xFF2B74FE),

              border: Border.all(
                color: Colors.grey,
                width: 2.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: EdgeInsets.all(10),
            child: Icon(
              icon,
              color: Colors.blueGrey,
             // color: Color(0xFF2B74FE),

              size: 24,
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white70,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(0, 2), // Adjust the offset of the shadow as needed
                  blurRadius: 4, // Adjust the blur radius as needed
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

 @override
  Widget build(BuildContext context) {
    Color customColor = Color.fromRGBO(255, 160, 42, 1.0);
    Color transparentBlue = Color.fromRGBO(43, 116, 254, 0.2);

    int bookingId = 3;
    final HotelHomeController controller = Get.put(HotelHomeController());

    return Scaffold(
       /* appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blue[300],
title:     Text(
  "welcome To Our App",
  style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize:20,

    color: Colors.white70,
    shadows: [
      Shadow(
        color: Colors.black.withOpacity(0.5),
        offset: Offset(0, 2), // Adjust the offset of the shadow as needed
        blurRadius: 4, // Adjust the blur radius as needed
      ),
    ],
  ),
),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:
              ElevatedButton (
                onPressed: () async {
                  await controller.navigateToFavorites();
                },
                child: Text('Favorites', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2B74FE),
                  side: BorderSide(
                    color:Color(0xFF2B74FE), // Border color
                    width: 2.0, // Border width
                    style: BorderStyle.solid, // Border style
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),

                    // Rectangular shape
                  ),

                ),
              ),

            ),
          ],
   iconTheme: IconThemeData(color: Colors.grey), // Icon color for the app bar

   leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu,color:Colors.white70,),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },),

   ),*/
     /* appBar: AppBar(
       // backgroundColor:Colors.blueGrey[50],
        backgroundColor: Colors.cyan,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu,color: Colors.black,),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },),
          actions: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:
              ElevatedButton (
                onPressed: () async {
                await controller.navigateToFavorites();
                },
                child: Text('Favorites', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2B74FE),
                  side: BorderSide(
                    color:Color(0xFF2B74FE), // Border color
                    width: 2.0, // Border width
                    style: BorderStyle.solid, // Border style
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)), // Rectangular shape
                  ),

                ),
              ),

            ),
          ],
        ),*/

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          elevation: 0,
          //backgroundColor: Colors.blue[300],
          flexibleSpace: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/seaa.jpg', // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.5),
                    ],
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            "Welcome To Our App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white70,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () async {
                  await controller.navigateToFavorites();
                },
                child: Text('Favorites', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2B74FE),
                  side: BorderSide(
                    color: Color(0xFF2B74FE),
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                ),
              ),
            ),
          ],
          iconTheme: IconThemeData(color: Colors.grey),
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.white70),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
      ),

      drawer: Drawer(
      child: ListView(
    padding: EdgeInsets.zero,
    children: [

      UserAccountsDrawerHeader(
        decoration: BoxDecoration(
         color:Colors.blue[300],
        ),
        accountName: Text('Lory Demerjian',style: TextStyle(color: Colors.white),),
        accountEmail: Text('Lory@Gmail.com',style: TextStyle(color: Colors.white),),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.white,

          child: Text(
            'A',
            style: TextStyle(fontSize: 40.0,color: Colors.black),
          ),
        ),
      ),
      ListTile(
        leading: Icon(Icons.dashboard,color: Color(0xFF2B74FE)),
        title: Text('Dashboard',),
        onTap: () {
          Get.to(DashboardScreen());
        },
      ),
      ListTile(
        leading: Icon(Icons.logout,color: Color(0xFF2B74FE)),
        title: Text('Profile',),
        onTap: () {
          Get.to(() => Profile());

        },
      ),
      ListTile(
        leading: Icon(Icons.report,color:Color(0xFF2B74FE)),
        title: Text('Reports',),
        onTap: () {
        //  Get.to(() => Reports());
         // Get.to(()=>CreateReport());
        },
      ),
      ListTile(
        leading: Icon(Icons.logout,color: Color(0xFF2B74FE)),
        title: Text('Logout',),
        onTap: () {
          Get.find<HotelHomeController>().logout();
        },
      ),
      ListTile(
        leading: Icon(Icons.home_work_outlined,color: Color(0xFF2B74FE)),
        title: Text('Book Hotel'),
        onTap: () async {
          Get.to(() => roomsView());
        },
      ),
      ListTile(
        leading: Icon(Icons.room_rounded,color: Color(0xFF2B74FE)),
        title: Text('Rooms',),
        onTap: () {

         Get.to(() => RoomScreen());

        },
      ),
      ListTile(
        leading: Icon(Icons.search,color: Color(0xFF2B74FE)),
        title: Text('Search',),
        onTap: () {
          Get.to(()=>RoomSearch());

        },
      ),
      ListTile(
        leading: Icon(Icons.room_service,color: Color(0xFF2B74FE)),
        title: Text('Services',),
        onTap: () async {
          // Fetch services data
          await servicesController.fetchServices();
          Get.to(() => ServicesPage(services: servicesController.services));
          await servicesController.fetchServices();
          Get.to(() => ServicesPage(services: servicesController.services));
        },
      ),
      ListTile(
        leading: Icon(Icons.cleaning_services,color: Color(0xFF2B74FE)),
        title: Text('MY Booking Servcies',),
        onTap: () async {
          await servicesController.fetchBookingServices(bookingId);
          print(servicesController.services);
          Get.to(() => MyBookingService(services: servicesController.services));
        },
      ),

      Divider(),
      ListTile(
        leading: Icon(Icons.language, color: Color(0xFF2B74FE)), // Icon representing language
        title: Row(
          children: [
            Text(
              'Language', // Title text
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 16), // Spacer between title and dropdown
            DropdownButton<String>(
              value: 'English', // Default value or get from locale
              onChanged: (String? language) {
                if (language == 'Arabic') {
                  Get.updateLocale(Locale('ar')); // Set Arabic locale
                } else {
                  Get.updateLocale(Locale('en')); // Set English locale
                }
              },
              items: <String>['English', 'Arabic'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),)



    ],
  ),
),
      body:
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/seaa.jpg'), // Path to your image
            fit: BoxFit.cover, // You can change the fit property as needed
          ),
          color:Colors.blue[300],
          ),


        child:
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
              /*    Row(

                    children: [

                      SizedBox(width:360,),
                      ElevatedButton (
                      onPressed: () async {
                            await controller.navigateToFavorites();
                            },
                              child: Text('Favorites', style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF2B74FE),
                                side: BorderSide(
                                  color:Color(0xFF2B74FE), // Border color
                                  width: 2.0, // Border width
                                  style: BorderStyle.solid, // Border style
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(7.0)), // Rectangular shape
                                ),

                              ),
                            ),
                    ],
                  ),*/


                SizedBox(height:10 ,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Text(
                            "Browse existing offers",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:20,
                              color: Colors.white70,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.5),
                                  offset: Offset(0, 2), // Adjust the offset of the shadow as needed
                                  blurRadius: 4, // Adjust the blur radius as needed
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      OutlinedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SingleChildScrollView(
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [

                                      Row(
                                        children: [
                                          Text(
                                            'Activities',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width:200,),
                                          ElevatedButton(onPressed: (){
                                            Get.to(()=>ServiceRequestPage());
                                          },
                                              child:Text("Service",style: TextStyle(color: Colors.black),),
                                            style:OutlinedButton.styleFrom(
                                              foregroundColor: Colors.black,
                                              side: BorderSide(color: Color(0xFF2B74FE), width: 2.0), // Border color and width
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0), // Rounded corners
                                              ),
                                            ),
                                          ),



                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      GridView.count(
                                        shrinkWrap: true,
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        children: [
                                          Image.asset('assets/images/activity.jpg'),
                                          Image.asset('assets/images/activity.jpg'),
                                          Image.asset('assets/images/c.jpg'),
                                        ],
                                      )

                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Text("Browse"),
                        style: OutlinedButton.styleFrom(

                          foregroundColor:Colors.white70,
                          side: BorderSide(color: Colors.white70, width: 2.0), // Border color and width
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // Rounded corners
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...', // Add a hint text
                      hintStyle: TextStyle(color:Colors.grey), // Style for the hint text
                      prefixIcon: InkWell(
                        child: Icon(Icons.search, color:Colors.grey), // Customize the icon color
                        onTap: () {
                          showSearch(
                            context: context,
                            delegate: CustomSearch(),
                          );
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)), // Rounded corners
                        borderSide: BorderSide(color: Colors.grey, width: 2.0), // Bold border
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)), // Rounded corners
                        borderSide: BorderSide(color: Colors.grey, width: 2.0), // Bold border
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)), // Rounded corners
                        borderSide: BorderSide(color: Colors.blue, width: 2.0), // Bold border when focused
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0), // Padding inside the text field
                      filled: true,
                      fillColor: Colors.white, // Background color for the text field
                    ),
                    style: TextStyle(color: Colors.black),

                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(0, 2), // Adjust the offset of the shadow as needed
                              blurRadius: 4, // Adjust the blur radius as needed
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 80, // Adjust the height as needed
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: categories.map((category) {
                        return _buildCategoryIcon(category['icon'], category['label']);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            // Expanded to make sure the grid takes the remaining space
            Expanded(
              child: Obx(() {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75, // Aspect ratio for each item
                  ),
                  itemCount: controller.hotels.length,
                  itemBuilder: (context, index) {
                    final hotel = controller.hotels[index];
                    return GestureDetector(
                      onTap: () async{

                        controller.navigateToRoomDetailsPage(hotel.id, hotel.imageUrl);

                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                        child: Container(
                                          height: 250,
                                          child: Image.asset(
                                            hotel.imageUrl,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: GestureDetector(
                                          onTap: () async {
                                           controller.toggleFavorite(hotel.id);// Toggle favorite status
                                          },
                                          child: Icon(
                                            hotel.isLiked ? Icons.favorite : Icons.favorite_border,
                                            color: hotel.isLiked ? Colors.red : Colors.grey, // Change color based on isLiked status
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        hotel.name,
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$${hotel.price}',
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                          ), RatingBar.builder(
                                            initialRating: hotel.rating ?? 0,
                                            minRating: 0,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 16,
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              // Update the rating of the hotel
                                              hotel.rating = rating;
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),


    );
  }
}

class CustomSearch extends SearchDelegate {
  List username = [
    "Price",
    "Number of Persons",
    "View",
    "Services"
  ];

  List? filterList;
  bool isLoading = false;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("Result $query");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List filteredList = username
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Material(
            elevation: 4.0, // Set elevation
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.black),
              ),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(filteredList[index]),
                ),
                onTap: () {
                  // Show loading indicator
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );

                  Future.delayed(Duration(seconds: 2), () {
                    // Close loading dialog
                    Navigator.of(context).pop();
                    // Navigate to corresponding page based on query
                    if (filteredList[index] == "View") {
                      Get.to(HotelN());
                    } else if (filteredList[index] == "Price") {
                     // Get.to(() => HotelP());
                    } else if (filteredList[index] == "Number of Persons") {
                      Get.to(HotelNP());
                    } else if (filteredList[index] == "Services") {
                      Get.to(HotelS());
                    }
                  });
                },
              ),
            ),
          ),
        );
      },
    );
  }




}




/* onSubmitted: (searchText) {
                      // Trigger search here
                      controller.searchRooms(search: searchText,
                          view: 'sea', averageRating: 4.5,
                        basePrice: 149,
                      );
                    },*/// Text style



