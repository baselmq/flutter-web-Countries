import 'package:countries/models/countries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardCountries extends StatelessWidget {
  const CardCountries(
      {required ModelCountries data,
      required bool selectFlag,
      required bool selectCurrency,
      required bool selectDialCode,
      required bool selectCountry,
      Key? key})
      : _data = data,
        _selectFlag = selectFlag,
        _selectCurrency = selectCurrency,
        _selectDialCode = selectDialCode,
        _selectCountry = selectCountry,
        super(key: key);
  final ModelCountries _data;
  final bool _selectFlag;
  final bool _selectCurrency;
  final bool _selectDialCode;
  final bool _selectCountry;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            _selectCountry
                ? Expanded(
                    child: Center(
                        child: Text(
                      _data.name!,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                  )
                : const SizedBox(),
            _selectFlag
                ? Expanded(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: SvgPicture.network(
                        _data.flag!,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  )
                : const SizedBox(),
            _selectDialCode
                ? Expanded(
                    child: Center(
                        child: Text(
                      _data.dialCode!,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                  )
                : const SizedBox(),
            _selectCurrency
                ? Expanded(
                    child: Center(
                        child: Text(
                      _data.currency!,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                  )
                : const SizedBox(),
          ],
        ),
        const Divider(
          thickness: 1.5,
        ),
      ],
    );
  }
}
