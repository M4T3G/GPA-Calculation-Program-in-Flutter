import 'package:flutter/material.dart';
import 'package:orthesapla/constants/app_constants.dart';
import 'package:orthesapla/helper/data_helper.dart';
import 'package:orthesapla/model/ders.dart';

class DersListesi extends StatelessWidget {
  final Function onDismiss;
  const DersListesi({required this.onDismiss,super.key});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler=DataHelper.tumEklenenDersler;
    return tumDersler.length>0?ListView.builder(itemCount: tumDersler.length,itemBuilder: (context,index){
      return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        onDismissed: (a) {
          onDismiss(index);
        },
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Card(
            child: ListTile(
              title: Text(tumDersler[index].ad),
              leading: CircleAvatar(
                backgroundColor: Sabitler.anaRenk,
                child: Text(
                  (tumDersler[index].harfDegeri*tumDersler[index].krediDegeri).toString(),
                ),    
            ),
            subtitle: Text(
              "Not Değeri ${tumDersler[index].harfDegeri}, Kredi ${tumDersler[index].krediDegeri}"
            ),
          ),
        )
        ),
      );
      }): Container(child: Center(child: Text("Ders Ekleyiniz",style: Sabitler.baslikStyle,)));
  }
}