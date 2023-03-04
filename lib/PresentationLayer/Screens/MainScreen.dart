import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_riverpod_app/Providers/NewsProvider.dart';

import '../../DataLayer/Models/NewsModel.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(newsStateNotifierProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            data.when(
              data: (data) => ListView.builder(
                itemCount: data.articles!.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) {
                  return NewsItem(data.articles![index]);
                }),
              ),
              error: (error, stackTrace) => Text("Error"),
              loading: () => Container(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Center(
              child: InkWell(
                  onTap: (() => ref.refresh(newsStateNotifierProvider)),
                  child: Text("MainScreen")),
            ),
          ],
        ),
      ),
    );
  }

  Widget NewsItem(Article item) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: (() => print(item.source!.name!)),
        child: Container(
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: Center(
            child: Row(
              children: [
                Expanded(
                    child: Container(
                        child: Text(
                  item.title!,
                  textAlign: TextAlign.right,
                ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
