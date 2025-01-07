# A Simple Port Scanner Implementation in Dart

I have been thinking about implementing a port scanner for a while. I just wanted to know how it works and learn at the same time.

## Things I Learned

- Dart Isolate
- Networking in Dart

## How to run program

### Compile Program

``` shell
$ dart compile exe bin/port_scanner.dart -o target/port_scanner
```

### Run Program

```shell
$ ./port_scanner -h

A command line utility for scanning port.

Usage: port_scanner [<args>]

Arguments:
-a, --ip-addr    IP address to scan
                 (defaults to "127.0.0.1")
-s, --start      Port start range
                 (defaults to "1")
-e, --end        Port end range
                 (defaults to "1024")
-h, --help       Prints usage information.

```

