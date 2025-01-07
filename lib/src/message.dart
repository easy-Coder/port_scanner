import 'dart:isolate';

import 'package:port_scanner/src/types.dart';

class SendMessage {
  final AddressPort addressPort;
  final SendPort port;

  SendMessage({required this.addressPort, required this.port});
}

class ReceiveMessage {
  final AddressPort addressPort;
  final bool open;

  ReceiveMessage({required this.addressPort, required this.open});
}
