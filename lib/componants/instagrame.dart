import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:flutter_reels_downloader/flutter_reels_downloader.dart';

class Instagrame extends StatefulWidget {
  const Instagrame({super.key});

  @override
  State<Instagrame> createState() => _InstagrameState();
}

class _InstagrameState extends State<Instagrame> {
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
            "assets/images/26642.jpg",
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
          ),
          const Text(
            "Download any Instagrame video  ",
            style: TextStyle(color: Colors.redAccent, fontSize: 29),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            controller: url,
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
                  var isMarch = await downloadVideo(url.text.trim());
                  if (isMarch == null) {
                    // ignore: use_build_context_synchronously
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.error,
                      title: 'Oops...',
                      text: 'Sorry, something went wrong',
                    );
                  } else {
                    // ignore: use_build_context_synchronously
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text: 'Downloading Completed Successfully!',
                    );
                  }
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

Future<bool?> downloadVideo(String url) async {
  ReelDownloader reelDownloader = ReelDownloader();
  try {
    await reelDownloader.downloadReels(url);
  } catch (error) {
    debugPrint('Error downloading video: $error');
    return false;
  }
}
