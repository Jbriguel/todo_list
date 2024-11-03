import 'package:flutter/material.dart';
import 'package:todo_list/views/authentification/login_view/login_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const SizedBox(height: 60.0),
                    const Text(
                      "S'inscrire",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Creer un compte pour commencer",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Nom d'utilisateur",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: Colors.deepPurple.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.person)),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: Colors.deepPurple.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.email)),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Mot de passe",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: Colors.deepPurple.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.password),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Confirmer Mot de passe",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: Colors.deepPurple.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.password),
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.deepPurple,
                    ),
                    child: const Text(
                      "S'enregistrer",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("J'ai un déjà un compte ! "),
                    TextButton(
                        onPressed: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const LoginView(),
                            ),
                          );
                        },
                        child: const Text(
                          "Se Connecter",
                          style: TextStyle(color: Colors.deepPurple),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
