import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technodom/instrument.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'cart_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Корзина"),
          ),
          body: Consumer<CartModel>(
            builder: (context, value, child) {
              return Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: value.cartItems.length,
                          padding: const EdgeInsets.all(12),
                          itemBuilder: (context, index) {
                            return Dismissible(
                              background: Container(
                                color: Colors.green,
                              ),
                              key: ValueKey<Instrument>(value.cartItems[index]),
                              onDismissed: (DismissDirection direction){
                                setState(() {
                                  value.removeItemFromCart(index);
                                });
                              },
                              child:
                              Padding(
                              padding: const EdgeInsets.all(12),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8)),
                                child: ListTile(
                                   leading:
                            Image.asset(
                                    value.cartItems[index].itemPath,
                                    height: 36,
                                  ),
                                  title: Text(value.cartItems[index].itemName),
                                  subtitle: Text(
                                      value.cartItems[index].itemPrice + " руб"),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.cancel),
                                    onPressed: () => Provider.of<CartModel>(
                                            context,
                                            listen: false)
                                        .removeItemFromCart(index),
                                  ),
                                ),
                              ),
                              ),
                            );
                          })),
                  //итоговая сумма
                  Padding(
                    padding: const EdgeInsets.all(36),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Итоговая сумма"),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  value.calculateTotal() + " руб",
                                  style: const TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black.withOpacity(0.4)),
                                  borderRadius: const BorderRadius.all(Radius.circular(60)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 3),
                                    ),
                                  ]
                              ),
                              child:
                                  TextButton(
                                      onPressed:(){ Navigator.pushNamed(context, '/p');},
                                      style: TextButton.styleFrom(fixedSize: Size.fromHeight(50)),
                                        child: const Text(
                                        "Оплатить",
                                        style: TextStyle(color: Colors.green,fontSize: 20),
                                      )
                                  ),

                              ),

                          ],
                        )),
                  )
                ],
              );
            },
          )),
    );
  }
}
