import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() => _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState extends State<CurrencyConverterCupertinoPage> {

  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    result = double.parse(textEditingController.text) * 81;
    setState(() {});
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,

      navigationBar: const CupertinoNavigationBar(
        middle:  Text(
          "Currency Converter",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: CupertinoColors.systemYellow),
        ),
        backgroundColor: CupertinoColors.systemPurple,
      ),

      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                '₹${result!=0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white,
                ),
              ),

              const SizedBox(height: 10.0),

              CupertinoTextField(
                placeholder: "Enter the Amount (in USD)",
                placeholderStyle: const TextStyle(color: CupertinoColors.black),
                prefix: const Icon(CupertinoIcons.money_dollar, size: 25,),
                controller: textEditingController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                cursorColor: CupertinoColors.black,
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border.all(
                    color: CupertinoColors.systemPurple,
                    width: 4.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(70.0),
                ),
                style: const TextStyle(
                    color: CupertinoColors.black, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 10.0),

              CupertinoButton(
                onPressed: () {
                  convert();
                },
              color: CupertinoColors.white,
              // minSize: Size(double.infinity, 50),
              borderRadius: BorderRadius.circular(20.0),
                child: const Text(
                  "Convert",
                  style: TextStyle(color: CupertinoColors.black, fontWeight: FontWeight.bold),
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
