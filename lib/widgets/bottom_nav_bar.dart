import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';
import '../screens/allexercisesScreen.dart';
import '../screens/home_Screen.dart';
import '../screens/settingsScreen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
 final  bool isactive=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            press: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context)=>HomeScreen()),
                );
              });
            },
            title: "Today",
            svgScr: "assets/icons/calendar.svg",
            // isActive: isactive==true?Colors.blue:Colors.black,
          ),
          BottomNavItem(
             press: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context)=>AllExerScreen()),
                );
              });
            },
            title: "All Exercises",
            svgScr: "assets/icons/gym.svg",
            // isActive: ,
          ),
          BottomNavItem(
             press: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context)=>SettingsScreen()),
                );
              });
            },
            title: "Settings",
            svgScr: "assets/icons/Settings.svg",
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String? svgScr;
  final String? title;
  final VoidCallback? press;
  final bool isActive;
  BottomNavItem({
    Key? key,
    this.svgScr,
    this.title,
    this.press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(
            svgScr!,
            color: isActive==true ? kActiveIconColor : kTextColor,
          ),
          Text(
            title!,
            style: TextStyle(color: isActive ? kActiveIconColor : kTextColor),
          ),
        ],
      ),
    );
  }
}
