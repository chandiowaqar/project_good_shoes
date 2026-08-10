
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'package:good_shoes/user_data.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController firstNameController =
      TextEditingController();

  final TextEditingController lastNameController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // =========================================================
  // REQUIRED FIELD VALIDATION
  // =========================================================

  String? requiredValidator(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required";
    }

    return null;
  }

  // =========================================================
  // REGISTER
  // =========================================================

  void registerUser() {
    if (_formKey.currentState!.validate()) {
      // Registration successful

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Registration successful"),
        ),
      );

      // Go to login page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const login(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Form(
          key: _formKey,

          child: Padding(
            padding: const EdgeInsets.all(20.0),

            child: ListView(
              children: [
                // =================================================
                // TITLE
                // =================================================
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
                const Center(
                  child: Text(
                    "Registration",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // =================================================
                // PHONE / EMAIL
                // =================================================

                SizedBox(
                  height: 44,

                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(20),
                            color: Colors.grey.shade300,
                          ),

                          child: ElevatedButton(
                            onPressed: () {},

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
                              "Phone",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(20),
                            color: Colors.grey,
                          ),

                          child: ElevatedButton(
                            onPressed: () {},

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
                              "Email",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // =================================================
                // EMAIL
                // =================================================

                TextFormField(
                  controller: emailController,

                  style: const TextStyle(
                    fontSize: 16,
                  ),

                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter your email",
                     filled: true,
                fillColor: Colors.grey.shade200,

                    prefixIcon: const Icon(
                      CupertinoIcons.person,
                      size: 18,
                    ),

                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10),
                          borderSide: BorderSide.none
                    ),
                  ),

                  validator: (value) {
                    return requiredValidator(
                      value,
                      "Email",
                    );
                  },
                ),

                const SizedBox(height: 25),

                // =================================================
                // FIRST NAME
                // =================================================

                TextFormField(
                  controller: firstNameController,

                  style: const TextStyle(
                    fontSize: 16,
                  ),

                  decoration: InputDecoration(
                    labelText: "First Name",
                    hintText: "Enter your first name",
                     filled: true,
                fillColor: Colors.grey.shade200,

                    prefixIcon: const Icon(
                      CupertinoIcons.person,
                      size: 18,
                    ),

                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10),
                          borderSide: BorderSide.none
                    ),
                  ),

                  validator: (value) {
                    return requiredValidator(
                      value,
                      "First Name",
                    );
                  },
                ),

                const SizedBox(height: 25),

                // =================================================
                // LAST NAME
                // =================================================

                TextFormField(
                  controller: lastNameController,

                  style: const TextStyle(
                    fontSize: 16,
                  ),

                  decoration: InputDecoration(
                    labelText: "Last Name",
                    hintText: "Enter your last name",
                     filled: true,
                fillColor: Colors.grey.shade200,

                    prefixIcon: const Icon(
                      CupertinoIcons.person,
                      size: 18,
                    ),

                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10),
                          borderSide: BorderSide.none
                    ),
                  ),

                  validator: (value) {
                    return requiredValidator(
                      value,
                      "Last Name",
                    );
                  },
                ),

                const SizedBox(height: 25),

                // =================================================
                // PASSWORD
                // =================================================

                TextFormField(
                  controller: passwordController,

                  obscureText: _obscurePassword,

                  style: const TextStyle(
                    fontSize: 16,
                  ),

                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Create a strong password",
                     filled: true,
                fillColor: Colors.grey.shade200,

                    prefixIcon: const Icon(
                      CupertinoIcons.lock,
                      size: 18,
                    ),

                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword =
                              !_obscurePassword;
                        });
                      },

                      icon: Icon(
                        _obscurePassword
                            ? CupertinoIcons.eye
                            : CupertinoIcons.eye_slash,
                        size: 18,
                      ),
                    ),

                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10),
                          borderSide: BorderSide.none
                    ),
                  ),

                  validator: (value) {
                    return requiredValidator(
                      value,
                      "Password",
                    );
                  },
                ),

                const SizedBox(height: 25),

                // =================================================
                // NEXT / REGISTER BUTTON
                // =================================================

               SizedBox(
  height: 55,
  width: double.infinity,
  child: ElevatedButton(
    onPressed: () {
      if (_formKey.currentState!.validate()) {
        UserData.saveUser(
          email: emailController.text.trim(),
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          password: passwordController.text.trim(),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Registration successful"),
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const login(),
          ),
        );
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: const Text(
      "Next",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

                const SizedBox(height: 20),

                // =================================================
                // LOGIN
                // =================================================

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [
                    const Text(
                      "Do you have an account?",
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const login(),
                          ),
                        );
                      },

                      child: const Text(
                        "Sign In",
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

                const Center(
                  child: Text(
                    "------------ Sign In ------------",
                  ),
                ),

                const SizedBox(height: 20),

                // =================================================
                // SOCIAL BUTTONS
                // =================================================

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [
                    FloatingActionButton(
                      heroTag: "googleRegister",

                      onPressed: () {},

                      backgroundColor:
                          Colors.grey.shade300,

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30),
                      ),

                      child: const Icon(
                        Icons.g_mobiledata,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),

                    const SizedBox(width: 20),

                    FloatingActionButton(
                      heroTag: "facebookRegister",

                      onPressed: () {},

                      backgroundColor:
                          Colors.grey.shade300,

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30),
                      ),

                      child: const Icon(
                        Icons.facebook,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),

                    const SizedBox(width: 20),

                    FloatingActionButton(
                      heroTag: "appleRegister",

                      onPressed: () {},

                      backgroundColor:
                          Colors.grey.shade300,

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30),
                      ),

                      child: const Icon(
                        Icons.apple,
                        color: Colors.black,
                        size: 23,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

