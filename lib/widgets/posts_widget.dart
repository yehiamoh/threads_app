import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
 final String name;
 final String content;
 final String image;
  const PostWidget({super.key, required this.name,required this.content,required this.image});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          CircleAvatar(
            backgroundImage: NetworkImage(image),
            radius: 16,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(name,style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),),
          SizedBox(
            width: 50,
          ),
        ],),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 120,child: Text(content,overflow: TextOverflow.ellipsis,style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),)),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.favorite_outline_rounded),
            SizedBox(width: 8,),
            Icon(Icons.comment),SizedBox(width: 8,),
            Icon(Icons.repeat_rounded),SizedBox(width: 8,),
            Icon(Icons.send),SizedBox(width: 8,),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('226 replies .  1312 likes',
            style: TextStyle(
              color: Color(0xff9A9A9A),
              fontWeight: FontWeight.w200,
              fontSize: 11,
            )
              ,)
          ],
        ),
      ],
    );
  }
}
