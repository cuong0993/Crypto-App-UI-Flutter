import 'package:crypto_app/widgets/actions/actions_widget.dart';
import 'package:crypto_app/widgets/balance_panel/balance_panel.dart';
import 'package:crypto_app/widgets/chart/chart_home_page.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tuple/tuple.dart';
import 'package:unicons/unicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double balance = 66032206.10;
  double profit = 35.22;
  double profitPercent = 0.22;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0), //appbar size
        child: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          backgroundColor: themeData.backgroundColor,
          leading: SizedBox(
            height: 10.w,
            width: 15.w,
          ),
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leadingWidth: 15.w,
          title: Image.asset(
            themeData.brightness == Brightness.light
                ? 'assets/sobGOGdark.png'
                : 'assets/sobGOGlight.png',
            height: 3.5.h,
          ),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 5.w),
              child: SizedBox(
                height: 3.5.h,
                width: 10.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: themeData.primaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    UniconsLine.bell,
                    color: themeData.primaryColor,
                    size: 20.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: ListView(
            children: [
              balancePanel(balance, profit, profitPercent, themeData),
              actionsWidget(themeData),
              chartHomePage(
                true,
                CryptoFontIcons.ETH,
                'Ethereum',
                'ETH',
                'USD',
                const [
                  Tuple2(0, 2550.18),
                  Tuple2(1, 2500.34),
                  Tuple2(2, 2541.34),
                  Tuple2(3, 2540.59),
                  Tuple2(4, 2550.60),
                  Tuple2(5, 2639.80),
                  Tuple2(6, 2523.71),
                ],
                themeData,
              ),
              chartHomePage(
                true,
                CryptoFontIcons.BTC,
                'Bitcoin',
                'BTC',
                'USD',
                const [
                  Tuple2(0, 40005.71),
                  Tuple2(1, 40875.23),
                  Tuple2(2, 40800.59),
                  Tuple2(3, 40875.12),
                  Tuple2(4, 41875.72),
                  Tuple2(5, 40375.49),
                  Tuple2(6, 40700.58),
                ],
                themeData,
              ),
              chartHomePage(
                true,
                CryptoFontIcons.DOGE,
                'Dogecoin',
                'DOGE',
                'PLN',
                const [
                  Tuple2(0, 0.22),
                  Tuple2(1, 0.24),
                  Tuple2(2, 0.28),
                  Tuple2(3, 0.30),
                  Tuple2(4, 0.35),
                  Tuple2(5, 0.52),
                  Tuple2(6, 0.58),
                ],
                themeData,
              ),
              chartHomePage(
                true,
                CryptoFontIcons.LTC,
                'Litecoin',
                'LTC',
                'USD',
                const [
                  Tuple2(0, 100.40),
                  Tuple2(1, 102.34),
                  Tuple2(2, 98.23),
                  Tuple2(3, 100.23),
                  Tuple2(4, 102.10),
                  Tuple2(5, 103.85),
                  Tuple2(6, 103.20),
                ],
                themeData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
