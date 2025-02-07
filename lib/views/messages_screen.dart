import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/constants/constants.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List chats = [
    MessageItem(
      name: "Sajib Rahman",
      avatar: "assets/images/chat1.png",
      time: "09:46",
      message: "Hi, John! 👋 How are you doing?",
      dotColor: Color.fromRGBO(255, 211, 54, 1),
      isDelivered: false,
    ),
    MessageItem(
      name: "Adom Shafi",
      avatar: "assets/images/chat2.png",
      time: "08:42",
      message: "Typing.....",
      dotColor: Color.fromRGBO(125, 132, 141, 1),
      isDelivered: true,
      isRead: false
    ),
    MessageItem(
      name: "HR Rumen",
      avatar: "assets/images/chat3.png",
      time: "Yesterday",
      message: "You: Cool! ☺️ Let’s meet at 18:00 near the traveling!",
      dotColor: Color.fromRGBO(25, 176, 0, 1),
      isDelivered: true,
      isRead: false
    ),
    MessageItem(
      name: "Anjelina",
      avatar: "assets/images/chat4.png",
      time: "07:56",
      message: "You: Hey, will you come to the party on Saturday?",
      dotColor: Color.fromRGBO(254, 35, 82, 1),
      isDelivered: false,
      isRead: false
    ),
    MessageItem(
      name: "Alexa Shorna",
      avatar: "assets/images/chat5.png",
      time: "05:52",
      message: "Thank you for coming! Your or...",
      dotColor: Color.fromRGBO(25, 176, 0, 1),
      isDelivered: true,
      isRead: true
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 249, 1),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 151, right: 20),
                child: Row(
                  children: [
                    Text(
                      "Messages",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: black),
                    ),
                    Spacer(),
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: SvgPicture.asset('assets/svg/menu.svg')),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0, left: 20, right: 20),
                child: Row(
                  children: [
                    Text(
                      "Messages",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: black),
                    ),
                    Spacer(),
                    SvgPicture.asset('assets/svg/message_edit.svg')
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 16,
                      ),
                      SvgPicture.asset('assets/svg/search.svg'),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: TextField(
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                            cursorHeight: 22,
                            cursorColor: Color.fromRGBO(125, 132, 141, 1),
                            decoration: InputDecoration(
                                hintText: "Search for chats & messages",
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(125, 132, 141, 1),
                                ),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 12),
                    child: Container(
                      constraints: BoxConstraints(minHeight: 60, maxHeight: 70),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                width: 67,
                                height: 67,
                                child: ClipOval(
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset(chats[index].avatar),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: chats[index].dotColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      chats[index].name,
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Spacer(),
                                    chats[index].isDelivered
                                        ?  chats[index].isRead == null || chats[index].isRead == false ?
                                          SvgPicture.asset(
                                            'assets/svg/unread.svg') :
                                          SvgPicture.asset(
                                            'assets/svg/read.svg')
                                        : SvgPicture.asset(
                                            'assets/svg/sent.svg'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      chats[index].time,
                                      style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(125, 132, 141, 1),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6),
                                Text(
                                  chats[index].message,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: chats[index].message != "Typing....." ? Color.fromRGBO(125, 132, 141, 1) : Color.fromRGBO(13, 110, 253, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: chats.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MessageItem {
  String avatar;
  String name;
  String time;
  String message;
  bool isDelivered;
  bool? isRead;
  Color dotColor;

  MessageItem({
    required this.name,
    required this.avatar,
    required this.time,
    required this.message,
    required this.isDelivered,
    required this.dotColor,
    this.isRead
  });
}
