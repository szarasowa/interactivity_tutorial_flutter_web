import 'package:flutter_web/material.dart';
import 'package:flutter_web/foundation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
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
    return MaterialApp(
      title: 'Flutter for Web - App with interactivity demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter for Web'),),
        body: ListView(
          children: [
            Container (
              color: Colors.pinkAccent,
              child: 
                Image.asset(
                  'images/lake.jpg',
                  width: 600,
                  height: 240,
                  fit: BoxFit.cover,
                ),
            ),
            TitleSection(),
            ButtonSection(),
            textSection,
            // interactivity boxes
            TapboxA(),
          ]
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /* 
            Putting a Column inside an Expanded widget stretches the column
            to use all remaining free space in the row. Setting the crossAxisAlignment
            to CrossAxisAlignment.start positions the column at start of the row.
            */
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*
                Putting the first row of text inside a Container enables you to add padding.
                The second child in the Column, also text, displays as grey.
                */
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                ),
                Text(
                  'Kanderstag, Switzelrand',
                  style: TextStyle(color: Colors.grey[500])
                )
              ]
            ),
          ),
          /*
          The last two items in the title row are a star icon, painted red, and the text '41'.
          The entire row is in a Container and padded along each edge by 32 pixels.
          */
          // FavoriteWidget()
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  Color color = Theme.of(context).primaryColor;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTEr'),
          _buildButtonColumn(color, Icons.share, 'SHARE')
        ]
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
              fontSize: 12, fontWeight: FontWeight.w400, color: color,
            )
          )
        )
      ],
    );
  }
} 

// Interacitivy Widgets
class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);
  @override _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
bool _active = false;
void _handTap() {
  setState(() {
    _active = !_active;
  });
}

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inctive',
            style: TextStyle(fontSize: 32.0, color: Colors.pinkAccent)
          )
        ),
        height: 200.0,
        width: 200.0,
        margin: const EdgeInsets.all(64.0),
        decoration: BoxDecoration(
          color: _active ? Colors.lightBlue : Colors.grey,
        ),
      ),
    );
  }
}