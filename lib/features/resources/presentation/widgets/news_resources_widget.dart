import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsResources extends StatefulWidget {
  @override
  _NewsResourcesState createState() => _NewsResourcesState();
}

class _NewsResourcesState extends State<NewsResources> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
        // children: <Widget>[
        //   WebView(
        //     initialUrl: 'https://rhema.eu/index.php/right-now/news',
        //     javascriptMode: JavascriptMode.unrestricted,
        //     onPageFinished: (String url) {
        //       setState(() {
        //         _isLoading = false;
        //       });
        //     },
        //   ),
        //   _isLoading
        //       ? const Center(
        //           child: CircularProgressIndicator(
        //             color: Color(0xFFBE0027),
        //           ),
        //         )
        //       : Container(),
        // ],
        );
  }
}
