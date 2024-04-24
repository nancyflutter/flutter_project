import 'package:flutter/material.dart';
import 'package:flutter_project/Commons/CommonWidgets/common_backdrop_scaffold.dart';
import 'package:flutter_project/Commons/CommonWidgets/common_sliver_appbar_.dart';
import 'package:flutter_project/Commons/CommonWidgets/common_speed_dial_floating_button.dart';
import 'package:flutter_project/Controllers/home_controller.dart';
import 'package:flutter_project/Pages/Home_View/Widgets/widgets_details_view.dart';
import 'package:get/get.dart';

class WishListScreen extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CommonBackDropScaffold(
        appBarBackgroundColor: Get.theme.primaryColor,
        backLayer: const Center(),
        frontLayer: CustomScrollView(
          slivers: [
            _appBarView(),
            _sliverListView(),
          ],
        ),
        floatingActionButton: _floatingButtonView(),
      ),
    );
  }

  Widget _appBarView() {
    return CommonSliverAppBar(
      backgroundImage: Padding(
        padding: const EdgeInsets.only(bottom: 2.0),
        child:
            Image.asset("assets/animation/water_waves.gif", fit: BoxFit.fill),
      ),
      title: const Text(
        "Wish List",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _sliverListView() {
    return Obx(
      () => SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: controller.wishListItems.length,
          addRepaintBoundaries: true,
          (_, index) {
            final data = controller.wishListItems[index];
            return ListTile(
              title: Row(
                children: [
                  Text(
                    "${index + 1}.",
                    style: const TextStyle(color: Colors.blue, fontSize: 10),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text("${data.title}",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              trailing: Wrap(
                children: [
                  IconButton(
                    onPressed: () {
                      data.isFavorite.value = false;
                      controller.removeItem(data.id!);
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
                  IconButton(
                    onPressed: () {
                      Get.to(
                        () => WidgetDetailScreen(
                          widgetName: "${data.details}",
                          title: "${data.title}",
                          codeFilePath: "${data.codeFilePath}",
                          screenName: data.screenName,
                          details: "${data.details}",
                          // child: data.child,
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
                    // child: data.child,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _floatingButtonView() {
    return CommonSpeedDialFloatingButton(
      onTapChildThree: () {
        Get.back();
      },
    );
  }
}
