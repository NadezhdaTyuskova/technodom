import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool isLightTheme = false;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  bool useFloatingAnimation = true;
  final OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey.withOpacity(0.7),
      width: 2.0,
    ),
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      isLightTheme ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
    );
    return MaterialApp(
      title: 'Flutter Credit Card View Demo',
      debugShowCheckedModeBanner: false,
      //themeMode: isLightTheme ? ThemeMode.light : ThemeMode.dark,
      theme: ThemeData(
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: Colors.black, fontSize: 18),
        ),
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: Colors.white,
          background: Colors.white,
          primary: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(color: Colors.black),
          labelStyle: const TextStyle(color: Colors.black),
          focusedBorder: border,
          enabledBorder: border,
        ),
      ),
      darkTheme: ThemeData(
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: Colors.white, fontSize: 18),
        ),
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.black,
          background: Colors.white,
          primary: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(color: Colors.black),
          labelStyle: const TextStyle(color: Colors.black),
          focusedBorder: border,
          enabledBorder: border,
        ),
      ),
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
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
          resizeToAvoidBottomInset: false,
          body:Builder(
            builder: (BuildContext context) {
              return Container(
                /*decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(
                      isLightTheme ? 'assets/bg-light.png' : 'assets/bg-dark.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),*/
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                     /* IconButton(
                        onPressed: () => setState(() {
                          isLightTheme = !isLightTheme;
                        }),
                        icon: Icon(
                          isLightTheme ? Icons.light_mode : Icons.dark_mode,
                        ),
                      ),*/
                      CreditCardWidget(
                        enableFloatingCard: useFloatingAnimation,
                        //glassmorphismConfig: _getGlassmorphismConfig(),
                        cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        //bankName: 'Axis Bank',
                        frontCardBorder: useGlassMorphism
                            ? null
                            : Border.all(color: Colors.grey),
                        backCardBorder: useGlassMorphism
                            ? null
                            : Border.all(color: Colors.grey),
                        showBackView: isCvvFocused,
                        obscureCardNumber: true,
                        obscureCardCvv: true,
                        isHolderNameVisible: true,
                        /*cardBgColor: isLightTheme
                            ? AppColors.cardBgLightColor
                            : AppColors.cardBgColor,*/
                        //backgroundImage:
                        //useBackgroundImage ? 'assets/card_bg.png' : null,
                        isSwipeGestureEnabled: true,
                        onCreditCardWidgetChange:
                            (CreditCardBrand creditCardBrand) {},
                        customCardTypeIcons: <CustomCardTypeIcon>[
                          CustomCardTypeIcon(
                            cardType: CardType.mastercard,
                            cardImage: Image.asset(
                              'assets/mastercard.png',
                              height: 48,
                              width: 48,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              CreditCardForm(
                                formKey: formKey,
                                obscureCvv: true,
                                obscureNumber: true,
                                cardNumber: cardNumber,
                                cvvCode: cvvCode,
                                isHolderNameVisible: true,
                                isCardNumberVisible: true,
                                isExpiryDateVisible: true,
                                cardHolderName: cardHolderName,
                                expiryDate: expiryDate,
                                inputConfiguration: const InputConfiguration(
                                  cardNumberDecoration: InputDecoration(
                                    labelText: 'номер карты',
                                    hintText: 'XXXX XXXX XXXX XXXX',
                                  ),
                                  expiryDateDecoration: InputDecoration(
                                    labelText: 'годна до',
                                    hintText: 'XX/XX',
                                  ),
                                  cvvCodeDecoration: InputDecoration(
                                    labelText: 'код',
                                    hintText: 'XXX',
                                  ),
                                  cardHolderDecoration: InputDecoration(
                                    labelText: 'владелец карты',
                                  ),
                                ),
                                onCreditCardModelChange: onCreditCardModelChange,
                              ),
                              const SizedBox(height: 20),


                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: _onValidate,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  /*decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        AppColors.colorB58D67,
                                        AppColors.colorB58D67,
                                        AppColors.colorE5D1B2,
                                        AppColors.colorF9EED2,
                                        AppColors.colorEFEFED,
                                        AppColors.colorF9EED2,
                                        AppColors.colorB58D67,
                                      ],
                                      begin: Alignment(-1, -4),
                                      end: Alignment(1, 4),
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),*/
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 15),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Оплатить',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'halter',
                                      fontSize: 14,
                                      package: 'flutter_credit_card',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ),
    );
  }

  void _onValidate() {
    if (formKey.currentState?.validate() ?? false) {
      print('valid!');
    } else {
      print('invalid!');
    }
  }


  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
