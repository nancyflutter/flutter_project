import 'package:flutter/material.dart';
import 'package:flutter_project/Commons/CommonWidgets/common_backdrop_scaffold.dart';
import 'package:flutter_project/Commons/CommonWidgets/common_sliver_appbar_.dart';
import 'package:flutter_project/Controllers/example_controller.dart';
import 'package:flutter_project/Pages/ExampleView/Widgets/example_details_view.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';

class ExamplesView extends GetView<ExampleController> {
  const ExamplesView({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackDropScaffold(
      appBarBackgroundColor: Get.theme.primaryColor,
      backLayer: const Center(),
      frontLayer: CustomScrollView(
        slivers: [
          CommonSliverAppBar(
            backgroundImage: Image.asset(
              // "assets/animation/gif.gif",
              "assets/animation/animation.gif",
            ),
          ),
          _exampleSliverListView(),
        ],
      ),
    );
  }

  /// ExampleSliverListView
  Widget _exampleSliverListView() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: controller.exampleList.length,
        (_, index) {
          final data = controller.exampleList[index];
          return Card(
            elevation: 5,
            child: ExpansionTile(
              onExpansionChanged: (newExpanded) {
                controller.expanded = newExpanded;
              },
              // initiallyExpanded: true,
              controlAffinity: ListTileControlAffinity.trailing,
              textColor: Get.theme.primaryColor,
              iconColor: Get.theme.primaryColor,
              clipBehavior: Clip.antiAlias,
              childrenPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              expandedCrossAxisAlignment: CrossAxisAlignment.end,
              maintainState: true,
              title: Text(
                "${data.title}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              children: [
                SizedBox(
                  height: Get.height * (0.074 * data.designList.length),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.designList.length,
                    itemBuilder: (_, index) {
                      final detailData = data.designList[index];
                      return ListTile(
                        onTap: () {
                          Get.to(
                            () => ExampleDetailsScreen(
                              title: '${detailData.title}',
                              codeFilePath: '${detailData.codeFile}',
                              screenName: detailData.screenName,
                            ),
                          );
                        },
                        title: Text("${detailData.title}"),
                        trailing: IconButton(
                          onPressed: () {
                            Get.to(
                              () => ExampleDetailsScreen(
                                title: '${detailData.title}',
                                codeFilePath: '${detailData.codeFile}',
                                screenName: detailData.screenName,
                              ),
                            );
                          },
                          icon: const Icon(Icons.keyboard_arrow_right),
                        ),
                      );
                    },
                  ),
                ),
                const Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
