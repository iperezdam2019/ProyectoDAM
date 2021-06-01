import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/db_model.dart';
import 'package:shop_app/models/db_products.dart';
import 'package:shop_app/screens/carrito_screen.dart';
import 'package:shop_app/screens/screen_menu/lateral_menu.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DbModel.getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Products().save(snapshot.data);
            return HomeWidget();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SECOND SKIN"),
        actions: <Widget>[
          GestureDetector(
            child: IconButton(
                icon: new Icon(Icons.shopping_bag_outlined),
                onPressed: () {
                  print('[DEBUG]... Pulsando en CESTA');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CarritoScreen()),
                  );
                }),
          ),
        ],
      ),
      drawer: MenuLateral(),
      body: Column(children: [
        CarouselSlider(
          items: [
            // 1 imagen slider home
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/secondskin-5d3ce.appspot.com/o/home%2F1_slider_home.png?alt=media&token=d94ce359-53cf-4a98-8d37-91829839af78"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //2 imagen slider home
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/secondskin-5d3ce.appspot.com/o/home%2F2_slider_home.png?alt=media&token=6f5ea210-2897-428c-9344-b2a25f02c8d7"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //3 imagen slider home
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/secondskin-5d3ce.appspot.com/o/home%2F3_slider_home.png?alt=media&token=a50505f3-ff1e-4d5d-ad77-f5ad28c43c06"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //4 imagen slider home
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/secondskin-5d3ce.appspot.com/o/home%2F4_slider_home.PNG?alt=media&token=4ff7f773-d173-40da-90a7-d28e365faa34"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //5 imagen slider home
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/secondskin-5d3ce.appspot.com/o/home%2F5_slider_home.PNG?alt=media&token=61e61825-af7b-416b-ac7e-bfaa26f557d7"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],

          //Propiedades del Carousel Home
          options: CarouselOptions(
            height: 380.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),

        // Texto Titulo Centro
        Padding(
          padding: EdgeInsets.all(4),
          child: Center(
            child: Text(
              "PASIÓN POR EL CICLISMO\n",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        //Texto
        Container(
          height: 170,
          width: 275,
          child: Text(
              "Líneas limpias, y colores vibrantes para inspirar prendas muy especiales con fuerza y una personalidad única. Apostamos por el desarrollo sostenido y sostenible, siempre con los materiales más ajustados a cada objetivo y minuciosamente tratados por las expertas manos que confeccionan todas nuestras equipaciones. No queremos que nadie nos lo cuente. Queremos sentir el sonido de tu esfuerzo."),
        ),
        Spacer(),
        // Pie de página
        Divider(color: Colors.blueGrey),
        Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  child: Image(
                      image: AssetImage("assets/icons/facebook.png"),
                      width: 30),
                  onTap: () async {
                    if (await canLaunch("https://www.facebook.com/")) {
                      await launch("https://www.facebook.com/");
                    }
                    print("Pulsando Facebook");
                  }),
              InkWell(
                  child: Image(
                      image: AssetImage("assets/icons/instagram.png"),
                      width: 30),
                  onTap: () async {
                    if (await canLaunch("https://www.instagram.com/")) {
                      await launch("https://www.instagram.com/");
                    }
                    print("Pulsando Instagram");
                  }),
              InkWell(
                  child: Image(
                      image: AssetImage("assets/icons/twitter.png"), width: 30),
                  onTap: () async {
                    if (await canLaunch("https://www.twitter.com/")) {
                      await launch("https://www.twitter.com/");
                    }
                    print("Pulsando Twitter");
                  }),
            ],
          ),
        ),
      ]),
    );
  }
}
