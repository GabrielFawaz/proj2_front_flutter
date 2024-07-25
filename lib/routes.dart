import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untitled1/pages/Language.dart';
import 'package:untitled1/pages/auth/Register/checkemail.dart';
import 'package:untitled1/pages/auth/Register/register1.dart';
import 'package:untitled1/pages/auth/Register/verfiycode.dart';
import 'package:untitled1/pages/auth/forgetpassword/resetpasswordcode.dart';
import 'package:untitled1/pages/auth/forgetpassword/sendresetpassword.dart';
import 'package:untitled1/pages/booking/reservation.dart';
import 'package:untitled1/pages/dashboard/dashboardscreen.dart';
import 'package:untitled1/pages/dashboard/managing_reports/adminsearchroom.dart';
import 'package:untitled1/pages/dashboard/managing_rooms/adminallrooms.dart';
import 'package:untitled1/pages/dashboard/managing_users/banunbanuser.dart';
import 'package:untitled1/pages/dashboard/managing_users/deleteuser.dart';
import 'package:untitled1/pages/dashboard/managing_users/getprofile.dart';
import 'package:untitled1/pages/dashboard/managing_users/searchuser.dart';
import 'package:untitled1/pages/dashboard/managing_users/viewallusers.dart';
import 'package:untitled1/pages/homepage/homepage.dart';
import 'package:untitled1/pages/onboarding.dart';
import 'package:untitled1/pages/profile/profile.dart';
import 'package:untitled1/pages/report/report.dart';
import 'package:untitled1/pages/report/reports.dart';
import 'package:untitled1/repository/account_repo.dart';
import 'package:untitled1/repository/profile_repo.dart';
import 'constant/routes.dart';
import 'pages/auth/login/login.dart';
import 'pages/profile/updateprofile.dart';
import 'package:untitled1/pages/homepage/favorite.dart';
/////////

List<GetPage<dynamic>>? routes =[
  //TODO AUTH
 //GetPage(name: "/", page: ()=> myServices.sharedPreferences.getString("token") == null?const Language():  HotelHome(token: myServices.sharedPreferences.getString("token")!,)),
// GetPage(name:"/", page: ()=>const OnBoarding()),

 //GetPage(name:AppRoute.onBoarding, page: ()=>const OnBoarding()),
 // GetPage(name:"/", page: ()=> const Login()),
  GetPage(name:AppRoute.login, page: ()=> const Login()),
 GetPage(name:AppRoute.checkemail, page: () => Checkemail()),

 GetPage(name:AppRoute.checkemail, page: () => Checkemail()),
  GetPage(name:AppRoute.verifycode, page: () => VerfiyCode()),
  GetPage(name: AppRoute.verifycode, page: () => VerfiyCode()),
 //GetPage(name:"/" , page:()=>Register1()),
  GetPage(name:AppRoute.register1 , page:()=>Register1()),
  GetPage(name:AppRoute.sendresetpassword , page:()=>SendResetPassword()),
  GetPage(name: AppRoute.resetpasswordcode, page:()=>ResetPasswordCode()),
  GetPage(name: AppRoute.profile, page:()=>Profile()),
 // GetPage(name: AppRoute.uodateprofile, page:()=>UpdateProfile()),

  //TODO Dashboard
  GetPage(name: "/", page: () => DashboardScreen()),
  GetPage(name: AppRoute.dashboardscreen, page: () => DashboardScreen()),  // Add this route
  GetPage(name: AppRoute.viewallusers, page: () => ViewAllUsers()),  // Add this route
  //GetPage(name: AppRoute.edituser, page: () => EditUser()),
  GetPage(name: AppRoute.getprofile, page: () => UserProfile()), // Define route with parameter userId
  GetPage(name: AppRoute.banunbanuser, page: () => BanUnbanUser()),
  GetPage(name: AppRoute.deleteuser, page: () => DeleteUser()),
  GetPage(name: AppRoute.searchuser, page: () => SearchUser()),
  GetPage(name: AppRoute.adminallrooms, page: () => AdminAllRooms()), // Add AdminAllRooms page here
 GetPage(name: AppRoute.adminroomsearch, page: () => AdminRoomSearch()),

 //TODO RESERVATION
  GetPage(name: AppRoute.reservation, page:()=>Reservation()),

  //TODO Homepage
  GetPage(name: AppRoute.hotelhome, page:()=>HotelHome(token: '',)),
 // GetPage(name: "/", page:()=>HotelHome(token: '',)),
  GetPage(name: AppRoute.favorite, page: () => Favorite(wishlistData: [])),
  //GetPage(name: "/", page: () => Report()),

  //GetPage(name: AppRoute.report, page: () => Reports()),

];