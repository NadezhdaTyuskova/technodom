import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/h');
                  },
                  icon: const Icon(Icons.home, color: Colors.white)),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/c');
                  },
                  icon: const Icon(Icons.shopping_cart, color: Colors.white)),
            ],
            centerTitle: true,
            backgroundColor: Colors.green,
          ),
          body: Center(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(18),
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
                  ]
              ),
              child:
              Column(
                children: [
                  Container(
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
                          ]
                      ),
                      child: Image.network("https://i.postimg.cc/Px62wntR/fotoMain.jpg",height: 100,)
                  ),
                     SizedBox(height: 20,),

                     Text(' Тел: +79270403434',style: TextStyle( fontSize: 20),),
                     Text(' Ватсап: +79375969100',style: TextStyle( fontSize: 20),),
                     SizedBox(height: 30,),
                     Text('Наш адрес: ',style: TextStyle( fontSize: 20),),
                     Text('Альметьевский тракт, 28/2',style: TextStyle( fontSize: 20),),
                     Container(
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
                   ]
               ),
               child: Image.network("https://i.ibb.co/nwhWK4K/shema.jpg",)),
                ],
              ),
            ),
          )
      ),
    );
  }
}