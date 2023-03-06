import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_riverpod_app/Providers/NewsProvider.dart';

import '../../DataLayer/Models/NewsModel.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<NewsModel> data = ref.watch(controllerNewsProvider);
    // ref.listen(controllerNewsProvider, (prev, next) {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(const SnackBar(content: Text('yoyo')));
    // });
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            data.when(
              data: (data) => ListView.builder(
                itemCount: data.articles.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) {
                  return newsItem(data.articles[index]);

                  //  Row(
                  //   children: [
                  //     // IconButton(
                  //     //   icon: const Icon(Icons.remove),
                  //     //   onPressed: () {
                  //     //     ref
                  //     //         .read(controllerNewsProvider.notifier)
                  //     //         .removeItem(index);
                  //     //   },
                  //     // ),
                  //     newsItem(data.articles[index]),
                  //   ],
                  // );
                }),
              ),
              error: (error, stackTrace) => SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(child: Text("Error"))),
              loading: () {
                print("Loading");
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
            Center(
              child: InkWell(
                  onTap: (() =>
                      ref.read(controllerNewsProvider.notifier).getData()),
                  child: const Text("MainScreen")),
            ),
          ],
        ),
      ),
    );
  }

  Widget newsItem(Article item) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: (() => debugPrint(item.source.name)),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: Center(
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  item.title,
                  textAlign: TextAlign.right,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
