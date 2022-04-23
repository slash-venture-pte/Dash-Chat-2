import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:examples/data.dart';
import 'package:flutter/material.dart';

class ChannelScreen extends StatefulWidget {
  @override
  _ChannelScreenState createState() => _ChannelScreenState();
}

class _ChannelScreenState extends State<ChannelScreen> {
  List<ChatMessage> messages = basicSample;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('1-0n-1 & Group Chat'),
      ),
      body: DashChat(
        currentUser: user,
        onSend: (ChatMessage m) {
          setState(() {
            messages.insert(0, m);
          });

          _scrollController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOut,
          );
        },
        messages: messages,
        messageListOptions: MessageListOptions(
          onLoadEarlier: () async {
            await Future.delayed(const Duration(seconds: 3));
          },
          scrollController: _scrollController,
        ),
        scrollToBottomOptions: const ScrollToBottomOptions(disabled: true),
        inputOptions: InputOptions(
          alwaysShowSend: true,
          showTraillingBeforeSend: false,
          inputToolbarMargin: const EdgeInsets.all(0),
          inputToolbarPadding: const EdgeInsets.all(0),
          onMention: (String name) {
            print("Mention to $name");

            return user2;
          },
          // textInputAction: TextInputAction.done,
          leading: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.photo_camera,
              ),
            ),
          ],
          // trailing: [
          //   IconButton(
          //     onPressed: () {},
          //     icon: Icon(Icons.attach_file),
          //   ),
          //   IconButton(
          //     onPressed: () {},
          //     icon: Icon(Icons.mic),
          //   ),
          // ],
          inputToolbarStyle: BoxDecoration(color: Colors.white),
          // inputDecoration: const InputDecoration(
          //   border: InputBorder.none,
          //   contentPadding: EdgeInsets.all(
          //     16,
          //   ),
          // ),
        ),
      ),
    );
  }
}
