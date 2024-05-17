import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget audioResources() {
  Widget createCard() {
    return SizedBox(
      width: 164,
      height: 244,
      child: Card(
        color: const Color(0xFFFFFFFF),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 164,
                height: 170,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage('asset/images/res_thumbnail_1.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const ListTile(
                title: Text(
                  'Learning to Lead Yourself',
                  style: TextStyle(
                    color: Color(0xFF212B36),
                    fontSize: 14,
                    fontFamily: 'Helvetica Neue',
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                  ),
                ),
                subtitle: Text(
                  '3 mins read ・ Pastor Matt',
                  style: TextStyle(
                    color: Color(0xFF637381),
                    fontSize: 12,
                    fontFamily: 'Helvetica Neue',
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                  ),
                ),
                trailing: Icon(
                  CupertinoIcons.play_circle_fill,
                  color: Color(0xFFBE0027),
                  size: 40,
                ),
                //TODO: onTap: () => gotoResource(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (164 / 280),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
    ),
    itemCount: 6,
    itemBuilder: (context, index) {
      return createCard();
    },
  );
}
