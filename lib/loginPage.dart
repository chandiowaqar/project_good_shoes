
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:good_shoes/register.dart';
import 'package:good_shoes/dashboard.dart';
import 'package:good_shoes/user_data.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  // =========================================================
  // FORM
  // =========================================================

  final _formKey = GlobalKey<FormState>();

  // =========================================================
  // CONTROLLERS
  // =========================================================

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  // =========================================================
  // VARIABLES
  // =========================================================

  bool isChecked = false;
  bool isPasswordVisible = false;

  // =========================================================
  // LOGIN FUNCTION
  // =========================================================

  void loginUser() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email == UserData.email &&
        password == UserData.password) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login successful"),
          duration: Duration(seconds: 1),
        ),
      );

      // Remove login page from navigation stack
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const dashboard(),
        ),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Incorrect email/phone or password.",
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  // =========================================================
  // BUILD
  // =========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,

          height: MediaQuery.of(context).size.height,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),

          child: Padding(
            padding: const EdgeInsets.all(20.0),

            child: Form(
              key: _formKey,

              child: ListView(
                children: [
                  Column(
                    children: [
                      Column(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(colors: [Colors.grey.shade300,Colors.grey,Colors.grey.shade300])
                ),
                child: Icon(Icons.person_2_rounded,color: Colors.white,size: 60,),
              ),
            ]
               ),

                      // =================================================
                      // TITLE
                      // =================================================

                      const Text(
                        "Sign In",

                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // =================================================
                      // EMAIL / PHONE
                      // =================================================

                      TextFormField(
                        controller: emailController,

                        style: const TextStyle(
                          fontSize: 15,
                        ),

                        decoration: InputDecoration(
                          labelText: "Email/Phone",

                          hintText:
                              "Enter your email or phone",
                               filled: true,
                fillColor: Colors.grey.shade200,

                          prefixIcon: const Icon(
                            CupertinoIcons.person,
                          ),

                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(10),
                                borderSide: BorderSide.none
                          ),
                        ),

                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty) {
                            return "Email/Phone is required";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 30),

                      // =================================================
                      // PASSWORD
                      // =================================================

                      TextFormField(
                        controller: passwordController,

                        obscureText:
                            !isPasswordVisible,

                        style: const TextStyle(
                          fontSize: 15,
                        ),

                        decoration: InputDecoration(
                          labelText: "Password",

                          hintText:
                              "Enter your password",
                               filled: true,
                fillColor: Colors.grey.shade200,

                          prefixIcon: const Icon(
                            CupertinoIcons.lock,
                          ),

                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isPasswordVisible =
                                    !isPasswordVisible;
                              });
                            },

                            icon: Icon(
                              isPasswordVisible
                                  ? CupertinoIcons
                                      .eye_slash
                                  : CupertinoIcons.eye,
                            ),
                          ),

                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(10),
                                borderSide: BorderSide.none
                          ),
                        ),

                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty) {
                            return "Password is required";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 5),

                      // =================================================
                      // REMEMBER ME + FORGOT PASSWORD
                      // =================================================

                      Row(
                        children: [

                          Checkbox(
                            value: isChecked,

                            onChanged: (bool? newValue) {
                              setState(() {
                                isChecked =
                                    newValue ?? false;
                              });
                            },
                          ),

                          const Text(
                            "Remember me.",
                          ),

                          const Spacer(),

                          TextButton(
                            onPressed: () {
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Forgot password feature coming soon.",
                                  ),
                                ),
                              );
                            },

                            child: const Text(
                              "Forgot Password?",

                              style: TextStyle(
                                color: Colors.black,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // =================================================
                      // SIGN IN BUTTON
                      // =================================================

                      Container(
                        height: 55,

                        width: double.infinity,

                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(20),

                          gradient: LinearGradient(
                            colors: [
                              Colors.grey.shade200,
                              Colors.grey,
                            ],
                          ),
                        ),

                        child: ElevatedButton(
                          onPressed: () {

                            // Validate form first
                            if (_formKey.currentState!
                                .validate()) {

                              // If valid, attempt login
                              loginUser();
                            }
                          },

                          style:
                              ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.transparent,

                            shadowColor:
                                Colors.transparent,

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                30,
                              ),
                            ),
                          ),

                          child: const Text(
                            "Sign In",

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // =================================================
                      // REGISTER
                      // =================================================

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,

                        children: [

                          const Text(
                            "Are You New?",
                          ),

                          TextButton(
                            onPressed: () {

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const register(),
                                ),
                              );
                            },

                            child: const Text(
                              "Register",

                              style: TextStyle(
                                color: Colors.black,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      // =================================================
                      // SOCIAL LOGIN TITLE
                      // =================================================

                      const Text(
                        "------------ Sign In ------------",
                      ),

                      const SizedBox(height: 20),

                      // =================================================
                      // SOCIAL BUTTONS
                      // =================================================

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,

                        children: [

                          // GOOGLE

                          FloatingActionButton(
                            heroTag: "login_google",

                            onPressed: () {},

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                30,
                              ),
                            ),

                            backgroundColor:
                                Colors.grey.shade300,

                            child: CircleAvatar(
                              backgroundColor:
                                  Colors.grey.shade300,

                              backgroundImage:
                                  const AssetImage(
                                "assets/google.png",
                              ),
                            ),
                          ),

                          const SizedBox(width: 20),

                          // FACEBOOK

                          FloatingActionButton(
                            heroTag: "login_facebook",

                            onPressed: () {},

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                30,
                              ),
                            ),

                            backgroundColor:
                                Colors.grey.shade300,

                            child: CircleAvatar(
                              backgroundColor:
                                  Colors.grey.shade300,

                              backgroundImage:
                                  const AssetImage(
                                "assets/facebook1.png",
                              ),
                            ),
                          ),

                          const SizedBox(width: 20),

                          // APPLE

                          FloatingActionButton(
                            heroTag: "login_apple",

                            onPressed: () {},

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                30,
                              ),
                            ),

                            backgroundColor:
                                Colors.grey.shade300,

                            child: CircleAvatar(
                              backgroundColor:
                                  Colors.grey.shade300,

                              backgroundImage:
                                  const AssetImage(
                                "assets/apple-logo.png",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}