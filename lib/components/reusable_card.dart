import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;     //final sabit tutuyor. O anda renklerinde degisiklik yapilabildigi icin final kullanildi.
  final Widget? cardChild;
  final void Function()? onPress;   //GestureDetecetor' ın onTap ozelligi void Function argumanini istiyor.
  ReusableCard ({required this.colour, this.cardChild, this.onPress});  //required gerekli demek

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),  //karenin koselerin yuvarlak olmasi saglandi
          color: colour,
        ),
      ),
    );
  }
}

//Normalde bu kodu cok yerde kullaniyorduk. Bunun icinse ayrı bir class acip daha sonra oraya yazmayi daha uygun bulduk.
//Bunu ise su sekilde yaptik. Ayirmak istedigimiz kodu secip sag tiklayip Refactor ==> Extract Flutter widget.
//Bu arada Angela hocam extract method' dan yapti. Ben de o olmadi, bu sebeple flutter widget yaptim.
//const ReusableCard({Key? key,}) : super(key: key);
//Bu kod otomatik olarak override ustunde yaziliydi. Ama biz onu sildik. Cunku bu ky hareketli olanlarda(kayan vb.), animasyonlarda kullaniliyor.
// Bu projede gerekli olmadigi icin sildik.