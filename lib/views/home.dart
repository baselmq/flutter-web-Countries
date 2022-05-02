import 'package:countries/Api/controller.dart';
import 'package:countries/components/app_checkbox.dart';
import 'package:countries/components/app_loading.dart';
import 'package:countries/models/controller_Countries.dart';
import 'package:countries/models/countries.dart';
import 'package:countries/views/card_countries.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiController _api = ApiController();
  late ModelControllerCountries s;
  @override
  void initState() {
    super.initState();
  }

  Future<ModelControllerCountries> _getData() async {
    return await _api.getCountries();
  }

  bool selectFlag = true;
  bool selectCurrency = true;
  bool selectDialCode = true;
  bool selectCountry = true;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ModelControllerCountries>(
      future: _getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            !snapshot.hasData) {
          return const Scaffold(
            body: Center(
              child: AppLoading(),
            ),
          );
        }
        if (snapshot.hasData) {
          List<ModelCountries> _dataList = snapshot.data?.listCountries ?? [];
          return Scaffold(
            appBar: AppBar(
              title: const Text("Countries & Cities"),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Select the information you want to see",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      // * CheckBox Country
                      Expanded(
                          child: AppCheckBox(
                        isChecked: selectCountry,
                        text: "Country",
                        onChanged: (value) {
                          setState(() {
                            selectCountry = value!;
                          });
                        },
                      )),
                      // * CheckBox Flag
                      Expanded(
                          child: AppCheckBox(
                        isChecked: selectFlag,
                        text: 'Flag',
                        onChanged: (value) {
                          setState(() {
                            selectFlag = value!;
                          });
                        },
                      )),
                      // * CheckBox DialCode
                      Expanded(
                          child: AppCheckBox(
                        isChecked: selectDialCode,
                        text: 'DialCode',
                        onChanged: (value) {
                          setState(() {
                            selectDialCode = value!;
                          });
                        },
                      )),
                      // * CheckBox Currency
                      Expanded(
                          child: AppCheckBox(
                        isChecked: selectCurrency,
                        text: 'Currency',
                        onChanged: (value) {
                          setState(() {
                            selectCurrency = value!;
                          });
                        },
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Divider(
                    thickness: 1.5,
                  ),
                  !selectCurrency &&
                          !selectDialCode &&
                          !selectFlag &&
                          !selectCountry
                      ? const Center(
                          child: Padding(
                          padding: EdgeInsets.all(22.0),
                          child: Text(
                            "OPPS NO RESULT",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 22),
                          ),
                        ))
                      : ListView.builder(
                          itemCount: _dataList.length,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            ModelCountries _dataCountries =
                                _dataList.elementAt(index);
                            return CardCountries(
                              data: _dataCountries,
                              selectCurrency: selectCurrency,
                              selectDialCode: selectDialCode,
                              selectFlag: selectFlag,
                              selectCountry: selectCountry,
                            );
                          }),
                        ),
                ],
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('error message'),
            ),
          );
        }
      },
    );
  }
}
