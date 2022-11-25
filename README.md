# Simple Streams client for Dart

[![pub](https://img.shields.io/pub/v/simplestreams.svg)](https://pub.dev/packages/simplestreams)
[![license: MPL](https://img.shields.io/badge/license-MPL-magenta.svg)](https://opensource.org/licenses/MPL-2.0)
[![CI](https://github.com/canonical/simplestreams.dart/actions/workflows/ci.yaml/badge.svg)](https://github.com/canonical/simplestreams.dart/actions/workflows/ci.yaml)
[![codecov](https://codecov.io/gh/canonical/simplestreams.dart/branch/main/graph/badge.svg?token=GQ7hEKjqdf)](https://codecov.io/gh/canonical/simplestreams.dart)

[Simple Streams](https://launchpad.net/simplestreams/) describe streams of like
items in a structural fashion. A client provides a way to sync or act on changes
in a remote stream.

```dart
import 'package:simplestreams/simplestreams.dart';

Future<void> main() async {
  final client = SimpleStreamClient('https://images.linuxcontainers.org');

  final stream = await client.getStream();

  for (final index in stream.index.entries) {
    final url = Uri.tryParse(client.url)?.resolve(index.value.path);
    print(url ?? index.value.path);

    final products = await client.getProducts(index.value);
    for (final key in products.products.keys) {
      print('\t- $key');
    }
  }

  client.close();
}
```
