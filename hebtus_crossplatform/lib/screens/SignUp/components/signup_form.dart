import 'package:flutter/material.dart';
import '../../../components/or_divider.dart';
import 'already_have_account_btn.dart';
import '../../../components/socialmedia_icon.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
              decoration: InputDecoration(
                  label: Text("Email address"),
                  prefixIcon: Icon(Icons.mail),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))))),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                child: TextFormField(
                    decoration: InputDecoration(
                        label: Text("First name"),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5))))),
              ),
              SizedBox(width: 5),
              Flexible(
                child: TextFormField(
                    decoration: InputDecoration(
                        label: Text("Last name"),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5))))),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  label: Text("Password"),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye_outlined),
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))))),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  label: Text("Confirm password"),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye_outlined),
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))))),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {},
              child: const Text("Sign Up",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
        ),
        const OrDivider(),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialMediaIcon(
                  iconSource: "assets/icons/facebook.svg", press: () {}),
              const SizedBox(width: 15),
              SocialMediaIcon(
                  iconSource: "assets/icons/google.svg", press: () {}),
            ],
          ),
        ),
        const AlreadyRegisteredBtn(),
      ],
    ));
  }
}
