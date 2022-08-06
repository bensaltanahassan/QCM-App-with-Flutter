import 'package:flutter/material.dart';
import 'package:qcmapp/view/widgets/custombuttonauth.dart';
import 'package:qcmapp/view/widgets/customtetxformfield.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: ListView(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            children: [
              Image.asset(
                "assets/images/img2.png",
                width: 150,
                height: 180,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                icon: Icon(
                  Icons.alternate_email,
                  color: Colors.grey[700],
                ),
                labelText: "Email",
                hintText: "Email",
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.grey[700],
                ),
                labelText: "Full name",
                hintText: "Full name",
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                icon: Icon(
                  Icons.phone_outlined,
                  color: Colors.grey[700],
                ),
                labelText: "Mobile",
                hintText: "Mobile",
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                icon: Icon(
                  Icons.lock_outline,
                  color: Colors.grey[700],
                ),
                labelText: "Password",
                hintText: "Password",
                suffixIcon: const Icon(
                  Icons.remove_red_eye,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "By signing up, you're agree to our ",
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                        const Text(
                          "Terms & Conditions",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "and ",
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                        const Text(
                          "Privacy Policy",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomButtonAuth(
                text: "Continue",
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Joined us before ? ",
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
