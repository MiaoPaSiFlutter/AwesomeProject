import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_paytabs_tickets_app/flutter_paytabs_tickets_app.dart';

import 'payment_states.dart';

class PaymentViewModel {
  final PayTabsService _payTabsService = PayTabsService();

  makePayTabsPayment(WidgetRef ref, double amount) {
    FlutterPaytabsBridge.startPaymentWithSavedCards(
      _payTabsService.configPayment(
          payTabsPaymentRequest: PayTabsPaymentRequest(34.4, 'USD', 'AE')),
      false,
      (event) {
        if (event["status"] == "success") {
          var transactionDetails = event["data"];
          if (transactionDetails["isSuccess"]) {
            ref.setPaymentState(SuccessPaymentState());
          } else {
            ref.setPaymentState(ErrorPaymentState('Error 2222S'));
          }
        } else if (event["status"] == "error") {
          ref.setPaymentState(ErrorPaymentState('Error 1111'));
        } else if (event["status"] == "event") {}
      },
    );
  }
}
