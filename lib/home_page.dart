import 'package:flutter/material.dart';
import 'package:technodom/benz_instrument.dart';
import 'package:technodom/el_instrument.dart';
import 'package:technodom/hand_instrument.dart';
class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  double _size = 50;

  static  final List<Widget> _widgetOptions = <Widget>[
    const ElInstrument(),
    const BenzInstrument(),
    const HandInstrument(),
  ];
  int _selectedTab = 0;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text(
          'ТехноДом+',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            shadows: [
              Shadow(
                   offset: Offset(-1.5, -1.5),
                  color: Colors.white),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){ Navigator.pushNamed(context, '/s');},
              icon: const Icon(Icons.search, color: Colors.white)),
          IconButton(
              onPressed:(){ Navigator.pushNamed(context, '/c');},
              icon: const Icon(Icons.shopping_cart, color: Colors.white)),
        ],
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black.withOpacity(0.2)),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]),
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]),
                child: const DrawerHeader(
                  decoration: BoxDecoration(
                    //color: Colors.green,
                    image: DecorationImage(
                        image: AssetImage("lib/pictures/e1.jpeg",),
                        fit: BoxFit.contain)
                  ),
                  child: Text('ТехноДом+'),
                ),
              ),
              ListTile(
                title: const Text('О нас'),
                onTap: () {Navigator.pushNamed(context, '/a');},
              ),
              ListTile(
                title: const Text('Корзина'),
                onTap: () {Navigator.pushNamed(context, '/c');},
              ),
              ListTile(
                title: const Text('Выход'),
                onTap: () {Navigator.pushNamed(context, '/');},
              ),
              ListTile(
                title: AnimatedContainer(
                    duration: Duration(seconds:2),
                    child: Icon(Icons.handshake_outlined,size: _size,),
                  curve: Curves.fastOutSlowIn,
                ),
               onTap: () {
                 setState(() {
                   _size =_size+50;
                   if(_size>200)_size=50;
                  });
               },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Электроинструмент'),
          BottomNavigationBarItem(
              icon: Icon(Icons.movie), label: 'Бензоинструмент'),
          BottomNavigationBarItem(
              icon: Icon(Icons.tv), label: 'Ручной инструмент'),
        ],
        onTap: onSelectTab,
      ),
      body: Center(
        child: Container(
          child: _widgetOptions[_selectedTab],
        ),
      ),
    ));
  }
}
