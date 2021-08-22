import 'package:flutter/material.dart';
import 'package:untitled/chat/chat2/chat_screen.dart';
import 'conversion.dart';
import 'message_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tabs/inbox.dart';
class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList>
    with SingleTickerProviderStateMixin {
  List<Conversion> _conversion = MessageProvide.geConversion();
  TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          CustomPaint(
            painter: ChartBackground(),
            size: Size(double.infinity, double.infinity),
          ),
          Scaffold(
            appBar: AppBar(
              title: Text(
                "MESSAGE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  size: 44,
                ),
                onPressed: () {},
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              bottom: TabBar(

                  controller: _tabcontroller,
                  unselectedLabelColor: Color(0xfff76aa4),
                  indicatorWeight: 0.1  ,
                  indicatorColor: Colors.transparent,
                  tabs: [
                    Tab(
                      text: "Inbox",
                    ),
                    Tab(
                      text: "Groups",
                    ),
                    Tab(
                      text: "Online(25)",
                    ),
                    Tab(
                      text: "History",
                    )
                  ]),
            ),
            backgroundColor: Colors.transparent,
            body: TabBarView(
              controller: _tabcontroller,
              children: [
                ConversaionList() ,
                Container(),
                Container(),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChartBackground extends CustomPainter {
  @override
  paint(Canvas canvas, Size size) {
     Gradient gradient = LinearGradient(colors: [
      Color(0xffef1385),
      Color(0xfff12180),
      Color(0xfff63d76),
      Color(0xFFf84f70),
    ], stops: [
      0.2,
      0.4,
      0.6,
      0.8
    ]);
    Rect rec = Rect.fromLTWH(0, 0, size.width, size.height * 0.65);
    Paint paint = Paint();
    paint.shader = gradient.createShader(rec);

    paint.color = Colors.red;
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.3);
    path.quadraticBezierTo(
        size.width / 2, size.height * .75, 0, size.height * 0.3);
    path.lineTo(0, size.height * 0.3);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
