import 'package:flutter/material.dart';
import 'package:orthesapla/constants/app_constants.dart';
import 'package:orthesapla/helper/data_helper.dart';

class HarfDropdownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropdownWidget({required this.onHarfSecildi,super.key});

  @override
  State<HarfDropdownWidget> createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  double secilenHarfDeger=4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        value: secilenHarfDeger,
        onChanged: (deger) {
          setState(() {
            secilenHarfDeger=deger!;
            widget.onHarfSecildi(secilenHarfDeger);
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinHarfleri(),
    ),
    );
  }
}