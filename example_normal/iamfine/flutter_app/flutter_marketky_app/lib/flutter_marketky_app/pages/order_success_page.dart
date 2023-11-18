import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constant/constant_index.dart';
import '../tools/tools_index.dart';
import 'page_switcher.dart';

class OrderSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 184,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColor.primary,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  backgroundColor: AppColor.border,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                  shadowColor: Colors.transparent,
                ),
                child: const Text(
                  'Your Orders',
                  style: TextStyle(
                      color: AppColor.secondary, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PageSwitcher()));
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  backgroundColor: AppColor.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                  shadowColor: Colors.transparent,
                ),
                child: const Text(
                  'Continue Shopping',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      fontFamily: 'poppins'),
                ),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 124,
              height: 124,
              margin: const EdgeInsets.only(bottom: 32),
              child: SvgPicture.asset(Utils.assets('icons/Success.svg')),
            ),
            const Text(
              'Order Success! 😆',
              style: TextStyle(
                color: AppColor.secondary,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: 'poppins',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                'We have received your order',
                style: TextStyle(color: AppColor.secondary.withOpacity(0.8)),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
