import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  /*
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCgA7CanlZzsRHvO2z3ccJsk85o5nHmt_o",
      appId: "1:606361293156:android:1c116f5500265ea00e6a71",
      messagingSenderId: "606361293156",
      projectId: "fir-8cd9d",
    ),
  );*/
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _setData();
    _auth();
  }

  _auth() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String email = "aurimrv4@gmail.com";
    String password = "123456";
    await auth.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((onValue){
      print("Sucesso ao criar usuário: " + onValue.user!.email.toString());
    }).catchError((onError){
      print("Falha ao criar usuário: " + onError.toString());
    });

    User? currentUser = await auth.currentUser;
    if ( currentUser != null ){
      print("Usuário logado: ${currentUser.email}");
    } else {
      print("Não há usuário logado");
    }
  }

  Future<void> _setData() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Set data in the Firestore document
      await firestore.collection("usuarios")
          .doc("pontuacao")
          .set({"Auri": "300", "Maria": "500"});
    } catch (e) {
      print('Error setting data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Example'),
      ),
      body: const Center(
        child: Text('Firestore data has been set!'),
      ),
    );
  }
}
