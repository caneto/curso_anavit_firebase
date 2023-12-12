import 'package:flutter/material.dart';

class ExemploBox extends StatelessWidget {
  const ExemploBox({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Demonstração do BoxShedow',
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            tooltip: 'Menu',
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.comment,
                color: Colors.white,
              ),
              tooltip: 'Comment',
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: 200,
              width: 250,
              child: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://capsistema.com.br/wp-content/uploads/2023/12/cropped-LogoCapSistema.jpg'), //NetworkImage
                    scale: 3.0,
                  ), //DecprationImage
                  border: Border.all(
                    color: Colors.blueAccent,
                    width: 4.0,
                    style: BorderStyle.solid,
                  ), //Border.all

                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent[200]!,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    //const BoxShadow(
                    //  color: Colors.white,
                    //  offset: Offset(0.0, 0.0),
                    //  blurRadius: 0.0,
                    //  spreadRadius: 0.0,
                    //), //BoxShadow
                  ],
                ), //BoxDecoration
              ), //Container
            ), //SizedBox
          ), //Padding
        ), //Center
      ),
    ); //Scaffol
  }
}
