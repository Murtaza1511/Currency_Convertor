import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CurrencyConvertorPage extends StatefulWidget {
  const CurrencyConvertorPage({super.key});
  @override
  State<CurrencyConvertorPage> createState() => _CurrencyConvertorPageState();
}

class _CurrencyConvertorPageState extends State<CurrencyConvertorPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
  void convert()
  {
    result = double.parse(textEditingController.text) * 80;
    setState(() {});
  }
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(5),
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text("Currency Convertor"),
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'INR ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
               TextField(
                controller: textEditingController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: "Enter the amount in USD ",
                  hintStyle: const TextStyle(

                  ),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: convert,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text("Convert"))
            ],
          ),
        ),

      ),
    );
  }
}
