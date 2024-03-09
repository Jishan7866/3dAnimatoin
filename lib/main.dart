import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  O3DController o3dController=O3DController();
  PageController mainPageController = PageController();
  PageController textPageController = PageController();
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          O3D(src: 'assets/disney_style_character.glb',
          controller: o3dController,
            ar: false,
            autoPlay: true,
            autoRotate: false,
          ),
          PageView(
            controller: mainPageController,
            children: const [
              Center(),
              Center(),
              Center()
            ],
          ),
          Container(
            width: 100,
            height: double.infinity,
            color: Colors.blue,
            margin: EdgeInsets.all(12),
            child: PageView(
              controller: textPageController,
              physics: const NeverScrollableScrollPhysics(),
              children:  [
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text('Daily goals'),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text('87'),
                            ),
                          ),
                          Transform.translate(
                              offset: Offset (0,20),
                              child: Text("%"))
                        ],
                      )
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text('Daily goals'),
                      ),
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text('87'),
                              ),
                            ),
                            Transform.translate(
                                offset: Offset (0,20),
                                child: Text("%"))
                          ],
                        )
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text('Daily goals'),
                      ),
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text('87'),
                              ),
                            ),
                            Transform.translate(
                                offset: Offset (0,20),
                                child: Text("%"))
                          ],
                        )
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
        onTap: (page){
          mainPageController.animateToPage(page, duration: const Duration(milliseconds: 500), curve: Curves.ease);
          textPageController.animateToPage(page, duration: const Duration(milliseconds: 500), curve: Curves.ease);
          setState(() {
            this.page=page;
          });
        },
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.analytics_outlined),
        label: "Home"
        ),
        BottomNavigationBarItem(icon: Icon(Icons.timer_outlined),
            label: "Home"
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person_outlined),
            label: "Home"
        )
      ],),
    );
  }
}
