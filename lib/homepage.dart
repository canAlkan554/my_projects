import 'package:flutter/material.dart';
import 'bookslist.dart';
import 'class.dart';
import 'methodPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController kitapad = TextEditingController();
  TextEditingController yazarad = TextEditingController();
  TextEditingController adet = TextEditingController();
  List<Kitap>kitaplar=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kitap Ekleme Sayfası",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        shadowColor: Colors.black,
        backgroundColor: Colors.blueAccent,),
      body: Padding(
          padding: EdgeInsets.fromLTRB(100,30,100,30),
          child: Column(
            children: [
              buildhomePageTextField(kitapad,"Kitap Adı","Bab-ı Esrar"),
              SizedBox(height: 10,),
              buildhomePageTextField(yazarad,"Yazar Adı","Ahmet"),
              SizedBox(height: 10,),
              buildhomePageTextField(adet,"Kitap Adedi","15"),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: Colors.blueAccent,
                          border: Border.all(
                            color: Colors.black38,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(7)),
                      width: 240,
                      margin: EdgeInsets.only(right: 10),
                      height: 50,
                      child: TextButton(
                        child: Text("Ekle",style: TextStyle(color: Colors.white),),
                        onPressed: () {
                          String? message;
                          if(kitapad.text.isEmpty||yazarad.text.isEmpty||adet.text.isEmpty){
                            message="Kitap adı ,yazar adı,stok miktarını boş bırakmayın";
                          }
                          else{
                            kitaplar.add(Kitap(kitapAdi: kitapad.text,yazarAdi: yazarad.text,stokAdedi: int.parse(adet.text)));
                            message="Kitap başarılı şekilde eklendi";
                          }
                          TextButton okbtn =TextButton(onPressed: () {
                            Navigator.pop(context);
                          }, child: Text("Tamam"));
                          AlertDialog alert=AlertDialog(title: Text("Kitap Ekle"),content: Text(message),actions: [okbtn],);
                          showDialog(context: context, builder: (context) => alert,);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color:Colors.blueAccent   ,
                          border: Border.all(
                            color: Colors.black38,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(7)),
                      width: 240,
                      margin: EdgeInsets.only(left: 10),
                      height: 50,
                      child: TextButton(
                        child: Text("Listele",style: TextStyle(color: Colors.white),),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => sayfa2(kitaplar: kitaplar,),));
                        },
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
    );
  }


}
