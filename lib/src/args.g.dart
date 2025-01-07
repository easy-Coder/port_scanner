// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'args.dart';

// **************************************************************************
// CliGenerator
// **************************************************************************

T _$badNumberFormat<T extends num>(
  String source,
  String type,
  String argName,
) =>
    throw FormatException(
      'Cannot parse "$source" into `$type` for option "$argName".',
    );

Args _$parseArgsResult(ArgResults result) => Args(
      result['ip-addr'] as String,
      int.tryParse(result['start'] as String) ??
          _$badNumberFormat(
            result['start'] as String,
            'int',
            'start',
          ),
      int.tryParse(result['end'] as String) ??
          _$badNumberFormat(
            result['end'] as String,
            'int',
            'end',
          ),
      result['help'] as bool,
    );

ArgParser _$populateArgsParser(ArgParser parser) => parser
  ..addOption(
    'ip-addr',
    abbr: 'a',
    help: 'IP address to scan',
    defaultsTo: '127.0.0.1',
  )
  ..addOption(
    'start',
    abbr: 's',
    help: 'Port start range',
    defaultsTo: '1',
  )
  ..addOption(
    'end',
    abbr: 'e',
    help: 'Port end range',
    defaultsTo: '1024',
  )
  ..addFlag(
    'help',
    abbr: 'h',
    help: 'Prints usage information.',
    negatable: false,
  );

final _$parserForArgs = _$populateArgsParser(ArgParser());

Args parseArgs(List<String> args) {
  final result = _$parserForArgs.parse(args);
  return _$parseArgsResult(result);
}
