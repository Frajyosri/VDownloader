import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:facebook_video_download/facebook_video_download.dart';

class Facebook extends StatefulWidget {
  const Facebook({super.key});

  @override
  State<Facebook> createState() => _FacebookState();
}

class _FacebookState extends State<Facebook> {
  TextEditingController url = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 32, vertical: 12),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "assets/images/3D_Square_with_Facebook_Logo.jpg",
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
          ),
          const Text(
            "Download any Facebook  video ",
            style: TextStyle(color: Colors.redAccent, fontSize: 29),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            controller: url,
            maxLength: 1000,
            decoration: const InputDecoration(
              hintText: "Paste your video link ",
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey)),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  await downloadVideo(url.text.trim());
                  setState(() {
                    url.text = "";
                  });
                } catch (e) {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Oops...',
                    text: 'Sorry, something went wrong',
                  );
                }
              },
              child: const Text('Download File '))
        ]),
      ),
    );
  }
}

Future<void> downloadVideo(String url) async {
  try {
    FacebookPost data = await FacebookData.postFromUrl(url);
    debugPrint(data.postUrl);
    debugPrint(data.videoHdUrl);
    debugPrint(data.videoMp3Url);
    debugPrint(data.videoSdUrl);
    debugPrint(data.commentsCount as String?);
    debugPrint(data.sharesCount as String?);
  } catch (error) {
    debugPrint('Error downloading video: $error');
  }
}
