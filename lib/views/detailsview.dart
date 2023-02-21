import 'package:flutter/material.dart';

import 'package:planets/model/datas.dart';
import 'package:planets/views/constants.dart';

class DetailsView extends StatefulWidget {
  final PlanetInfo? planetInfo;
  const DetailsView({super.key, this.planetInfo});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 32),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 300,
                  ),
                  Text(
                    widget.planetInfo!.name.toString(),
                    style: TextStyle(
                        fontSize: 55,
                        fontFamily: 'Avenir',
                        color: primaryTextColor,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Solar System",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Avenir',
                        color: primaryTextColor,
                        fontWeight: FontWeight.w300),
                    textAlign: TextAlign.left,
                  ),
                  const Divider(
                    color: Colors.black38,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 140,
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Text(
                        widget.planetInfo!.description.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: 'Avenir',
                            color: contentTextColor,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                        maxLines: 60,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(
                    color: Colors.black38,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(
                        fontSize: 24,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: 'Avenir',
                        color: contentTextColor,
                        fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                    maxLines: 40,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 250,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.planetInfo!.images!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                widget.planetInfo!.images![index],
                                fit: BoxFit.cover,
                              )),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              right: -70,
              child: Hero(
                  tag: widget.planetInfo!.position,
                  child: Image.asset(widget.planetInfo!.iconImage.toString()))),
          Positioned(
              top: 60,
              left: 32,
              child: Text(
                widget.planetInfo!.position.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 247,
                    color: Colors.grey.withOpacity(0.2)),
              )),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new))
        ],
      )),
    );
  }
}
