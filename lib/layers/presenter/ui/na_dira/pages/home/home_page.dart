import 'package:flutter/material.dart';
import 'package:park_hotel/layers/presenter/ui/create_product/create_product_page.dart';
import 'package:park_hotel/layers/presenter/ui/manager_event/manager_event_page.dart';
import 'package:park_hotel/layers/presenter/ui/na_dira/components/drawer/drawer_widget.dart';
import 'package:park_hotel/layers/presenter/ui/na_dira/components/page_view/guest/guest_view.dart';
import 'package:park_hotel/layers/presenter/ui/na_dira/components/page_view/product/product_view.dart';
import 'package:park_hotel/layers/presenter/ui/na_dira/components/page_view/sale/sale_view.dart';
import 'package:park_hotel/layers/presenter/ui/register_in_or_out_guest/register_in_or_out_guest_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }
  double viewPort = .9;
  final pageController = PageController(viewportFraction: .9);
  int currentIndex = 0;
  final imageBackground = "assets/images/background_cocktail.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the HomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Park Hotel"),
      ),
      drawer: const DrawerWidget(),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imageBackground),
              fit: BoxFit.cover,
              opacity: .5,
              filterQuality: FilterQuality.high),
        ),
        child: PageView(
          
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
          
            });
          },
          children:  [SaleView(), RegisterInOrOutGuestPage(), CreateProductPage()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey.shade800,
          selectedItemColor: Colors.deepOrange,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_add_alt_rounded), label: "Consumidor"),
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood), label: "Produtos")
          ]),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
