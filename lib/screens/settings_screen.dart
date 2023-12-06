import 'package:flutter/material.dart';
import 'package:cashier/widgets/header.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings-screen';
  const SettingsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Header(
            text: Text(
          "Settings",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        )),
        Container(
            //ACCOUNT
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Account",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Ink(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: const Row(
                              children: <Widget>[
                                Icon(
                                  Icons.security_outlined,
                                  size: 28,
                                ),
                                SizedBox(width: 15),
                                Text(
                                  "Security",
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            )),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Ink(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: const Row(
                              children: <Widget>[
                                Icon(
                                  Icons.notifications_none,
                                  size: 28,
                                ),
                                SizedBox(width: 15),
                                Text("Notifications",
                                    style: TextStyle(fontSize: 16))
                              ],
                            )),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Ink(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: const Row(
                              children: <Widget>[
                                Icon(
                                  Icons.lock_outline_rounded,
                                  size: 28,
                                ),
                                SizedBox(width: 15),
                                Text("Privacy", style: TextStyle(fontSize: 16))
                              ],
                            )),
                      ),
                    ]),
              )
            ])),
        Container(
            //SUPPORT & ABOUT
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Support & About",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Ink(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: const Row(
                              children: <Widget>[
                                Icon(
                                  Icons.question_mark_outlined,
                                  size: 28,
                                ),
                                SizedBox(width: 15),
                                Text("Help & Support",
                                    style: TextStyle(fontSize: 16))
                              ],
                            )),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Ink(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: const Row(
                              children: <Widget>[
                                Icon(
                                  Icons.info_outline,
                                  size: 28,
                                ),
                                SizedBox(width: 15),
                                Text("Terms and Policies",
                                    style: TextStyle(fontSize: 16))
                              ],
                            )),
                      )
                    ]),
              )
            ])),
        Container(
            // CACHE & CELLULAR
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Cache & Cellular",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                          onTap: () {},
                          child: Ink(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: const Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.delete_outline,
                                    size: 28,
                                  ),
                                  SizedBox(width: 15),
                                  Text("Free up Space",
                                      style: TextStyle(fontSize: 16))
                                ],
                              ))),
                      InkWell(
                          onTap: () {},
                          child: Ink(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: const Row(
                                children: <Widget>[
                                  Icon(Icons.save_alt_outlined, size: 28),
                                  SizedBox(width: 15),
                                  Text("Data Saver",
                                      style: TextStyle(fontSize: 16))
                                ],
                              ))),
                    ]),
              )
            ])),
        Container(
            //ACTIONS
            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Actions",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                          onTap: () {},
                          child: Ink(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: const Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.flag_outlined,
                                    size: 28,
                                  ),
                                  SizedBox(width: 15),
                                  Text("Report a Problem",
                                      style: TextStyle(fontSize: 16))
                                ],
                              ))),
                      InkWell(
                          onTap: () {},
                          child: Ink(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: const Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.people_alt_outlined,
                                    size: 28,
                                  ),
                                  SizedBox(width: 15),
                                  Text("Add Account",
                                      style: TextStyle(fontSize: 16))
                                ],
                              ))),
                      InkWell(
                          onTap: () {},
                          child: Ink(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: const Row(
                                children: <Widget>[
                                  Icon(Icons.logout_outlined, size: 28),
                                  SizedBox(width: 15),
                                  Text("Log Out",
                                      style: TextStyle(fontSize: 16))
                                ],
                              ))),
                    ]),
              )
            ]))
      ],
    );
  }
}
