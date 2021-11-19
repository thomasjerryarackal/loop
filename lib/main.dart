import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Home(),

  ));
}
//start
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late VideoPlayerController _controller;

//video start
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _controller = VideoPlayerController.asset("videos/k.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {
          _controller.play();

        });
      });
  }
  @override
  void dispose() {
    super.dispose();
      _controller.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                child: SizedBox(
                  child: VideoPlayer(_controller,  ),
                ),
              ),
              Name(),
            ],
          ),
        ),

      ),
    );

  }
}

class Name extends StatelessWidget {
  const Name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("YoU ArE iN tHe LooP.....",
        style: TextStyle(
          color: Colors.red,
          fontSize: 20
        ),
        )
      ],
    );
  }
}



