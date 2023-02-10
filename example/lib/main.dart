import 'package:flutter/material.dart';
import 'package:mixins/mixins.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import 'theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TutorialCoachMark Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey();
    CoachWrapperController controller = CoachWrapperController();

    return CoachWrapper(
      controller: controller,
      targets: [
        CoachTarget(
            key: key,
            title: 'Pilih Bulan & Tahun',
            message: 'Gunakan icon kalender di pojok kanan atas ini untuk memilih bulan dan tahun yang akan ditampilkan.')
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tutorial Coach Mark Demo'),
          actions: [
            IconButton(
              key: key,
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
            child: InkW(
          color: Colors.black12,
          onTap: () {
            controller.open();
          },
          padding: Ei.all(20),
          child: const Text('Open Tutorial'),
        )),
      ),
    );
  }
}

class CoachWrapperController {
  VoidCallback open = () {};
}

class CoachTarget {
  final GlobalKey key;
  final String title;
  final String message;

  CoachTarget({required this.key, required this.title, required this.message});
}

class CoachWrapper extends StatefulWidget {
  final Function(bool mounted)? onInit;
  final Widget? child;
  final List<CoachTarget> targets;
  final CoachWrapperController? controller;

  const CoachWrapper({Key? key, this.onInit, this.child, this.targets = const [], this.controller}) : super(key: key);

  @override
  State<CoachWrapper> createState() => _CoachWrapperState();
}

class _CoachWrapperState extends State<CoachWrapper> {
  bool isCoach = false;

  @override
  void initState() {
    widget.onInit?.call(mounted);
    super.initState();
  }

  void runCoach() {
    if (widget.targets.isEmpty) return;
    isCoach = true;

    List<CoachTarget> targets = widget.targets;

    TutorialCoachMark(
      targets: List.generate(
          targets.length,
          (i) => TargetFocus(
                keyTarget: targets[i].key,
                radius: 250,
                contents: [
                  TargetContent(
                    builder: (context, controller) {
                      return Column(
                        crossAxisAlignment: Caa.start,
                        children: [
                          Container(
                            padding: Ei.all(20),
                            constraints: BoxConstraints(maxWidth: context.width * .6),
                            decoration: BoxDecoration(border: Br.all(Colors.white), borderRadius: Br.radius(5)),
                            child: Col(
                              children: [
                                Iconr(
                                  Icons.sunny,
                                  color: Colors.white,
                                  margin: Ei.only(b: 35),
                                ),
                                Text(
                                  targets[i].title,
                                  style: Gfont.bold.white,
                                ),
                                Textr(
                                  targets[i].message,
                                  margin: Ei.only(t: 10),
                                  style: Gfont.white.fopacity(.8),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              )),
      opacityShadow: 0.9,
      hideSkip: true,
      onFinish: () {
        isCoach = false;
      },
    ).show(context: context);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller != null) {
      widget.controller?.open = runCoach;
    }

    return WillPopScope(
        child: widget.child ?? Container(),
        onWillPop: () async {
          return !isCoach;
        });
  }
}
