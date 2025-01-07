import 'dart:io';

import 'package:build_cli_annotations/build_cli_annotations.dart';

part 'args.g.dart';

/// The command line argument parser generated by the `build_cli_annotations`
/// package.
ArgParser get parser => _$populateArgsParser(ArgParser(usageLineLength: 80));

@CliOptions()
class Args {
  @CliOption(
    abbr: 'a',
    help: 'IP address to scan',
    defaultsTo: '127.0.0.1',
  )
  final String ipAddr;

  @CliOption(
    abbr: 's',
    help: 'Port start range',
    defaultsTo: 1,
  )
  final int start;

  @CliOption(
    abbr: 'e',
    help: 'Port end range',
    defaultsTo: 1024,
  )
  final int end;

  @CliOption(abbr: 'h', negatable: false, help: 'Prints usage information.')
  final bool help;

  Args(this.ipAddr, this.start, this.end, this.help);
}
