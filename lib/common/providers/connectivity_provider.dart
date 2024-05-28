import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityInstanceProvider = Provider((ref) => Connectivity());
final connectivityListProvider =
    StreamProvider.autoDispose<List<ConnectivityResult>>((ref) {
  final instance = ref.watch(connectivityInstanceProvider);
  return instance.onConnectivityChanged;
});
