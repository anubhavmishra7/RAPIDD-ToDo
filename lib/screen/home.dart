import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_to_do_list/const/constants.dart';
import 'package:flutter_to_do_list/data/auth_data.dart';
import 'package:flutter_to_do_list/data/firestore.dart';
import 'package:flutter_to_do_list/screen/add_note_screen.dart';
import 'package:flutter_to_do_list/screen/login.dart';
import 'package:flutter_to_do_list/widgets/stream_note.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  bool show = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "RAPIDD ToDo",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      drawer: Drawer(
        child: Container(
          width: double.maxFinite,
          child: Column(
            children: [
              ClipRRect(
                child: Container(
                    height: 200,
                    color: Color(0xff92c7cf),
                    child: Center(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Icon(
                          Icons.supervised_user_circle_rounded,
                          size: 100,
                          color: Colors.white,
                        ),
                        Text(
                          _auth.currentUser!.email.toString(),
                          style: kTextStyle.copyWith(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ))),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent)),
                width: double.maxFinite,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0, backgroundColor: Colors.transparent),
                    onPressed: () {
                      AuthenticationRemote().logOut();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogIN_Screen(() {})),
                          (route) => false);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.logout_outlined),
                        SizedBox(
                          width: 40,
                        ),
                        Text("Log out"),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: backgroundColors,
      floatingActionButton: Visibility(
        visible: true,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Add_creen(),
            ));
          },
          backgroundColor: Color(0xff92c7cf),
          child: Icon(Icons.add, color: Colors.white, size: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: () async {
            Future.value(
                Firestore_Datasource().getNotes(AsyncSnapshot.nothing()));
          },
          child: SafeArea(
            child: NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                if (notification.direction == ScrollDirection.forward) {
                  setState(() {
                    show = true;
                  });
                }
                if (notification.direction == ScrollDirection.reverse) {
                  setState(() {
                    show = false;
                  });
                }
                return true;
              },
              child: Column(
                children: [
                  Stream_note(false),
                  RefreshIndicator(
                      onRefresh: () async {}, child: Stream_note(true)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
