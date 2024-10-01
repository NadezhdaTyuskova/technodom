import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
import 'instrument.dart';

List <Instrument>_instrument= List<Instrument>.from(CartModel().listall() as List);

class Search extends StatefulWidget {
  const Search({super.key});
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  var _filteredInstrument=<Instrument>[];
  final _searchController=TextEditingController();


  void _searchInstrument(){
    if (_searchController.text.isNotEmpty){
      _filteredInstrument=_instrument.where((Instrument instrument){
        return instrument.itemName.toLowerCase().contains(_searchController.text.toLowerCase());
      }).toList();
    } else  {
      _filteredInstrument=_instrument;
    }
    setState(() { });

  }
  @override
  void initState()
  {
       super.initState();
       _filteredInstrument=_instrument;
       _searchController.addListener(_searchInstrument);
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
                onPressed: (){ Navigator.pushNamed(context, '/h');},
                icon: const Icon(Icons.home, color: Colors.white)),
            IconButton(
                onPressed:(){ Navigator.pushNamed(context, '/c');},
                icon: const Icon(Icons.shopping_cart, color: Colors.white)),
          ],
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Consumer<CartModel>(builder: (context, value, child) {
          return Stack(
            children: [
             ListView.builder(
                  padding: const EdgeInsets.only(top: 110),
                 itemCount: _filteredInstrument.length,
                itemExtent: 150,
                itemBuilder: (BuildContext context, int index) {
                  final instrument = _filteredInstrument[index];
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(children: [
                            Container(
                              width: 250,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    instrument.itemPath,
                                    height: 100,
                                  ),
                                  Text(instrument.itemName),
                                ],
                              ),
                            ),
                            Container(
                              height: 140,
                              width: 250,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text(instrument.itemName),
                                            content: Column(
                                              children: [
                                                Image.asset(
                                                  instrument.itemPath,
                                                  height: 100,
                                                ),
                                                const SizedBox(height: 20),
                                                Text(instrument.itemOther),
                                                const SizedBox(height: 20),
                                                Text("Цена "+instrument.itemPrice + " руб",style: TextStyle(fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                ),
                              ),
                            ),
                          ]),
                          const SizedBox(
                            width: 10,
                          ),
                          MaterialButton(
                              onPressed: () {
                                Provider.of<CartModel>(context, listen: false)
                                    .addElItemToCart(index);
                              },
                              color: Colors.green[400],
                              child: Text(instrument.itemPrice + " руб")
                          )
                        ],
                      ),
                    ),
                  );
                }),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: "Поиск",
                    filled: true,
                    fillColor: Colors.white.withAlpha(235),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
          ],
          );
        }),
      ),
    );
  }
}
