import 'package:flutter/material.dart';
import 'package:shop/pages/homes/account_page/account_page.dart';
import 'package:shop/pages/homes/basket_page/basket_page.dart';
import 'package:shop/pages/homes/products_page/products_page.dart';
import 'package:shop/utils/routes_name.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      switch (index) {
        case 0: // Basket
          Navigator.pushNamed(context, route(BasketPage));
          break;
        case 1: // Products
          Navigator.pushNamed(context, route(ProductsPage));
          break;
        case 2: // Account
          Navigator.pushNamed(context, route(AccountPage));
          break;
        default:
          break;
      }
    }

    return BottomNavigationBar(
      onTap: (value) => onItemTapped(value),
      backgroundColor: Color.fromARGB(255, 248, 196, 27),
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            width: 45,
            height: 45,
            child: Icon(
              Icons.shopping_basket,
              color: Colors.black,
            ),
          ),
          label: 'Basket',
          tooltip: 'Basket',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            width: 45,
            height: 45,
            child: Icon(
              Icons.shopping_bag_rounded,
              color: Colors.black,
            ),
          ),
          label: 'Shop',
          tooltip: 'Shop',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            width: 45,
            height: 45,
            child: Icon(
              Icons.account_box,
              color: Colors.black,
            ),
          ),
          label: 'Account',
          tooltip: 'Account',
        ),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}
