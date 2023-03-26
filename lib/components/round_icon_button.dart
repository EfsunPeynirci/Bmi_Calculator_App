import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton ({@required this.icon, @required this.onPressed});
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

//Normalde RoundIconButton yerine FloatingActionButton yazilabilir. Ama biz bu butonlari ozellestirip yazmak istedik.
//Bu sebeple FloatingActionButton' ına ctrl ile tıklayip icine girdik. Ve orada hangisiyle sekil, renk verdigini bulduk.
//O da RoundIconButton