import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/const/constants.dart';
import 'package:flutter_to_do_list/data/auth_data.dart';
import 'package:flutter_to_do_list/providers/taskProvider.dart';
import 'package:provider/provider.dart';

class SignUp_Screen extends StatefulWidget {
  final VoidCallback show;
  SignUp_Screen(this.show, {super.key});

  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode1.addListener(() {
      setState(() {});
    });
    _focusNode2.addListener(() {
      setState(() {});
    });
    _focusNode3.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              taskProvider.image(),
              SizedBox(height: 50),
              taskProvider.textfield(
                  taskProvider.email, _focusNode1, 'Email', Icons.email),
              SizedBox(height: 10),
              taskProvider.textfield(taskProvider.password, _focusNode2,
                  'Password', Icons.password),
              SizedBox(height: 10),
              taskProvider.textfield(taskProvider.PasswordConfirm, _focusNode3,
                  'PasswordConfirm', Icons.password),
              SizedBox(height: 8),
              taskProvider.account(widget.show),
              SizedBox(height: 20),
              taskProvider.SignUP_bottom(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget account() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 15),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //       children: [
  //         Text(
  //           "Do you have an account?",
  //           style: TextStyle(color: Colors.grey[700], fontSize: 14),
  //         ),
  //         SizedBox(width: 5),
  //         GestureDetector(
  //           onTap: widget.show,
  //           child: Text(
  //             'Login',
  //             style: TextStyle(
  //                 color: Colors.blue,
  //                 fontSize: 14,
  //                 fontWeight: FontWeight.bold),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget SignUP_bottom() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 15),
  //     child: GestureDetector(
  //       onTap: () {
  //         AuthenticationRemote()
  //             .register( email.text, password.text, PasswordConfirm.text);
  //       },
  //       child: Container(
  //         alignment: Alignment.center,
  //         width: double.infinity,
  //         height: 50,
  //         decoration: BoxDecoration(
  //           color: custom_green,
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         child: Text(
  //           'Sign Up',
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 23,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget textfield(TextEditingController _controller, FocusNode _focusNode,
  //     String typeName, IconData iconss) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 15),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //       child: TextField(
  //         controller: _controller,
  //         focusNode: _focusNode,
  //         style: TextStyle(fontSize: 18, color: Colors.black),
  //         decoration: InputDecoration(
  //             prefixIcon: Icon(
  //               iconss,
  //               color: _focusNode.hasFocus ? custom_green : Color(0xffc5c5c5),
  //             ),
  //             contentPadding:
  //                 EdgeInsets.symmetric(horizontal: 15, vertical: 15),
  //             hintText: typeName,
  //             enabledBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(10),
  //               borderSide: BorderSide(
  //                 color: Color(0xffc5c5c5),
  //                 width: 2.0,
  //               ),
  //             ),
  //             focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(10),
  //               borderSide: BorderSide(
  //                 color: custom_green,
  //                 width: 2.0,
  //               ),
  //             )),
  //       ),
  //     ),
  //   );
  // }

  // Widget image() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 15),
  //     child: Container(
  //       width: double.infinity,
  //       height: 300,
  //       decoration: BoxDecoration(
  //         color: backgroundColors,
  //         image: DecorationImage(
  //           image: AssetImage('images/7.png'),
  //           fit: BoxFit.fitWidth,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
