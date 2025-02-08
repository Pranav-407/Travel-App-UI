import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// Message model to represent chat messages
class Message {
  final String text;
  final DateTime timestamp;
  final MessageType type;
  final String? profileImage;
  final String sender;

  Message(
      {required this.text,
      required this.timestamp,
      required this.type,
      this.profileImage,
      required this.sender});
}

enum MessageType { sent, received, system }

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  List<Message> messages = [
    Message(
      text: 'I will be at home',
      timestamp: DateTime.now().subtract(Duration(minutes: 5)),
      type: MessageType.sent,
      sender: 'user',
    ),
    Message(
      text: 'We are arriving today at 01:45, will someone be at home?',
      timestamp: DateTime.now().subtract(Duration(minutes: 7)),
      type: MessageType.received,
      profileImage: 'assets/images/chat2.png',
      sender: 'contact2',
    ),
    Message(
      text: 'I\'m very glad you like it👍',
      timestamp: DateTime.now().subtract(Duration(minutes: 9)),
      type: MessageType.received,
      profileImage: 'assets/images/chat1.png',
      sender: 'contact1',
    ),
    Message(
      text: 'Hello!',
      timestamp: DateTime.now().subtract(Duration(minutes: 15)),
      type: MessageType.received,
      profileImage: 'assets/images/chat1.png',
      sender: 'contact1',
    ),
    Message(
      text:
          'Thank you very much for your traveling, we really like the apartments. we will stay here for another 5 days..',
      timestamp: DateTime.now().subtract(Duration(minutes: 14)),
      type: MessageType.sent,
      sender: 'user',
    ),
    Message(
      text: 'Hello!',
      timestamp: DateTime.now().subtract(Duration(minutes: 10)),
      type: MessageType.sent,
      sender: 'user',
    ),
  ];

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        messages.insert(
          0,
          Message(
            sender: 'user',
            text: _messageController.text,
            timestamp: DateTime.now(),
            type: MessageType.sent,
          ),
        );
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(247, 247, 249, 1),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back Button
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: SvgPicture.asset('assets/svg/left.svg')),
                      ),
                    ),

                    // Name and Status
                    Column(
                      children: [
                        Text(
                          "Sajib Rahman",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Active Now",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(25, 176, 0, 1),
                          ),
                        ),
                      ],
                    ),

                    // Call Button
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: SvgPicture.asset('assets/svg/call.svg')),
                    )
                  ],
                ),
              ),

              SizedBox(height: 45),

              // Today Chip
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Today",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(125, 132, 141, 1),
                    ),
                  ),
                ),
              ),

              // Messages List
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return _buildMessageItem(message, index);
                  },
                ),
              ),

              // Message Input
              _buildMessageInput(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageItem(Message message, int index) {
    bool isSent = message.type == MessageType.sent;

    bool showAvatar = false;
    if (!isSent) {
      for (int i = index; i >= 0; i--) {
        if (messages[i].sender == message.sender) {
          showAvatar = (i == index);
          break;
        }
      }
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Row(
        mainAxisAlignment:
            isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isSent)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: showAvatar
                  ? CircleAvatar(
                      backgroundImage: AssetImage(message.profileImage!),
                      radius: 20,
                    )
                  : SizedBox(width: 40), // Placeholder space
            ),
          // Message Container
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: Column(
              crossAxisAlignment:
                  isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(
                    top: showAvatar
                        ? 4
                        : 2, // Less margin for consecutive messages
                  ),
                  decoration: BoxDecoration(
                    color: isSent
                        ? Color.fromRGBO(229, 244, 255, 1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(
                          message.text,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '${message.timestamp.hour.toString().padLeft(2, '0')}:${message.timestamp.minute.toString().padLeft(2, '0')}',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(125, 132, 141, 1),
                        ),
                      ),
                      if (isSent) ...[
                        SizedBox(width: 5),
                        Icon(
                          Icons.done_all,
                          color: Color.fromRGBO(25, 176, 0, 1),
                          size: 16,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                controller: _messageController,
                decoration: InputDecoration(
                  hintText: 'Type you message',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(125, 132, 141, 1),
                  ),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  suffixIcon: Icon(
                    Icons.attach_file,
                    color: Color.fromRGBO(125, 132, 141, 1),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              color: Color.fromRGBO(25, 176, 0, 1),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon:
                  Icon(Icons.send, color: Colors.white), // Changed to send icon
              onPressed: _sendMessage, // Added _sendMessage method
            ),
          )
        ],
      ),
    );
  }
}
