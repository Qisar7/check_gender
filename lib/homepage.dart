import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:malefmale/model/m1.dart';
import 'package:malefmale/network/api_conect.dart';
import 'package:http/http.dart' as http;
import 'package:malefmale/uri.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Con con = Con();

  var _namecontrller = TextEditingController();

  @override
  void initState() {
    super.initState();
    con.getdataa(name: _namecontrller.text);
  }
  // void getdata(String title) async {
  //   final resonse = await http.post(
  //     Uri.parse('https://jsonplaceholder.typicode.com/posts'),
  //     body: {
  //       "userId": "4",
  //       "title": title.toString().toUpperCase(),
  //       "body": "asdasdkjasdsada12313"
  //     },
  //   );

  //   print(jsonDecode(resonse.body));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CHECK GENDER'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                TextField(
                  controller: _namecontrller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'enter the name to know',
                  ),
                ),
                const SizedBox(height: 20),

                const SizedBox(height: 20),
                FutureBuilder(
                  future: con.getdataa(name: _namecontrller.text),
                  builder: (cntx, AsyncSnapshot snapshot) {
                    var data = snapshot.data;

                    return snapshot.hasData
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Dataw(
                                title: 'name :',
                                desc: data!['name'],
                              ),
                              const SizedBox(height: 10),
                              Dataw(
                                title: 'gender :',
                                desc: data!['gender'],
                              ),
                              const SizedBox(height: 10),
                              Dataw(
                                title: 'probability :',
                                desc: data!['probability'].toString(),
                              ),
                              const SizedBox(height: 10),
                              Dataw(
                                title: 'count :',
                                desc: data!['count'].toString(),
                              ),
                            ],
                          )
                        : const CircularProgressIndicator();
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          con.getdataa(name: _namecontrller.text);
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.teal.shade800,
                        primary: Colors.white,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          ' Search ! ',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )),
                ),
                // Column(
                //   children: [
                //     Dataw(
                //       title: 'name',
                //       desc: 'n' + data!.name,
                //     ),
                //     Dataw(
                //       title: 'gender',
                //       desc: 'g ' + data.gender,
                //     ),
                //     Dataw(
                //       title: 'probability',
                //       desc: 'p ' + data.probability.toString(),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Dataw extends StatelessWidget {
  String? title;
  String? desc;

  Dataw({required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title.toString().toUpperCase(),
            style: const TextStyle(
              color: Color.fromARGB(255, 6, 171, 154),
              fontSize: 25,
            ),
          ),
          Flexible(
            child: Text(
              desc.toString().toUpperCase(),
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color.fromARGB(255, 248, 5, 5),
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
