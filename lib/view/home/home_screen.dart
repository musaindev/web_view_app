import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../const/const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _loadingPercentage = 0;
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('http://youtube.com'));

  @override
  void initState() {
    controller.setNavigationDelegate(NavigationDelegate(onPageStarted: (text) {
      setState(() {
        _loadingPercentage = 0;
      });
    }, onProgress: (progress) {
      setState(() {
        _loadingPercentage = progress;
      });
    }, onPageFinished: (url) {
      setState(() {
        _loadingPercentage = 100;
      });
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: bgWhite,
            ),
          ),
          centerTitle: false,
          title: Text(
            "YouTube",
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          actions: [
            IconButton(
                onPressed: () {
                  controller.goBack();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: bgWhite,
                )),
            IconButton(
                onPressed: () {
                  controller.goForward();
                },
                icon: const Icon(
                  Icons.arrow_forward_rounded,
                  color: bgWhite,
                )),
            IconButton(
                onPressed: () {
                  controller.reload();
                },
                icon: const Icon(
                  Icons.refresh,
                  color: bgWhite,
                ))
          ],
        ),
        body: Stack(
          children: [
            WebViewWidget(
              controller: controller,
              layoutDirection: TextDirection.rtl,
            ),
            if (_loadingPercentage < 100)
              LinearProgressIndicator(
                valueColor: const AlwaysStoppedAnimation(Colors.blue),
                backgroundColor: Colors.green[200],
                borderRadius: BorderRadius.circular(5),
                value: _loadingPercentage / 100,
              )
          ],
        ));
  }
}
