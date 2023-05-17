import 'dart:async';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'chat_message.dart';
import 'threedots.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];

  StreamSubscription? _subscription;
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  // Link for api - https://beta.openai.com/account/api-keys

  void _sendMessage() {
    if (_controller.text.isEmpty) return;
    ChatMessage message = ChatMessage(
      text: _controller.text,
      sender: "user",
    );

    setState(() {
      _messages.insert(0, message);
      _isTyping = true;
    });

    _controller.clear();
  }

  Widget _buildTextComposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: (value) => _sendMessage(),
            decoration:
                const InputDecoration.collapsed(hintText: "Enter message here"),
          ),
        ),
        ButtonBar(
          children: [
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                _sendMessage();
              },
            ),
          ],
        ),
      ],
    ).px16();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "ChatGPT APP",
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                reverse: true,
                padding: Vx.m8,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _messages[index];
                },
              )),
              if (_isTyping) const ThreeDots(),
              const Divider(
                height: 1.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: context.cardColor,
                ),
                child: _buildTextComposer(),
              )
            ],
          ),
        ));
  }
}
