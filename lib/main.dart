import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    Color bgColor = Colors.white;
    Color bgColor2 = Colors.black;


   Widget whiteBox = Container(
      color: bgColor.withOpacity(0.5),
      margin:const EdgeInsets.only(top:32, right:32, left : 200),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color = Colors.blue, Icons.call, 'CALL'),
          _buildButtonColumn(color = Colors.green, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color = Colors.black, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget titleSection = Container(
        decoration: BoxDecoration(
          color: bgColor2.withOpacity(0.8),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0)
          ),
        ),
      height: 80,
      margin: const EdgeInsets.only(right:32, left: 32,top:160,bottom: 0.00),
      padding: const EdgeInsets.only(top:15, bottom:15,left:30,right:30),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,color:Colors.white,
                     ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text(
            '41',
          style: TextStyle(
            color: Colors.white,
          ),
          ),
        ],
      ),
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

   /* Widget mainSection = Stack(
        children: [
          _buildMainLayout(circleWithNumber, titleSection, whiteBox),
          _buildMainLayout(circleWithNumber, titleSection, whiteBox),
          _buildMainLayout(circleWithNumber, titleSection, whiteBox),
        ]
    );*/

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.only(left:8.0,right:8.0),
          itemCount: 8,
          itemBuilder: (context, index)
          {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                _buildMainLayout(titleSection, whiteBox, bgColor2, index)
            );
          },
       ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Stack _buildMainLayout(Widget titleSection, Widget whiteBox, Color bgColor, int index){
    return Stack(
        children: [
          Image.asset(
            'images/lake.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          _buildCircleWithNumber(bgColor: bgColor, index: index),
          titleSection,
          whiteBox,
        ]
    );
  }

  Container _buildCircleWithNumber({
    Color bgColor = Colors.black,
    int index = 0
  }){
    var i = index.toString();
    String text = '#$i.';
    return Container(
      decoration: BoxDecoration(
        color:bgColor.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
      width:62,
      height:62,
      alignment: Alignment.center,
      margin:const EdgeInsets.only(top:32,left:32),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,color:Colors.white,
        ),
      ),
    );
  }
}