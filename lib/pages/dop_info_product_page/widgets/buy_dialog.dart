import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/pages/dop_info_product_page/widgets/transaction_button.dart';
import 'package:shop/res/formatter/card_date_formatter.dart';
import 'package:shop/res/formatter/card_number_formatter.dart';

class BuyDialog extends StatelessWidget {
  const BuyDialog(
      {super.key,
      required this.controllerNumberCard,
      required this.controllerDateCard,
      required this.controllerCvvCard});

  final TextEditingController controllerNumberCard;
  final TextEditingController controllerDateCard;
  final TextEditingController controllerCvvCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 449,
      color: Color(0xFFD9D9D9),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: 308,
            height: 170,
            color: Colors.black,
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 290,
                    height: 44,
                    padding: EdgeInsets.all(5),
                    color: Colors.white,
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly, // Только цифры
                        LengthLimitingTextInputFormatter(
                            19), // 16 цифр + 3 пробела
                        CardNumberFormatter(), // Форматирование
                      ],
                      maxLength: 16,
                      controller: controllerNumberCard,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: "",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 160,
                    ),
                    Container(
                      width: 70,
                      height: 44,
                      color: Colors.white,
                      child: TextFormField(
                        maxLength: 5,
                        inputFormatters: [
                          FilteringTextInputFormatter
                              .digitsOnly, // Только цифры
                          LengthLimitingTextInputFormatter(
                              4), // Ограничение на 4 цифры (MMYY)
                          CardDateFormatter(), // Формат MM/YY
                        ],
                        decoration: InputDecoration(
                          labelText:
                              controllerDateCard.text.isEmpty ? " MM/YY" : null,
                          counterText: "",
                        ),
                        textAlign: TextAlign.center,
                        controller: controllerDateCard,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 50,
                      height: 44,
                      color: Colors.white,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        controller: controllerCvvCard,
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText:
                              controllerCvvCard.text.isEmpty ? " CVV" : null,
                          counterText: "",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 125,
          ),
          TransactionButton(),
        ],
      ),
    );
  }
}
