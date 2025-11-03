import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Static Map with Checkpoints')),
      body: Stack(
        children: [
          Image.asset('assets/images/map.gif'),
          Positioned(
            top: 152,
            left: 200,
            child: IconButton(
              icon: Icon(Icons.location_on, color: Colors.red, size: 40),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => WebViewScreen(url: 'https://maps.google.com/'),
                //   ),
                // );
              },
            ),
          ),
          // Add more checkpoints as needed
        ],
      ),
    );
  }
}
//
// class WebViewScreen extends StatelessWidget {
//   final String url;
//
//   WebViewScreen({required this.url});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('WebView')),
//       body: WebView(
//         initialUrl: url,
//         javascriptMode: JavascriptMode.unrestricted,
//       ),
//     );
//   }
// }
