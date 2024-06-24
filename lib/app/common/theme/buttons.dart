import 'package:flutter/material.dart';

final transparentButtonBlackBorder = ElevatedButton.styleFrom(
  backgroundColor: Colors.white,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
  side: const BorderSide(width: 0.8, color: Colors.black),
).merge(ButtonStyle(
  overlayColor:
      WidgetStateProperty.all<Color>(const Color.fromRGBO(0, 0, 0, 0.1)),
));

final transparentButton = ElevatedButton.styleFrom(
  backgroundColor: Colors.white,
  side: const BorderSide(width: 0.8, color: Color.fromRGBO(58, 151, 169, 1.0)),
).merge(ButtonStyle(
  overlayColor:
      WidgetStateProperty.all<Color>(const Color.fromRGBO(58, 151, 169, 1)),
));

final blackButton = ElevatedButton.styleFrom(
  backgroundColor: Colors.black,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
).merge(ButtonStyle(
  overlayColor:
      WidgetStateProperty.all<Color>(const Color.fromRGBO(58, 151, 169, 1)),
));

final primary500Button = ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
    side: BorderSide.none,
  ),
).merge(ButtonStyle(
  overlayColor:
      WidgetStateProperty.all<Color>(const Color.fromRGBO(0, 0, 0, 0.1)),
));

final primary400Button = ElevatedButton.styleFrom(
  backgroundColor: const Color.fromRGBO(58, 151, 169, 1.0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
).merge(ButtonStyle(
  overlayColor:
      WidgetStateProperty.all<Color>(const Color.fromRGBO(14, 89, 112, 1.0)),
));

final primary300Button = ElevatedButton.styleFrom(
  backgroundColor: const Color.fromRGBO(100, 201, 212, 1.0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
).merge(ButtonStyle(
  overlayColor:
      WidgetStateProperty.all<Color>(const Color.fromRGBO(14, 89, 112, 1.0)),
));
