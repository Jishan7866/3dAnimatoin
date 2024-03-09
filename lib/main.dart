import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

import 'inverted_circle_clipper.dart';

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
      backgroundColor: Colors.blue.shade50,
      body: Stack(
        children: [
          O3D(src: 'assets/disney_style_character.glb',
          controller: o3dController,
            ar: false,
            autoPlay: true,
            autoRotate: false,
            cameraControls: false,
            cameraTarget: CameraTarget(-0.25,1.5,1.5),
            cameraOrbit: CameraOrbit(0,90,1),
          ),
          PageView(
            controller: mainPageController,
            children:  [
              const Center(),
              const Center(),
              ClipPath(
                clipper: InvertedCircleClipper() ,
                child: Container(
                  color: Colors.white,
                ),
              )
            ],
          ),
          Container(
            width: 100,
            height: double.infinity,
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
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.local_fire_department_outlined,color: Colors.red,),
                        ),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("18,40"),
                            Text("calories",
                          style: TextStyle(fontSize: 12,color: Colors.grey),
                            )
                          ]
                        ))
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.do_not_step,color: Colors.purple,),
                        ),
                        Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("34,80"),
                              Text("steps",
                                style: TextStyle(fontSize: 12,color: Colors.grey),
                              )
                            ]
                        ))
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.hourglass_bottom,color: Colors.lightBlueAccent,),
                        ),
                        Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("6.5"),
                              Text("hours",
                                style: TextStyle(fontSize: 12,color: Colors.grey),
                              )
                            ]
                        ))
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text('Journal'),
                      ),
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Transform.translate(
                              offset: Offset (0,20),
                              child: Text("<")),
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text('87'),
                              ),
                            ),

                          ],
                        )
                    ),
                    Text("July 2024",
                      style: TextStyle(fontSize: 12,color: Colors.grey),
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text('Profile'),
                      ),
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text('Dazy'),
                        ),

                    ),
                    Text("24 year old",
                      style: TextStyle(fontSize: 12,color: Colors.grey),
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
          if (page==0){
            o3dController.cameraTarget(-0.25,1.5,1.5);
            o3dController.cameraOrbit(0,90,1);
          }
          else if (page ==1){
            o3dController.cameraTarget(0,1.8,0);
            o3dController.cameraOrbit(-90,90,1.5);
          }
          else if (page==2){
            o3dController.cameraTarget(0,3,0);
            o3dController.cameraOrbit(0,90,-3);
          }
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
