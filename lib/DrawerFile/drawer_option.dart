import 'package:aqua_express_cloth/OrderScreen/order_screen.dart';
import 'package:aqua_express_cloth/UiHelper/ui_helper.dart';
import 'package:aqua_express_cloth/UserProfileScreen/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerOption extends StatefulWidget{
  const DrawerOption({super.key});


  @override
  State<DrawerOption> createState() => _DrawerOptionState();
}

class _DrawerOptionState extends State<DrawerOption> {
  List drawerItemList=[
    {
      "name":"Profile",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          focusColor: Colors.pink,
          hoverColor: Colors.red,
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => OrderScreen(),));
          },
          leading: Image.asset("assets/icons/orders.png",width:28,),
          title: Text("Orders",style: TextStyle(fontSize: 20,fontFamily: "roboto",fontWeight: FontWeight.bold),),
          trailing:FaIcon(FontAwesomeIcons.greaterThan,size: 20,color: Colors.black,)
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
          },
          child: ListTile(
            leading: FaIcon(FontAwesomeIcons.user),
            title: Text("Profile"),
            trailing:FaIcon(FontAwesomeIcons.arrowRight)
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("Profile"),
          trailing:FaIcon(FontAwesomeIcons.arrowRight)
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("Profile"),
          trailing: FaIcon(FontAwesomeIcons.arrowRight)
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("Profile"),
          trailing: FaIcon(FontAwesomeIcons.arrowRight)
        ),
        UiHelper().customListTile(name: "Orders", icon: Icons.account_circle)
      ],
    );
  }
}