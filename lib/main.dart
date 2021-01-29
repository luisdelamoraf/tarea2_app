import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi segunda app',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool likeIsPressed = false;
  bool dislikeIsPressed = false;
  int counter = 0;
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Info del ITESO'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/iteso.jpg"),
            //Image.network("https://pbs.twimg.com/media/DburBCaVQAAM_2g.jpg"),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              child: Row(
                children: [
                  // textos
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ITESO, Universidad Jesuita de Guadalajara",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("San Pedro Tlaquepaque"),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.thumb_up,
                      color: likeIsPressed ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {
                      //TODO: hacer lo necesario para incrementar y cambiar colores
                      likeIsPressed = !likeIsPressed;
                      counter++;
                      setState(() {});
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.thumb_down,
                      color: dislikeIsPressed ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      //TODO: hacer lo necesario para incrementar y cambiar colores
                      dislikeIsPressed = !dislikeIsPressed;
                      counter--;
                      setState(() {});
                    },
                  ),
                  Text("$counter"),
                  SizedBox(
                    width: 8,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //botones
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      IconButton(
                          icon: Icon(Icons.mail),
                          iconSize: 64,
                          onPressed: () {
                            _scaffoldKey.currentState
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                  SnackBar(content: Text("Correo a ITESO")));
                          }),
                      Text("Correo"),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.call),
                        onPressed: () {
                          _scaffoldKey.currentState
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                                SnackBar(content: Text("Llamada a ITESO")));
                        },
                        iconSize: 64,
                      ),
                      Text("Llamada"),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.directions),
                        onPressed: () {
                          _scaffoldKey.currentState
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                                SnackBar(content: Text("Ruta a ITESO")));
                        },
                        iconSize: 64,
                      ),
                      Text("Ruta"),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                  "Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas"),
            ),
            RaisedButton(
              child: Text("Revisar contador"),
              onPressed: () {
                if (counter % 2 == 0) {
                  _showParDialog();
                } else {
                  _showImparDialog();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  _showParDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Revisar contador"),
              content: new Text("El contador de likes es par"),
              actions: <Widget>[
                TextButton(
                    child: Text("CERRAR"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ],
            ));
  }

  _showImparDialog() {
    DateTime fecha = DateTime.now();
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Revisar contador"),
              content: new Text("$fecha"),
              actions: <Widget>[
                TextButton(
                    child: Text("CERRAR"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ],
            ));
  }
}
