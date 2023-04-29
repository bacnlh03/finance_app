import 'package:flutter/material.dart';

class InfoCardWidget extends StatelessWidget {
  const InfoCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const Positioned(
          top: 10,
          left: 10,
          child: Row(
            children: <Widget>[
              CircleAvatar(radius: 28),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Name',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Bio',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: 10,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
            ),
          ),
        ),
        const Positioned(
          bottom: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Total Balance',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '9,999,999 VND',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
