import 'package:float_bubble/float_bubble.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
          children: [
            NotificationListener(
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('$index'),
                    );
                  }),
              onNotification: (notificationInfo) {
                setState(() {
                  if (notificationInfo is ScrollStartNotification) {
                    isShow = false;
                  }
                  if (notificationInfo is ScrollEndNotification) {
                    isShow = true;
                  }
                });
                return true;
              },
            ),
            FloatBubble(
                show: isShow,
                child: Container(
                  height: 120,
                  width: 120,
                  child: Stack(
                    children: [
                      Container(
                          width: 120,
                          height: 120,
                          child: Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.cancel,
                                    color: Colors.grey,
                                  )))),
                      Image.network(
                          'https://images.tokopedia.net/img/blog/promo/2021/04/FLOATING-ICON-TOKOPOINTS-150x150-50KB.gif?ect=4g'),
                    ],
                  ),
                )),
          ],
        ));
  }
}
