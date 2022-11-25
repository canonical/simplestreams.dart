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
