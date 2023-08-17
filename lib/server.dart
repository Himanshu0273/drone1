import 'dart:io';

void mainServer() async {
  const port = 3000; // Use the port number you want to listen on
  final server = await HttpServer.bind(InternetAddress.anyIPv4, port);

  print('Server listening on port $port');

  await for (HttpRequest request in server) {
    // Handle incoming requests
    print('Received request from ${request.connectionInfo?.remoteAddress}');
    request.response.write('Hello from the server!');
    await request.response.close();
  }
}
