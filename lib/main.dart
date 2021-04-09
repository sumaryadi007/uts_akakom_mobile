import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  //set config aplikasi
  runApp(MaterialApp(
    title: 'Aplikasi Inventaris Barang', // used by the OS task switcher
    home: HalamanAwal(),
  ));
}

class HalamanAwal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //membuat appBar (Judul halaman)
      appBar: AppBar(
        title: Text('Aplikasi Inventaris Barang'),
      ),
      body:
        Container(
          //menambahkan background dengan gambar di folder Assets
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('img/background.jpg'),
              fit: BoxFit.cover,),
          ),
        child:Center(
          //layouting dengan konsep row dan column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            //menambahkan beberapa widget ke dalam column
            children:<Widget>[
              //widget icon archived
              Container(
                margin: EdgeInsets.only(bottom:36),
                child:Icon(
                  Icons.archive_rounded,
                  size: 100,
                  color: Colors.blueGrey[500],
                ),
              ),
              //widget judul
              Container(
                margin: EdgeInsets.only(bottom:24),
                alignment: Alignment.center,
                child:Text('Selamat Datang di Aplikasi Inventaris Barang',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),),
              ),
              //widget teks pembuat aplikasi dan nim
              Container(
                margin: EdgeInsets.only(bottom:8),
                alignment: Alignment.center,
                child:Text('Sumaryadi',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                  ),),
              ),
              Container(
                margin: EdgeInsets.only(bottom:36),
                alignment: Alignment.center,
                child:Text('NIM 185411152',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                  ),),
              ),

              //widget tombol mulai
              new MaterialButton(
                child: Text('Mulai'),
                color: Colors.blue[700],
                textColor: Colors.white,
                //ketika diklik akan pindah ke halaman Home
                onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=>Home()),);
                },
              )],
          ),
        ),
        ),
    );
  }
}
