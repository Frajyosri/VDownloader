import 'package:bf_video_downloader/componants/Facebook.dart';
import 'package:bf_video_downloader/componants/youtube.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController url = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            InkWell(
              child: Container(
                height: 100,
                width: 200,
                child: const Text("Facebbok"),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Facebook()));
              },
            ),
            Container(
              child: const Text("instagrame"),
            ),
            InkWell(
              child: Container(
                height: 100,
                width: 200,
                child: const Text("Youtube"),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Youtube()));
              },
            )
          ],
        ),
      ),
    );
  }
}
