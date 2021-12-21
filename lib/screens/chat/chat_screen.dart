import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:uuid/uuid.dart';
import 'package:project_android/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatScreen> {
  List<types.Message> _messages = [];
  final _user = const types.User(id: '06c33e8b-e835-4736-80f4-63f44b66666c');
  final _bot = const types.User(id: '03d63e8b-e535-4536-81f4-63f44b61466c');

  @override
  void initState() {
    super.initState();
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = _messages[index].copyWith(previewData: previewData);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        _messages[index] = updatedMessage;
      });
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );
    final autoMessage = types.TextMessage(
      author: _bot,
      createdAt: DateTime.now().millisecondsSinceEpoch + 3000,
      id: const Uuid().v4(),
      text:
          "Xin chào, chúng tôi có thể giúp gì cho bạn (Đây là tin nhắn tự động)",
    );
    _addMessage(textMessage);
    Future.delayed(const Duration(milliseconds: 5000), () {
      _addMessage(autoMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        leading: SizedBox(
          height: 90,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Image.asset("assets/images/logo_chu_s.png"),
          ),
        ),
        title: const Text(
          "ShopGear",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.close_rounded,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
        bottom: PreferredSize(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  //color: Colors.green,
                  padding: const EdgeInsets.only(left: 95.0, bottom: 2),
                  child: const Text(
                    "Online",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            //
            preferredSize: const Size.fromHeight(4.0)),
      ),
      body: SafeArea(
        bottom: false,
        child: Chat(
          messages: _messages,
          onPreviewDataFetched: _handlePreviewDataFetched,
          onSendPressed: _handleSendPressed,
          user: _user,
          theme: DefaultChatTheme(
              backgroundColor: backgroundColor,
              inputBackgroundColor: primaryColor,
              inputTextColor: Colors.white,
              primaryColor: primaryColor,
              secondaryColor: Colors.grey.shade300),
        ),
      ),
    );
  }
}
