import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Inventaris Barang'),
      ),
      body: Homepage(title: 'Beranda'),
    );
  }
}

class Homepage extends StatefulWidget {
  Homepage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {

  // ignore: deprecated_member_use
  //List digunakan untuk membuat list barang
  List<String> titles = new List<String>();

  //untuk menyimpan variable input barang
  String barang;

  //untuk mendapatkan nilai dari Textfield
  TextEditingController tfBarang = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //menambahkan tombol tambah di pojok kanan bawah
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey[500],
          foregroundColor: Colors.white,
          onPressed: () {
            //memunculkan kotak dialog tambah barang ketika tombol tambah diklik
            showDialog(context: context, builder: (BuildContext context){
              return Dialog(shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),),
                elevation: 1,
                backgroundColor: Colors.white,
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:<Widget>[
                      Container(
                       child: Center(
                         child: Text('Tambah Barang',
                         style:
                           TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.bold,
                             color: Colors.blue[800]
                           ),),
                       ),
                      ),
                      Container(
                      margin: EdgeInsets.only(top: 24, bottom:24, left: 24, right: 24),
                      child: TextField(
                        controller: tfBarang,
                        decoration: InputDecoration(
                          labelText: 'Nama Barang',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                        ),
                      )),
                      MaterialButton(
                      child: Text('Tambah'),
                          color: Colors.blue[700],
                          textColor: Colors.white,
                          onPressed: () {
                            setState(() {
                              //menambahkan barang ke dalam list
                              titles.insert(titles.length, tfBarang.text);
                            });

                            //Dismiss kotak dialog
                            Navigator.pop(context, true);
                          })
                    ]
                ),);
            },);},
        child: Icon(Icons.add),
        ),
    body: _myListView(),
    );
  }

  // Membuat listView (daftar nama barang)
  Widget _myListView() {
    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        final item = titles[index];
        return Card(
          child: ListTile(
            title: Text(item),

            //ketika nama barang diklik tahan maka akan menghapus nama barang tersebut dari daftar
            onLongPress: () { //                            <-- onLongPress
              showDialog(context: context, builder: (__){
                return AlertDialog(
                  title: Text('Yakin akan menghapus item ini?'),
                  actions: [
                    FlatButton(
                      onPressed: () => Navigator.pop(context, true), // passing false
                      child: Text('Tidak'),
                    ),
                    FlatButton(
                      onPressed: (){
                        //menghapus barang sesuai dengan index pada list
                        setState(() {
                          titles.removeAt(index);
                        });
                        Navigator.pop(context, true);
                      }, // passing true
                      child: Text('Ya'),
                    ),
                  ],
                );
              });
            },
          ),
        );
      },
    );
  }
}