import 'package:vds/base/networking/api_service.dart';
import 'package:vds/base/request/create_order_request.dart';
import 'package:vds/base/request/invoice_request.dart';
import 'package:vds/base/request/merchant_transactions_request.dart';
import 'package:vds/base/request/orders_request.dart';
import 'package:vds/base/request/user_notifications_request.dart';
import 'package:vds/common/api_const.dart';
import 'package:vds/model/details.transaction.model.dart';
import 'package:vds/model/invoice_response.dart';
import 'package:vds/model/notify_count_response.dart';
import 'package:vds/model/order_response.dart';
import 'package:vds/model/orders.model.dart';
import 'package:vds/model/order.details.model.dart';
import 'package:vds/model/transition.model.dart';
import '../../model/notification.model.dart';
import '../../model/order.create.model.dart';
import '../../model/withdraw.money.model.dart';
import '../request/merchant_transaction_details_request.dart';
import '../request/merchant_withdraw_money_request.dart';
import '../request/notify_count_request.dart';

class OrderRepositories {
  Future<OrderResponse> merchantTransactions(
      MerchantTransactionsRequest request) async {
    final map = await apiService.getM(request.toApi(), request.toMap());
    return OrderResponse.fromJson(map);
  }

  Future<TransitionModel> merchantTransaction(
      MerchantTransactionsRequest request) async {
    final map = await apiService.getM(request.toApi(), request.toMap());
    return TransitionModel.fromJson(map);
  }

  Future<WithdrawModel> merchantWithdraw(
      MerchantTransactionsMoneyRequest request) async {
    final map = await apiService.getM(request.toApi(), request.toMap());
    return WithdrawModel.fromJson(map);
  }

  Future<OrdersResponse> merchantCreateOrder(CreateOrderRequest request) async {
    final map = await apiService.postM(request.toApi(), request.toMap());
    return OrdersResponse.fromJson(map);
  }

  Future<OrdersModel> merchantOrders(OrdersRequest request) async {
    final map = await apiService.getM(request.toApi(), request.toMap());
    return OrdersModel.fromJson(map);
  }

  Future<OrderDetails> merchantDetails(String id) async {
    final map = await apiService.getMer(ApiConst.merchantOrderDetails + id);
    return OrderDetails.fromJson(map);
  }

  Future<InvoiceResponse> getInvoice(InvoiceRequest request) async {
    final map = await apiService.getM(request.toApi(), request.toMap());
    return InvoiceResponse.fromJson(map);
  }

  Future<DetailsTransactionModel> getDetailsTransaction(
      TransactionDetailsRequest request) async {
    final map = await apiService.getM(request.toApi(), request.toMap());
    return DetailsTransactionModel.fromJson(map);
  }

  Future<NotificationModel> getUserNotifications(UserNotificationsRequest request) async {
    final map = await apiService.getM(request.toApi(), request.toMap());
    return NotificationModel.fromJson(map);
  }

  Future<NotifyCountResponse> getNotifyCount(NotifyCountRequest request) async {
    final map = await apiService.getM(request.toApi(), request.toMap());
    return NotifyCountResponse.fromJson(map);
  }
}
