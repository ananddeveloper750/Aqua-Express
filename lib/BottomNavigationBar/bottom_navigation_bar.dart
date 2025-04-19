import 'package:aqua_express_cloth/CartScreen/cart_screen.dart';
import 'package:aqua_express_cloth/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../UserProfileScreen/user_profile_screen.dart';
import '../UiHelper/cart_provider.dart';

class BottomNavigationAppBar extends StatefulWidget {
  const BottomNavigationAppBar({super.key});

  @override
  State<BottomNavigationAppBar> createState() => BottomNavigationAppBarState();
}

class BottomNavigationAppBarState extends State<BottomNavigationAppBar> {
  bool _isBottomBarVisible = true;
  final ScrollController scrollController = ScrollController();
  late int _selectedIndex = 0;
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();

    pages = [
      HomeScreen(scrollController: scrollController),
      ProfileScreen(),
      CartScreen(),
    ];

    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (_isBottomBarVisible) {
          setState(() {
            _isBottomBarVisible = false;
          });
        }
      } else if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (!_isBottomBarVisible) {
          setState(() {
            _isBottomBarVisible = true;
          });
        }
      }
    });
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: pages[_selectedIndex],
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: _isBottomBarVisible ? 80 : 0,
        curve: Curves.easeInOut,
        child: Wrap(
          children: [
            AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: _isBottomBarVisible ? 1.0 : 0.0,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: BottomNavigationBar(
                  unselectedItemColor: Colors.black,
                  selectedItemColor: Colors.pink.shade500,
                  backgroundColor: Colors.blue.shade300,
                  onTap: _onTap,
                  currentIndex: _selectedIndex,
                  items: [
                    /// 🏠 Home Icon
                    BottomNavigationBarItem(
                      icon: FaIcon(FontAwesomeIcons.house),
                      label: "Home",
                    ),

                    /// 👤 Account Icon
                    BottomNavigationBarItem(
                      icon: FaIcon(FontAwesomeIcons.userPlus),
                      label: "Account",
                    ),

                    /// 🛒 Cart Icon with Badge
                    BottomNavigationBarItem(
                      icon: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10,top: 10),
                            child: FaIcon(FontAwesomeIcons.cartPlus),
                          ), // Cart Icon
                          if (cart.cartItems.isNotEmpty) // If Cart has items, show badge
                            Positioned(
                              right: -0,
                              top: -4,
                              child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  cart.cartItems.length.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      label: "Cart",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
