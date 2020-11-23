import 'package:flutter/material.dart';

class ProvinceCard extends StatelessWidget {
  final String label;
  final String provinceName;
  final int noOfTours;

  final String imgUrl;
  ProvinceCard(
      {@required this.provinceName,
      @required this.label,
      @required this.noOfTours,
      @required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image(
                image: AssetImage(imgUrl),
                height: 220,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 200,
              width: 150,
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                provinceName,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Tours",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                          margin: EdgeInsets.only(bottom: 10, right: 8),
                          padding:
                              EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white38),
                          child: Column(
                            children: [
                              Text(
                                "C.R",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 20,
                              )
                            ],
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
