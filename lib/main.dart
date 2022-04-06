import 'package:flutter/material.dart';
import 'package:my_application/bomb.dart';
import 'package:my_application/grid_tile.dart';
import 'package:my_application/time_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimeController(),
      child: const MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Bomb bomb = Bomb();

  Widget? gridChild;

  @override
  Widget build(BuildContext context) {
    final listenableTimeController = Provider.of<TimeController>(context);
    final nonListenableTimeController =
        Provider.of<TimeController>(context, listen: false);

    String _currentTime() {
      String time = '000';
      listenableTimeController.second.toString().length < 2
          ? time = '00${listenableTimeController.second}'
          : listenableTimeController.second.toString().length < 3
              ? time = '0${listenableTimeController.second}'
              : time = '${listenableTimeController.second}';

      return time;
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.70,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffC6C6C6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 5.0,
                            offset: -const Offset(4.0, 4.0),
                          ),
                          const BoxShadow(
                            color: Color(0xff808080),
                            blurRadius: 5.0,
                            offset: Offset(4.0, 4.0),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.5),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xffC6C6C6),
                              border: Border(
                                top: BorderSide(
                                    color: Color(0xff808080), width: 5.0),
                                left: BorderSide(
                                    color: Color(0xff808080), width: 5.0),
                                bottom:
                                    BorderSide(color: Colors.white, width: 5.0),
                                right:
                                    BorderSide(color: Colors.white, width: 5.0),
                              ),
                            ),
                            height: 100.0,
                            width: double.infinity,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    flex: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                                color: Color(0xff808080),
                                                width: 3.0),
                                            left: BorderSide(
                                                color: Color(0xff808080),
                                                width: 3.0),
                                            bottom: BorderSide(
                                                color: Colors.white,
                                                width: 3.0),
                                            right: BorderSide(
                                                color: Colors.white,
                                                width: 3.0),
                                          ),
                                          color: Colors.black,
                                        ),
                                        child: const FittedBox(
                                          child: Text(
                                            '010',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontFamily: 'DIGITALDREAM'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: TextButton(
                                        onLongPress: () {
                                          bomb.clearBombs();

                                          setState(() {
                                            gridChild = null;
                                          });
                                          nonListenableTimeController
                                              .resetTimer();
                                        },
                                        onPressed: () {
                                          bomb.generateBombs();
                                          listenableTimeController.timer();
                                        },
                                        child: Container(
                                          child: Transform.scale(
                                            scale: 0.8,
                                            child: Image.network(
                                              'https://cdn-icons-png.flaticon.com/512/742/742751.png',
                                            ),
                                          ),
                                          decoration: const BoxDecoration(
                                            color: Color(0xffC6C6C6),
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Color(0xff808080),
                                                  width: 5.0),
                                              right: BorderSide(
                                                  color: Color(0xff808080),
                                                  width: 5.0),
                                              top: BorderSide(
                                                  color: Colors.white,
                                                  width: 5.0),
                                              left: BorderSide(
                                                  color: Colors.white,
                                                  width: 5.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                                color: Color(0xff808080),
                                                width: 3.0),
                                            left: BorderSide(
                                                color: Color(0xff808080),
                                                width: 3.0),
                                            bottom: BorderSide(
                                                color: Colors.white,
                                                width: 3.0),
                                            right: BorderSide(
                                                color: Colors.white,
                                                width: 3.0),
                                          ),
                                          color: Colors.black,
                                        ),
                                        child: FittedBox(
                                          child: Text(
                                            _currentTime(),
                                            style: const TextStyle(
                                                color: Colors.red,
                                                fontFamily: 'DIGITALDREAM'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12.5,
                                right: 12.5,
                                bottom: 12.5,
                                top: 12.5),
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                      color: Color(0xff808080), width: 5.0),
                                  left: BorderSide(
                                      color: Color(0xff808080), width: 5.0),
                                  bottom: BorderSide(
                                      color: Colors.white, width: 5.0),
                                  right: BorderSide(
                                      color: Colors.white, width: 5.0),
                                ),
                              ),
                              child: GridView.builder(
                                  itemCount: 100,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 10),
                                  itemBuilder: (context, index) => Tile(
                                      child: bomb.position.contains(index)
                                          ? gridChild
                                          : null,
                                      index: index,
                                      onTap: () {
                                        if (bomb.position.contains(index)) {
                                          setState(() {
                                            gridChild = Image.network(
                                                'https://cdn-icons-png.flaticon.com/512/112/112683.png');
                                          });
                                        }
                                      })),
                              height: 100.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
