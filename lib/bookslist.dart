import 'package:flutter/material.dart';
import 'class.dart';

class sayfa2 extends StatelessWidget {
  List<Kitap> kitaplar = [];
  sayfa2({super.key, required this.kitaplar});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text("Kitap Listeleme Sayfası"),
              centerTitle: true,
              leading: IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back)),
              shadowColor: Colors.black,
              backgroundColor: Colors.blueAccent,
            ),
            body: Center(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(height: 3,),
              itemCount: kitaplar.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white38),
                  child: ListTile(
                    leading: Text((index+1).toString(),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),
                    title: Text(kitaplar[index].kitapAdi.toString(),style: TextStyle(color: Colors.black)),
                    subtitle: Text(kitaplar[index].yazarAdi.toString() +
                        " Stok adedi:" +
                        kitaplar[index].stokAdedi.toString(),style: TextStyle(color: Colors.black),),
                  ),
                );
              },
            ))));
  }
}
