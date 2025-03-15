import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/history/bloc/history_bloc.dart';
import 'package:shop/pages/homes/account_page/widgets/account_widget.dart';
import 'package:shop/pages/homes/account_page/widgets/history_widget.dart';
import 'package:shop/pages/homes/widgets/app_bar.dart';
import 'package:shop/pages/homes/widgets/bottom_bar.dart';
import 'package:shop/pages/homes/widgets/icon_button_more_vert.dart';

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
        title: AppBarText(title: 'Account'),
        actions: [IconButtonMoreVert()],
      ),
      body: Center(
        child: Column(
          children: [
            AccountWidget(),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Color.fromARGB(255, 255, 196, 0),
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
              child: BlocBuilder<HistoryBloc, HistoryState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.product.length,
                    itemBuilder: (context, index) => HistoryWidget(
                      product: state.product[index],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
