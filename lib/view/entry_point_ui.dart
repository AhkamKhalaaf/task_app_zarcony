import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../app_config.dart';
import '../controllers/data_controller.dart';
import '../controllers/tab_controller.dart';
import 'tabs_ui/cart_ui.dart';
import 'tabs_ui/grocery/main_grocery_ui.dart';

class EntryPointUi extends StatefulWidget {
  const EntryPointUi({Key? key}) : super(key: key);

  @override
  _HomeUiState createState() => _HomeUiState();
}

class _HomeUiState extends State<EntryPointUi> {
  final tabsController =
      ChangeNotifierProvider((ref) => TabControllerNotifier());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Consumer(
      builder: (context, watch, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: getCurrentIndex(watch(tabsController).screenHomeTab)),
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 30.0,
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/backappbar.png'))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      ImageIcon(
                        AssetImage('assets/icons/loc.png'),
                        color: Colors.white,
                        size: 15.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: Text(
                          'Mustafa st  ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 25.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border:
                          Border.all(width: 1.0, color: appConfig.colorText)),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Stack(
            overflow: Overflow.visible,
            children: [
              BottomNavigationBar(
                  backgroundColor: appConfig.colorText.withOpacity(0.125),
                  elevation: 0.0,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Theme.of(context).primaryColor,
                  unselectedItemColor: Colors.grey,
                  currentIndex: watch(tabsController).screenHomeTab,
                  onTap: (index) {
                    if (index != 2) {
                      context.read(tabsController).screenHomeTabSwitch(index);
                    }
                  },
                  items: const [
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/icons/gro.png'),
                          size: 20.0,
                        ),
                        title: Text('Grocery',
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.bold))),
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/icons/notif.png'),
                          size: 20.0,
                        ),
                        title: Text('News',
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.bold))),
                    BottomNavigationBarItem(
                        icon: SizedBox(
                          width: 0.0,
                        ),
                        title: Text('')),
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/icons/fav.png'),
                          size: 20.0,
                        ),
                        title: Text('Favorites',
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.bold))),
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/icons/order.png'),
                          size: 20.0,
                        ),
                        title: Text('Cart',
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.bold)))
                  ]),
              Positioned(
                bottom: 30.0,
                left: MediaQuery.of(context).size.width * 0.5 - 30,
                child: GestureDetector(
                  onTap: () {
                    context.read(tabsController).screenHomeTabSwitch(2);
                  },
                  child: Container(

                    padding:const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: appConfig.colorMain, shape: BoxShape.circle),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Consumer(
                          builder: (context, watch, child) {
                            return Text(
                              '\$ ${watch(getAllData).total}',
                              style: const TextStyle(color: Colors.white),
                            );
                          },
                        ),
                        const ImageIcon(
                          AssetImage('assets/icons/cart.png'),
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    ));
  }

  Widget getCurrentIndex(int index) {
    if (index == 4) {
      //
      return const CartUi();
    } else if (index == 3) {
      return const Center(
        child: Text('FavoriteUi ui'),
      );
    } else if (index == 2) {
      return const Center(
        child: Text(' Order ui'),
      );
    } else if (index == 1) {
      return const Center(
        child: Text('News ui'),
      );
    } else if (index == 0) {
      return const GroceryUi();
    } else {
      return const GroceryUi();
    }
  }
}
