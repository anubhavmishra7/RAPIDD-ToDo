import 'package:flutter/material.dart';
// import 'package:flutter_to_do_list/const/constants.dart';
// import 'package:flutter_to_do_list/data/firestor.dart';
import 'package:flutter_to_do_list/model/notes_model.dart';
import 'package:flutter_to_do_list/screen/edit_screen.dart';
import 'package:share_plus/share_plus.dart';

class Task_Widget extends StatefulWidget {
  Note _note;
  Task_Widget(this._note, {super.key});

  @override
  State<Task_Widget> createState() => _Task_WidgetState();
}

class _Task_WidgetState extends State<Task_Widget> {
  final GlobalKey _shareButtonKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    bool isDone = widget._note.isDon;
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color.fromARGB(161, 16, 97, 236),
            showCloseIcon: true,
            behavior: SnackBarBehavior.floating,
            content: Text("Swipe left to Delete")));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                // image

                // imageee(),
                SizedBox(width: 25),
                // title and subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget._note.title,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Checkbox(
                          //   activeColor: custom_green,
                          //   value: isDone,
                          //   onChanged: (value) {
                          //     setState(() {
                          //       isDone = !isDone;
                          //     });
                          //     Firestore_Datasource()
                          //         .isdone(widget._note.id, isDone);
                          //   },
                          // )
                        ],
                      ),
                      Text(
                        widget._note.subtitle,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade400),
                      ),
                      Spacer(),
                      edit_time()
                    ],
                  ),
                ),
                IconButton(
                    key: _shareButtonKey,
                    onPressed: () {
                      if (widget._note.title != null) {
                        shareTask(widget._note.title);
                      }
                    },
                    icon: Icon(Icons.share))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void shareTask(String taskText) {
    final RenderBox? box =
        _shareButtonKey.currentContext!.findRenderObject() as RenderBox?;
    if (box != null) {
      Share.share(taskText,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }
  }

  Widget edit_time() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          // Container(
          //   width: 90,
          //   height: 28,
          //   decoration: BoxDecoration(
          //     color: custom_green,
          //     borderRadius: BorderRadius.circular(18),
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(
          //       horizontal: 12,
          //       vertical: 6,
          //     ),
          //     child: Row(
          //       children: [
          //         Image.asset('images/icon_time.png'),
          //         SizedBox(width: 10),
          //         Text(
          //           widget._note.time,
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 14,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          // SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Edit_Screen(widget._note),
              ));
            },
            child: Container(
              width: 90,
              height: 28,
              decoration: BoxDecoration(
                color: Color(0xffE2F6F1),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.edit,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget imageee() {
    return Container(
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('images/${widget._note.image}.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
