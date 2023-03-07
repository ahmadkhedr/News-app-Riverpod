import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_riverpod_app/Providers/NewsProvider.dart';

import '../../DataLayer/Models/NewsModel.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<NewsModel> data = ref.watch(getNewsProvider);
    List<Article> dataList = ref.watch(controllerNewsProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            data.when(
              data: (data) => ListView.builder(
                itemCount: dataList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Center(
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () => ref
                                  .read(controllerNewsProvider.notifier)
                                  .removeItem(dataList[index]),
                            ),
                            Expanded(
                                child: Text(
                              dataList[index].title,
                              textAlign: TextAlign.right,
                            )),
                          ],
                        ),
                      ),
                    ),
                  );
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
                  onTap: (() => ref.read(getNewsProvider)),
                  child: const Text("MainScreen")),
            ),
          ],
        ),
      ),
    );
  }

  Widget newsItem(Article item, WidgetRef ref) {
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
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => ref
                      .read(controllerNewsProvider.notifier)
                      .removeItem(item),
                ),
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
