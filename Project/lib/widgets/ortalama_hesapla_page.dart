import 'package:flutter/material.dart';
import 'package:orthesapla/constants/app_constants.dart';
import 'package:orthesapla/helper/data_helper.dart';
import 'package:orthesapla/model/ders.dart';
import 'package:orthesapla/widgets/ders_listesi.dart';
import 'package:orthesapla/widgets/harf_dropdown_widget.dart';
import 'package:orthesapla/widgets/kredi_dropdown_widget.dart';
import 'package:orthesapla/widgets/ortalama_goster.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  var formKey=GlobalKey<FormState>();
  double secilenHarfDeger=4;
  double secilenKrediDeger=1;
  String girilenDersAdi="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(child: Text(Sabitler.baslikText,style: Sabitler.baslikStyle,)),
      ),
      body: Column(children: [
        Row(
          children: [
            Expanded(child: Container(child: _buildForm(),) ,
            flex: 2,
            ),
            Expanded(child: OrtalamaGoster(ortalama: DataHelper.ortalamaHesapla(), dersSayisi: DataHelper.tumEklenenDersler.length,),
            flex: 1,
            )
          ],
        ),
        Expanded(
          child: DersListesi(onDismiss: (index){
            DataHelper.tumEklenenDersler.removeAt(index);
            setState(() {
              
            });
          },)
          ),
      ],),
    );
  }
  
 Widget _buildForm() {

  return Form(key: formKey,
  child: Column(children: [
    Padding(padding: Sabitler.yatay8Padding,child: _buildTextFromField() ,),
    SizedBox(height: 5,),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Padding(padding: Sabitler.yatay8Padding,child:HarfDropdownWidget(onHarfSecildi: (harf){secilenHarfDeger=harf;},) ,)),
        Expanded(child: Padding(padding: Sabitler.yatay8Padding,child:KrediDropdownWidget(onKrediSecildi: (kredi){secilenKrediDeger=kredi;},) ,)),
        IconButton(onPressed: _dersEkleveOrtalamaHesapla, icon: Icon(Icons.arrow_forward_sharp),iconSize: 30,color: Sabitler.anaRenk,),
      ],
    ),
    SizedBox(height: 5,),
  ],),
  );
 }
 
  _buildTextFromField() {
    return TextFormField(
      onSaved: (deger){
        setState(() {
          girilenDersAdi=deger!;
        });
      },
      validator: (s){
        if(s!.length<=0){
          return "Ders adını giriniz.";
        }else{
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: "Ders Adı",
        border: OutlineInputBorder(borderRadius: Sabitler.borderRadius,borderSide: BorderSide.none),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.2),
      ),
    );
  }
  
  _dersEkleveOrtalamaHesapla() {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      var eklenecekDers=Ders(ad: girilenDersAdi, harfDegeri: secilenHarfDeger, krediDegeri: secilenKrediDeger);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {
        
      });

    }
  }
}

