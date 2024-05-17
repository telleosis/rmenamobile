import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget videoResources() {
  Widget createCard() {
    return SizedBox(
      width: 345,
      height: 236,
      child: Card(
        color: const Color(0xFFFFFFFF),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 345,
                height: 180,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage('asset/images/res_thumbnail_2.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const ListTile(
                title: Text(
                  'This Symbolism of ‘Saltburn That you probably missed',
                  style: TextStyle(
                    color: Color(0xFF212B36),
                    fontSize: 16,
                    fontFamily: 'Helvetica Neue',
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                  ),
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
      crossAxisCount: 1,
      childAspectRatio: (345 / 236),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
    ),
    itemCount: 3,
    itemBuilder: (context, index) {
      return createCard();
    },
  );
}
