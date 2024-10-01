import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        title: const Text(
          "Вход в Ваш аккаунт",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 30,
            shadows: [
              Shadow(
                  // bottomLeft
                  offset: Offset(-1.5, -1.5),
                  color: Colors.white),
              Shadow(
                  // bottomRight
                  offset: Offset(1.5, -1.5),
                  color: Colors.white),
              Shadow(
                  // topRight
                  offset: Offset(1.5, 1.5),
                  color: Colors.white),
              Shadow(
                  // topLeft
                  offset: Offset(-1.5, 1.5),
                  color: Colors.white),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Center(child: Container(child: _HeaderWidget())),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/pictures/zastavka.jpg"),
              fit: BoxFit.fill)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox( height: 5, ),
            _FormWidget(),
          ],
        ),
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});
  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText = null;
  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;
      print('Открыть приложение');
      Navigator.pushNamed(context, '/h');
    } else {
      errorText = "Не верный логин или пароль";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontSize: 18,
      color: Colors.green,
      shadows: [
        Shadow(
            // bottomLeft
            offset: Offset(-1.5, -1.5),
            color: Colors.white),
      ],
    );
    final textFieldDecorator = const InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      isCollapsed: true,
    );
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null)
          Text(
            "Не верный логин и пароль",
            style: TextStyle(color: Colors.red),
          ),
        const SizedBox(
          height: 120,
        ),
        Text(
          "Имя пользователя",
          style: textStyle,
        ),
        Material(
          elevation:18,
          shadowColor: Colors.green,
          child: TextField(
              controller: _loginTextController, decoration: textFieldDecorator),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Пароль",
          style: textStyle,
        ),
        Material(
          elevation: 18,
          shadowColor: Colors.green,
          child: TextField(
            controller: _passwordTextController,
            decoration: textFieldDecorator,
            obscureText: true,

          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: _auth,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.green),
                ),
                child: const Text(
                  "Войти",
                  style: TextStyle(color: Colors.white,fontSize: 15),
                )),

          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Center(
          child: Image.asset(
            "lib/pictures/logo.jpg",
            height: 100,
          ),
        ),
      ],
    );
  }
}
