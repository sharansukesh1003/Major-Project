import 'package:flutter/material.dart';

class NewsTile extends StatefulWidget {
  final String imageUrl, title, desc;

  NewsTile({required this.imageUrl,required this.title,required this.desc});

  @override
  _NewsTileState createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(widget.imageUrl),
            ),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          widget.title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          widget.desc,
          style: const TextStyle(color: Colors.white70),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 5.0,
              width: 100.0,
              decoration: BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}