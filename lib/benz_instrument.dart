import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';

class BenzInstrument extends StatelessWidget {
  const BenzInstrument({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(builder: (context, value, child) {
      return ListView.builder(
          itemCount: value.shopItemsBenz.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final benzInstrument = value.shopItemsBenz[index];
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(10),
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
                              benzInstrument.itemPath,
                              height: 100,
                            ),
                            Text(benzInstrument.itemName),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 250,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(benzInstrument.itemName),
                                      content: Column(
                                        children: [
                                          Image.asset(
                                            benzInstrument.itemPath,
                                            height: 100,
                                          ),
                                          const SizedBox(height: 20),
                                          Text(benzInstrument.itemOther),
                                          const SizedBox(height: 20),
                                          Text("Цена "+benzInstrument.itemPrice + " руб",style: TextStyle(fontWeight: FontWeight.bold),),
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
                              .addBenzItemToCart(index);
                        },
                        color: Colors.green[400],
                        child: Text(benzInstrument.itemPrice + " руб"))
                  ],
                ),
              ),
            );
          });
    });
  }
}
