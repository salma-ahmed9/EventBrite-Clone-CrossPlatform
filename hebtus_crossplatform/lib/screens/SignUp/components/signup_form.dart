import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hebtus_crossplatform/components/confirm_passwd_text_field.dart';
import '../../../components/or_divider.dart';
import '../../../components/password_text_field.dart';
import '../../../components/email_text_field.dart';
import '../../../services/auth_service.dart';
import 'already_have_account_btn.dart';
import '../../../components/socialmedia_icon.dart';
import 'package:go_router/go_router.dart';

///Sign up form, contains signup text fields: email, password, confirm password, first name, last name.
class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
  });

  static final _formKey = GlobalKey<FormState>();

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _passwdController = TextEditingController();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _confirmPassController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: SignupForm._formKey,
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
              ))
            : Column(
                children: [
                  EmailTextField(
                    myKey: "signupEmailField",
                    controller: _emailController,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                              controller: _firstNameController,
                              key: const Key("firstNameField"),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (firstName) {
                                if (firstName != null && firstName.isEmpty) {
                                  return "First Name can't be empty";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  label: Text("First name"),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                        ),
                        const SizedBox(width: 5),
                        Flexible(
                          child: TextFormField(
                              controller: _lastNameController,
                              key: const Key("lastNameField"),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (lastName) {
                                if (lastName != null && lastName.isEmpty) {
                                  return "Last Name can't be empty";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  label: Text("Last name"),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                        ),
                      ],
                    ),
                  ),
                  PasswordTextfield(
                    controller: _passwdController,
                    myKey: "signupPassField",
                  ),
                  ConfirmPasswordTextfield(
                    passwdController: _passwdController,
                    controller: _confirmPassController,
                    myKey: "signupConfirmField",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        key: const Key("SignUp"),
                        onPressed: () async {
                          bool isCaught = false;
                          if (SignupForm._formKey.currentState!.validate()) {
                            setState(() {
                              _isLoading = true;
                            });
                            try {
                              final AuthService authService = AuthService();
                              String message = await authService.signup(
                                  _firstNameController.text,
                                  _lastNameController.text,
                                  _emailController.text,
                                  _passwdController.text,
                                  _confirmPassController.text);
                              debugPrint(message);
                            } catch (e) {
                              isCaught = true;
                              setState(() {
                                _isLoading = false;
                              });
                              debugPrint(e.toString());
                              showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Error"),
                                      content: Text(e.toString()),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  });
                            } finally {
                              if (isCaught == false) {
                                showDialog(
                                    barrierDismissible: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Welcome to Hebtus!"),
                                        content: const Text(
                                            "Thank you for signing up, please verify your address by clicking on the link we sent to your email."),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              return context.go("/");
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    });
                              }
                            }
                          }
                        },
                        child: const Text("Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                  ),
                  const OrDivider(),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialMediaIcon(
                            iconSource: "assets/icons/facebook.svg",
                            press: () async {}),
                        const SizedBox(width: 15),
                        SocialMediaIcon(
                            iconSource: "assets/icons/google.svg",
                            press: () async {}),
                      ],
                    ),
                  ),
                  const AlreadyRegisteredBtn(),
                ],
              ));
  }
}
