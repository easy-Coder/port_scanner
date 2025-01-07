import 'dart:io';
import 'dart:isolate';
import 'package:port_scanner/port_scanner.dart' as port_scanner;
import 'package:port_scanner/src/args.dart';
import 'package:port_scanner/src/message.dart';

void main(List<String> args) async {
  final result = parseArgs(args);

  if (result.help) {
    _printUsage();
    exit(0);
  }

  if (result.start < 0) {
    print('Error: Start port must be non-negative');
    print('');
    _printUsage();
    exit(2);
  }

  if (result.end < result.start) {
    print('Error: End port must be greater than or equal to start port');
    print('');
    _printUsage();
    exit(2);
  }

  final addr = InternetAddress.tryParse(result.ipAddr);
  if (addr == null) {
    print('Error: Invalid Address format (127.0.0.1)');
    print('');
    _printUsage();
    exit(2);
  }

  final noOfOpenPort =
      await port_scanner.scanPorts(addr, result.start, result.end);

  final totalPort = result.end - result.start;
  print('');
  print("---------------------------------------");
  print('');
  print(
      "Total Port Scanned: $totalPort | Open=$noOfOpenPort | Closed=${totalPort - noOfOpenPort}");
  print('');
  print("---------------------------------------");
}

void _printUsage() {
  print('''
A command line utility for scanning port.

Usage: port_scanner [<args>]

Arguments:
${parser.usage}
''');
}
