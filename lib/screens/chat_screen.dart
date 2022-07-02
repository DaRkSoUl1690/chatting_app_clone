import 'package:chatting_app_clone/widgets/chats/messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

 void initState() {
    super.initState();
    // final fbm = FirebaseMessaging();
    // fbm.requestNotificationPermissions();
    // fbm.configure(onMessage: (msg) {
    //   print(msg);
    //   return;
    // }, onLaunch: (msg) {
    //   print(msg);
    //   return;
    // }, onResume: (msg) {
    //   print(msg);
    //   return;
    // });
    // fbm.subscribeToTopic('chat');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterChat'),
        actions: [
          DropdownButton(
            underline: Container(),
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
            ),
            items: [
              DropdownMenuItem(
                value: 'logout',
                child:  Row(
                    children:  <Widget>[
                       Icon(Icons.exit_to_app,
                        color: Theme.of(context).primaryColor),
                       const SizedBox(width: 5),
                       const Text('Logout'),
                    ],
                  ),
              ),
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: const <Widget>[
            Expanded(
              child: Messages(),
            ),
            // NewMessage(),
          ],
        ),
      ),
    );
  }
}
