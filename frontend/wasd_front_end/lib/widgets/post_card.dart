import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  final String profileImageUrl;
  final String imageUrl;
  final int likes;
  final int comments;
  final String user;
  final String title;
  PostCard(
    {required this.imageUrl, 
    required this.likes, 
    required this.profileImageUrl, 
    required this.comments, 
    required this.user,
    required this.title
    });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: ClipOval(
                child: Image(
                fit: BoxFit.cover,
                image: AssetImage(widget.profileImageUrl)
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Text(
                  widget.user,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          child: Image(
              fit: BoxFit.cover,
              image: AssetImage(widget.imageUrl),
            ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
               icon: const Icon(
                 Icons.trending_up,
                 size: 30,
                 color: Colors.yellow,
               )
            ),
            Text(
              widget.likes.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            IconButton(
              onPressed: () {},
               icon: const Icon(
                 Icons.messenger_outline,
                 size: 25,
                 color: Colors.white,
               )
            ),
            Text(
              widget.comments.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}