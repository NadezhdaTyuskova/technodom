import 'package:flutter/material.dart';
import 'instrument.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
class HandInstrument extends StatelessWidget {
  const HandInstrument({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(builder: (context, value, child) {
      return ListView.builder(
          itemCount: value.shopItemsHand.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final handInstrument = value.shopItemsHand[index];
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
                              handInstrument.itemPath,
                              height: 100,
                            ),
                            Text(handInstrument.itemName),
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
                                      title: Text(handInstrument.itemName),
                                      content: Column(
                                        children: [
                                          Image.asset(
                                            handInstrument.itemPath,
                                            height: 100,
                                          ),
                                          const SizedBox(height: 20),
                                          Text(handInstrument.itemOther),
                                          const SizedBox(height: 20),
                                          Text("Цена "+handInstrument.itemPrice + " руб",style: TextStyle(fontWeight: FontWeight.bold),),
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
                              .addHandItemToCart(index);
                        },
                        color: Colors.green[400],
                        child: Text(handInstrument.itemPrice + " руб"))
                  ],
                ),
              ),
            );
          });
    });
  }
}
