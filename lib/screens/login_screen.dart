import 'package:flutter/material.dart';
import 'package:todo/const/colors.dart';
import 'package:todo/data/auth_data.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback? show;
  const LoginScreen(this.show, {super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();

  final email = TextEditingController();
  final password = TextEditingController();

// 색깔 초기값
  Color iconColor1 = const Color(0xff18DAA3);
  Color iconColor2 = const Color(0xffc5c5c5);

  @override
  void initState() {
    super.initState();

    _focusNode1.addListener(_onFocusChange);
    _focusNode2.addListener(_onFocusChange);
  }

// 포커스에 따라 아이콘 색 업데이트
  void _onFocusChange() {
    setState(() {
      iconColor1 = _focusNode1.hasFocus
          ? const Color(0xff18DAA3)
          : const Color(0xffc5c5c5);
      iconColor2 = _focusNode2.hasFocus
          ? const Color(0xff18DAA3)
          : const Color(0xffc5c5c5);
    });
  }

// dispose를 통한 메모리 누수방지.  '이벤트리스너 제거'
  @override
  void dispose() {
    _focusNode1.removeListener(_onFocusChange);
    _focusNode2.removeListener(_onFocusChange);

    _focusNode1.dispose();
    _focusNode2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              image(),
              const SizedBox(height: 50),
              textfield(email, _focusNode1, 'email', Icons.email, false),
              const SizedBox(height: 10),
              textfield(
                  password, _focusNode2, 'password', Icons.password, true),
              const SizedBox(height: 20),
              account(),
              const SizedBox(height: 15),
              Login_bottom()
            ],
          ),
        ),
      ),
    );
  }

  Widget account() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: widget.show,
          child: const Text(
            'Sign Up',
            style: TextStyle(
                color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget Login_bottom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          AuthenticationRemote().login(email.text, password.text);
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xff18DAA3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            'Login',
            style: TextStyle(
                color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget textfield(
    TextEditingController controller,
    FocusNode focusNode,
    String typeName,
    IconData iconss,
    bool isPassword,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          obscureText: isPassword,
          style: const TextStyle(fontSize: 10, color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: Icon(
              iconss,
              color: focusNode.hasFocus
                  ? const Color(0xff18DAA3)
                  : const Color(0xffc5c5c5),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: typeName,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color(0xff18DAA3),
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget image() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/7.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
