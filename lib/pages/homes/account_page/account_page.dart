import 'package:flutter/material.dart';
import 'package:shop/pages/homes/account_page/widgets/account_widget.dart';
import 'package:shop/pages/homes/account_page/widgets/history_widget.dart';
import 'package:shop/pages/homes/widgets/bottom_bar.dart';
import 'package:shop/pages/homes/widgets/search_form.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SearchForm(),
      ),
      body: Center(
        child: Column(
          children: [
            AccountWidget(),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.black,
              child: Center(
                child: Text(
                  'История',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              // Используем Expanded, чтобы ListView занимал доступное пространство
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => HistoryWidget(),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
