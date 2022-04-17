import 'dart:async';

import 'package:flutter/material.dart';

class page extends StatefulWidget {
  const page({Key? key}) : super(key: key);

  @override
  State<page> createState() => _pageState();
}

enum Sizechart { unknown, sim, ktp, motor }

class _pageState extends State<page> {
  Sizechart jaminan = Sizechart.unknown;
  String nama = "", NIK = "", alamat = "";
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerNIK = TextEditingController();
  TextEditingController controllerAlamat = TextEditingController();

  String getSizechart(Sizechart? value) {
    if (value == Sizechart.sim) {
      return "SIM";
    } else if (value == Sizechart.ktp) {
      return "KTP";
    } else if (value == Sizechart.motor) {
      return "Motor";
    }
    return "Wajib memiliki jaminan";
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controllerNama.dispose();
    controllerNIK.dispose();
    controllerAlamat.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;

    Widget welcom = Row(
      children: [
        Text(
          "\nCITY CAR RENTAL SAMARINDA",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Color(0xff000000),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Fayza Virdana Addza"),
        backgroundColor: Color(0xffc1bddc),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xff000000),
        ),
      ),
      backgroundColor: Color(0xfff5f4f9),
      body: ListView(children: [
        welcom,
        SizedBox(height: 50),
        TextField(
          controller: controllerNama,
          decoration: InputDecoration(
            labelText: "Nama",
            hintText: "Masukkan nama sesuai yang ada di KTP anda",
            border: OutlineInputBorder(),
            fillColor: Color(0xff000000),
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: controllerNIK,
          decoration: InputDecoration(
            labelText: "NIK",
            hintText: "Masukkan NIK yang sesuai di KTP anda",
            border: OutlineInputBorder(),
            fillColor: Color(0xff000000),
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: controllerAlamat,
          decoration: InputDecoration(
            labelText: "Alamat",
            hintText: "Masukkan alamat anda tinggal",
            border: OutlineInputBorder(),
            fillColor: Color(0xff000000),
          ),
        ),
        Text(
          "Jaminan : \n",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: const Text("SIM",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff000000))),
                leading: Radio(
                  groupValue: jaminan,
                  value: Sizechart.sim,
                  onChanged: (Sizechart? value) {
                    setState(() {
                      jaminan = value!;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text("KTP",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff000000))),
                leading: Radio(
                  groupValue: jaminan,
                  value: Sizechart.ktp,
                  onChanged: (Sizechart? value) {
                    setState(() {
                      jaminan = value!;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text("Motor",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff000000))),
                leading: Radio(
                  groupValue: jaminan,
                  value: Sizechart.motor,
                  onChanged: (Sizechart? value) {
                    setState(() {
                      jaminan = value!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              nama = controllerNama.text;
              NIK = controllerNIK.text;
              alamat = controllerAlamat.text;
            });
          },
          child: Text(
            "Submit",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff000000),
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Color(0xff687189),
          ),
        ),
        SizedBox(height: 25),
        Text(
          "Data yang sudah diinputkan",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 25),
        Text(
          "Nama : $nama",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 25),
        Text(
          "NIK : $NIK",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 25),
        Text(
          "Alamat : $alamat",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 25),
        Text(
          'Jaminan : ${getSizechart(jaminan)}',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ]),
    );
  }
}
