import 'package:flutter/material.dart';
import 'package:flutter_project/Commons/CommonWidgets/common_backdrop_scaffold.dart';
import 'package:flutter_project/Commons/CommonWidgets/common_sliver_appbar_.dart';
import 'package:flutter_project/Controllers/home_controller.dart';
import 'package:flutter_project/Pages/Home_View/Widgets/widgets_details_view.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackDropScaffold(
      appBarBackgroundColor: Get.theme.primaryColor,
      backLayer: const Center(),
      frontLayer: CustomScrollView(
        slivers: [
          const CommonSliverAppBar(
            title: Text(
              "Widgets",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          _sliverListView(),
        ],
      ),
    );
  }

  Widget _sliverListView() {
    return Obx(
      () => SliverList(
        delegate: SliverChildBuilderDelegate(
          addRepaintBoundaries: true,
          childCount: controller.searchWidgets.value.length,
          (_, index) {
            final data = controller.searchWidgets.value[index];
            return Card(
              elevation: 0,
              child: ListTile(
                title: Row(
                  children: [
                    Text(
                      "${index + 1}.",
                      style: const TextStyle(color: Colors.blue, fontSize: 10),
                    ),
                    Text(
                      " ${data.title}",
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis, fontSize: 15),
                    ),
                  ],
                ),
                trailing: Wrap(
                  children: [
                    Obx(
                      () => IconButton(
                        onPressed: () {
                          if (data.isFavorite.value == false) {
                            controller.addItem(data.id!);
                          } else {
                            controller.removeItem(data.id!);
                          }
                        },
                        icon: Icon(
                          data.isFavorite.value == false
                              ? Icons.favorite_border_outlined
                              : Icons.favorite,
                          color: data.isFavorite.value == false
                              ? Colors.grey
                              : Colors.red,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(
                          () => WidgetDetailScreen(
                            widgetName: "${data.details}",
                            title: "${data.title}",
                            codeFilePath: "${data.codeFilePath}",
                            screenName: data.screenName,
                            details: "${data.details}",
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Get.to(
                    () => WidgetDetailScreen(
                      widgetName: "${data.details}",
                      title: "${data.title}",
                      codeFilePath: "${data.codeFilePath}",
                      screenName: data.screenName,
                      details: "${data.details}",
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
