import 'dart:io';
import 'dart:isolate';

import 'package:port_scanner/src/message.dart';

Future<void> __connectPort(SendMessage message) async {
  final ipAddr = message.addressPort;
  final sendPort = message.port;
  try {
    final socket = await Socket.connect(ipAddr.addr, ipAddr.port);
    await socket.close();
    sendPort.send(ReceiveMessage(addressPort: ipAddr, open: true));
  } catch (error) {
    sendPort.send(ReceiveMessage(addressPort: ipAddr, open: false));
  }
}

Future<int> scanPorts(InternetAddress ipAddr, int start, int end) async {
  final ReceivePort receivePort = ReceivePort();
  final isolates = <Isolate>[];
  int noOfPortScanned = start;
  int noOfOpenPort = 0;
  for (var i = start; i < end; i++) {
    print('?${ipAddr.address}:$i');
    final isolate = await Isolate.spawn(
      __connectPort,
      SendMessage(
          addressPort: (addr: ipAddr, port: i), port: receivePort.sendPort),
    );
    isolates.add(isolate);
  }

  await for (final ReceiveMessage message in receivePort) {
    noOfPortScanned++;

    if (message.open) {
      noOfOpenPort++;
      print('=${message.addressPort.addr.address}:${message.addressPort.port}');
    }

    if (noOfPortScanned == end) {
      receivePort.close();
      for (final isolate in isolates) {
        isolate.kill();
      }
      break;
    }
  }

  return noOfOpenPort;
}
