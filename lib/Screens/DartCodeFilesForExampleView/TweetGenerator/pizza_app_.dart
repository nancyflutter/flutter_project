import 'package:flutter/foundation.dart';
import 'package:flutter_project/Screens/DartCodeFilesForExampleView/TweetGenerator/Controller/pizza_app_controller_.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PizzaApp extends StatelessWidget {
  const PizzaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<PizzaController>(
      init: PizzaController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.grey[300],
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _topView(controller),
                _pizzaView(controller),
                _textView(controller),
                _buttonView(controller),
                _toppingCountView(controller),
                _toppingAddSelectionView(controller),
                _toppingView(context, controller),
                // _toppingAddAsPerPizzaType(controller),
              ],
            ),
          ),
        );
      },
    );
  }

  //--------------------------------- Widgets ------------------------------------//

  /// Top View --- Title And Description View
  Widget _topView(PizzaController controller) {
    return SizedBox(
      height: 70,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.thumb_up_alt_outlined,
            color: Colors.grey[600],
            size: 24,
          ),
        ),
        SizedBox(
          height: 50,
          width: 250,
          child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              controller: controller.pageControllerOne.value,
              itemCount: controller.pizzaDetails.length,
              itemBuilder: (context, index) {
                return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    child: Text(
                      controller.pizzaDetails[index].pizzaTitle ?? "",
                      style: const TextStyle(color: Colors.black, fontSize: 27),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      child: Text(
                        controller.pizzaDetails[index].pizzaDesc ?? "",
                        style: const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ),
                ]);
              }),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_basket_outlined,
            color: Colors.grey[600],
            size: 24,
          ),
        ),
      ]),
    );
  }

  /// Pizza View
  Widget _pizzaView(PizzaController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        height: 240,
        alignment: Alignment.center,
        child: LayoutBuilder(builder: (context, constraints) {
          controller.pizzaConstraints.value = constraints;
          controller.currentPageValue.refresh();
          return Stack(
            children: [
              Center(
                child: AnimatedContainer(
                  height: controller.pizzaSize.value,
                  duration: const Duration(milliseconds: 500),
                  child: Transform.rotate(
                    angle: controller.currentPageValue.value * 4,
                    child: Image.asset('assets/pizzas/plate_5.png'),
                  ),
                ),
              ),
              Center(
                child: AnimatedContainer(
                  height: controller.pizzaSize.value,
                  duration: const Duration(milliseconds: 500),
                  child: PageView.builder(
                    controller: controller.pageControllerTwo.value,
                    itemCount: controller.pizzaDetails.length,
                    onPageChanged: (value) {
                      print("value of pizza view-------------->> $value-------------------");
                      controller.currentPageValue.refresh();
                      controller.refreshToppings(value);
                    },
                    itemBuilder: (context, index) {
                      final parent = controller.currentPageValue.value - index;
                      return Padding(
                        padding: const EdgeInsets.all(4),
                        child: Transform.rotate(
                          angle: parent * 4,
                          child: Image.asset(
                            controller.pizzaDetails[index].pizzaImage ?? "",
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: controller.animationController,
                builder: (context, _) {
                  return Container(
                    child: controller.buildIngredientsShowWidget(),
                  );
                },
              ),
            ],
          );
        }),
      ),
    );
  }

  /// Text View
  Widget _textView(PizzaController controller) {
    return SizedBox(
      height: 50,
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: controller.textPageController.value,
        itemCount: controller.pizzaDetails.length,
        itemBuilder: (context, index) {
          controller.pizzaPrice = controller.pizzaDetails[index].pizzaPriceM ?? 0;
          controller.pizzaPriceS = controller.pizzaDetails[index].pizzaPriceS ?? 0;
          controller.pizzaPriceM = controller.pizzaDetails[index].pizzaPriceM ?? 0;
          controller.pizzaPriceL = controller.pizzaDetails[index].pizzaPriceL ?? 0;
          controller.total = (controller.pizzaPrice).toInt() + (controller.toppingsPrice).toInt();

          for (var element in controller.sizePizza) {
            if (element.isSelected!) {
              if (element.sizeTitle == "S") {
                controller.total = controller.pizzaPriceS.toInt() + controller.toppingsPrice.toInt();
              } else if (element.sizeTitle == "M") {
                controller.total = controller.pizzaPriceM.toInt() + controller.toppingsPrice.toInt();
              } else {
                controller.total = controller.pizzaPriceL.toInt() + controller.toppingsPrice.toInt();
              }
            }
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "\$${controller.total}",
                style: const TextStyle(color: Colors.black, fontSize: 31, fontWeight: FontWeight.bold),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Buttons View
  Widget _buttonView(PizzaController controller) {
    return Container(
      height: 40,
      width: 210,
      alignment: Alignment.center,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.sizePizza.length,
        itemBuilder: (context, index) {
          var isSelected = controller.sizePizza[index].isSelected;
          var title = controller.sizePizza[index].sizeTitle;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                for (var element in controller.sizePizza) {
                  element.isSelected = element.sizeTitle == title;

                  if (element.isSelected == true) {
                    controller.pizzaSize.value = element.sizeTitle == "S"
                        ? controller.pizzaSizeS
                        : element.sizeTitle == "M"
                        ? controller.pizzaSizeM
                        : controller.pizzaSizeL;
                  }
                }
                controller.pizzaSize.refresh();
                controller.sizePizza.refresh();
              },
              behavior: HitTestBehavior.opaque,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: isSelected == false ? Colors.grey[300] : Colors.orange[300],
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[350]!,
                      offset: const Offset(0, 3),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    title ?? "",
                    style: TextStyle(
                      color: isSelected == false ? Colors.grey[500] : Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Topping Count View
  Widget _toppingCountView(PizzaController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        "${controller.counter}/3",
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
      ),
    );
  }

  /// ToppingAdd And Selection View
  Widget _toppingAddSelectionView(PizzaController controller) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      reverse: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                print("TopLeftcurrentPageValue---> ${controller.currentPageValue}");
                print("currentToppingSource---> ${currentToppingSource.name}");

                controller.addToppingOnLeft = true;
                controller.addToppingOnRight = false;
                controller.addToppingOnTop = false;
                controller.addToppingOnBottom = false;
                controller.addToppingOnDefault = false;
                controller.toppingDetailsList.assignAll(controller.toppingDataListOnLeft);
              },
              child: CircleAvatar(
                maxRadius: 25,
                backgroundColor: controller.addToppingOnLeft ? Colors.orange[300] : Colors.grey[300],
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, right: 5, left: 5, bottom: 8),
                  child: SvgPicture.asset("assets/svg_icons/pizza_one.svg", fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                print("TopRightcurrentPageValue---> ${controller.currentPageValue}");
                print("currentToppingSource---> ${currentToppingSource.name}");
                controller.addToppingOnLeft = false;
                controller.addToppingOnRight = true;
                controller.addToppingOnTop = false;
                controller.addToppingOnBottom = false;
                controller.addToppingOnDefault = false;
                controller.toppingDetailsList.assignAll(controller.toppingDataListOnRight);
              },
              child: CircleAvatar(
                maxRadius: 25,
                backgroundColor: controller.addToppingOnRight ? Colors.orange[300] : Colors.grey[300],
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, right: 5, left: 6, bottom: 8),
                  child: SvgPicture.asset("assets/svg_icons/pizza_two.svg", fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                print("BottomLeftcurrentPageValue---> ${controller.currentPageValue}");
                print("currentToppingSource---> ${currentToppingSource.name}");
                controller.addToppingOnLeft = false;
                controller.addToppingOnRight = false;
                controller.addToppingOnTop = false;
                controller.addToppingOnBottom = true;
                controller.addToppingOnDefault = false;
                controller.toppingDetailsList.assignAll(controller.toppingDataListOnBottom);
              },
              child: CircleAvatar(
                maxRadius: 25,
                backgroundColor: controller.addToppingOnBottom ? Colors.orange[300] : Colors.grey[300],
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0, right: 4, left: 4, top: 12),
                  child: SvgPicture.asset("assets/svg_icons/pizza_four.svg", fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                print("BottomRightCurrentPageValue---> ${controller.currentPageValue}");
                print("currentToppingSource---> ${currentToppingSource.name}");
                controller.addToppingOnLeft = false;
                controller.addToppingOnRight = false;
                controller.addToppingOnTop = true;
                controller.addToppingOnBottom = false;
                controller.addToppingOnDefault = false;
                controller.toppingDetailsList.assignAll(controller.toppingDataListOnTop);
              },
              child: CircleAvatar(
                maxRadius: 25,
                backgroundColor: controller.addToppingOnTop ? Colors.orange[300] : Colors.grey[300],
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0, right: 5, left: 6, top: 12),
                  child: SvgPicture.asset("assets/svg_icons/pizza_three.svg", fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                print("DefaultcurrentPageValue---> ${controller.currentPageValue}");
                print("currentToppingSource---> ${currentToppingSource.name}");
                controller.addToppingOnLeft = false;
                controller.addToppingOnRight = false;
                controller.addToppingOnTop = false;
                controller.addToppingOnBottom = false;
                controller.addToppingOnDefault = true;
                currentToppingSource = ToppingSource.Default;
                controller.refreshToppings(0);
                // controller.toppingDetailsList.assignAll(controller.toppingDetailsListDefault);
              },
              child: CircleAvatar(
                maxRadius: 25,
                backgroundColor: controller.addToppingOnDefault ? Colors.orange[300] : Colors.grey[300],
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 6, right: 5, left: 6, top: 4.5),
                  child: SvgPicture.asset("assets/svg_icons/default.svg", fit: BoxFit.contain),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Topping View
  Widget _toppingView(BuildContext context, PizzaController controller) {
    return Flexible(
      child: SizedBox(
        height: 180,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 0,
                    blurRadius: 0,
                    offset: const Offset(0, 3),
                  ),
                ],
                color: Colors.grey[300],
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                    MediaQuery
                        .of(context)
                        .size
                        .width,
                    220.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: controller.pageControllerThree.value,
                scrollDirection: Axis.horizontal,
                // itemCount: controller.toppingDetailsList.length,
                itemCount: controller.toppingDetailsListDefault.length,
                itemBuilder: (context, index) {
                  final ingredient = controller.toppingDetailsListDefault[index];
                  // final ingredient = controller.toppingDetailsList[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: ingredient.tapped == false
                          ? () {
                        if (controller.counter < 3) {
                          if (kDebugMode) {
                            print("object---> ${ingredient.image}");
                          }
                          controller.toppingList.add(ingredient);
                          ingredient.tapped = true;
                          controller.toppingsPrice++;
                          controller.counter++;
                          controller.toppingAddOnPizza();
                          controller.animationController.forward(from: 0.0);
                        } else {
                          Get.snackbar(
                            'warning:',
                            'You can select up to three toppings.',
                            duration: const Duration(seconds: 3),
                            onTap: (snack) {
                              if (kDebugMode) {
                                print('Snack-bar tapped');
                              }
                            },
                          );
                          controller.animationController.stop();
                        }
                      }
                          : ingredient.tapped == true
                          ? () {
                        if (controller.counter < 4) {
                          controller.toppingList.remove(ingredient);
                          ingredient.tapped = false;
                          controller.toppingsPrice--;
                          controller.counter--;
                        }
                      }
                          : null,
                      child: Image.asset(
                        ingredient.image,
                        color: ingredient.tapped == false ? null : Colors.grey[300]!.withOpacity(0.5),
                        colorBlendMode: ingredient.tapped == false ? null : BlendMode.lighten,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}