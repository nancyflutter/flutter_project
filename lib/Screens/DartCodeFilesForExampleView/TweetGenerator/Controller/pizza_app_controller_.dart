import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PizzaController extends GetxController with GetSingleTickerProviderStateMixin {
  bool addToppingOnLeft = false;
  bool addToppingOnRight = false;
  bool addToppingOnTop = false;
  bool addToppingOnBottom = false;
  bool addToppingOnDefault = false;

  RxList<Pizza> pizzaDetails = RxList<Pizza>([
    Pizza(
      pizzaTitle: "Greek",
      pizzaDesc: "feta cheese, black olives, red onion",
      pizzaImage: 'assets/pizzas/pizza1.png',
      pizzaPriceS: 8,
      pizzaPriceM: 11,
      pizzaPriceL: 13,
    ),
    Pizza(
      pizzaTitle: "Neapolitan",
      pizzaDesc: "mushrooms, tomatoes, oregano",
      pizzaImage: 'assets/pizzas/pizza2.png',
      pizzaPriceS: 7,
      pizzaPriceM: 10,
      pizzaPriceL: 12,
    ),
    Pizza(
      pizzaTitle: "Chicago",
      pizzaDesc: "mushrooms, tomatoes, onion",
      pizzaImage: 'assets/pizzas/pizza3.png',
      pizzaPriceS: 8,
      pizzaPriceM: 11,
      pizzaPriceL: 13,
    ),
  ]);

  RxList<SizePizza> sizePizza = RxList([
    SizePizza(sizeTitle: "S", isSelected: true),
    SizePizza(sizeTitle: "M", isSelected: false),
    SizePizza(sizeTitle: "L", isSelected: false),
  ]);

  late List<Toppings> toppingListToShow;

  /// TopLeft Add Topping
  RxList<Toppings> toppingDataListOnLeft = RxList<Toppings>([
    Toppings(
      'assets/toppings/cheese.png',
      <Offset>[
        // //-------One-------
        const Offset(0.5, 0.22),
        const Offset(0.58, 0.37),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/olives.png',
      <Offset>[
        // //-------One------
        const Offset(0.6, 0.2),
        const Offset(0.5, 0.38),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/mushrooms.png',
      <Offset>[
        // //------One------
        const Offset(0.64, 0.25),
        const Offset(0.47, 0.42),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/onion.png',
      <Offset>[
        // //------One-------
        const Offset(0.6, 0.14),
        const Offset(0.62, 0.28),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/tomatos.png',
      <Offset>[
        // //-------bottom--------
        const Offset(0.55, 0.30),
        const Offset(0.62, 0.16),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/oregano.png',
      <Offset>[
        // //-------bottom--------
        const Offset(0.4, 0.35),
        const Offset(0.6, 0.4),
      ],
      false,
    ),
  ]);

  /// TopRight Add Topping
  RxList<Toppings> toppingDataListOnRight = RxList<Toppings>([
    Toppings(
      'assets/toppings/cheese.png',
      <Offset>[
        const Offset(0.95, 0.3),
        const Offset(0.75, 0.15),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/olives.png',
      <Offset>[
        // //-------Two-------
        const Offset(0.8, 0.18),
        const Offset(0.87, 0.33),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/mushrooms.png',
      <Offset>[
        // //-------Two--------
        const Offset(0.8, 0.28),
        const Offset(0.9, 0.4),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/onion.png',
      <Offset>[
        // //------Two-------
        const Offset(0.72, 0.15),
        const Offset(0.74, 0.4),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/tomatos.png',
      <Offset>[
        // //-------Two-------
        const Offset(0.75, 0.33),
        const Offset(0.99, 0.3),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/oregano.png',
      <Offset>[
        // //-------Two--------
        const Offset(0.77, 0.26),
        const Offset(0.85, 0.4),
      ],
      false,
    ),
  ]);

  /// BottomLeft Add Topping
  RxList<Toppings> toppingDataListOnBottom = RxList<Toppings>([
    Toppings(
      'assets/toppings/cheese.png',
      <Offset>[
        // //------- Three --------
        const Offset(0.54, 0.65),
        const Offset(0.67, 0.5),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/olives.png',
      <Offset>[
        // //------ Three ------
        const Offset(0.6, 0.5),
        const Offset(0.5, 0.62),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/mushrooms.png',
      <Offset>[
        // //------- Three -------
        const Offset(0.57, 0.5),
        const Offset(0.62, 0.7),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/onion.png',
      <Offset>[
        // //------Three-------
        const Offset(0.42, 0.5),
        const Offset(0.6, 0.6),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/tomatos.png',
      <Offset>[
        // //------Three-------
        const Offset(0.55, 0.52),
        const Offset(0.7, 0.69),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/oregano.png',
      <Offset>[
        // //------- Three --------
        const Offset(0.45, 0.5),
        const Offset(0.68, 0.6),
      ],
      false,
    ),
  ]);

  /// BottomRight Add Topping
  RxList<Toppings> toppingDataListOnTop = RxList<Toppings>([
    Toppings(
      'assets/toppings/cheese.png',
      <Offset>[
        // //------------Four-----------
        const Offset(0.9, 0.48),
        const Offset(0.8, 0.7),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/olives.png',
      <Offset>[
        // //------------Four-----------
        const Offset(0.8, 0.6),
        const Offset(0.9, 0.5),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/mushrooms.png',
      <Offset>[
        // //------------Four-----------
        const Offset(0.99, 0.62),
        const Offset(0.8, 0.52),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/onion.png',
      <Offset>[
        // //------------Four-----------
        const Offset(0.77, 0.62),
        const Offset(0.9, 0.46),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/tomatos.png',
      <Offset>[
        // //------------Four-----------
        const Offset(0.8, 0.55),
        const Offset(0.9, 0.65),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/oregano.png',
      <Offset>[
        // //------------Four-----------
        const Offset(0.75, 0.47),
        const Offset(0.98, 0.52),
      ],
      false,
    ),
  ]);

  /// Default List
  RxList<Toppings> toppingDetailsListDefault = RxList<Toppings>([
    // --------- randomly -- Original -----------//
    Toppings(
      'assets/toppings/cheese.png',
      <Offset>[
        const Offset(0.5, 0.3),
        const Offset(0.6, 0.65),
        const Offset(0.7, 0.15),
        const Offset(0.9, 0.55),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/olives.png',
      <Offset>[
        const Offset(0.6, 0.2),
        const Offset(0.5, 0.4),
        const Offset(0.7, 0.25),
        const Offset(0.9, 0.50),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/mushrooms.png',
      <Offset>[
        const Offset(0.8, 0.15),
        const Offset(0.6, 0.45),
        const Offset(0.7, 0.2),
        const Offset(0.8, 0.55),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/onion.png',
      <Offset>[
        const Offset(0.6, 0.15),
        const Offset(0.6, 0.45),
        const Offset(0.9, 0.2),
        const Offset(0.8, 0.55),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/tomatos.png',
      <Offset>[
        const Offset(0.6, 0.2),
        const Offset(0.5, 0.4),
        const Offset(0.7, 0.25),
        const Offset(0.9, 0.50),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/oregano.png',
      <Offset>[
        const Offset(0.8, 0.15),
        const Offset(0.6, 0.45),
        const Offset(0.7, 0.2),
        const Offset(0.8, 0.55),
      ],
      false,
    ),
  ]);


  /// Greek Pizza Add Topping -- cheese, olives and onion
  RxList<Toppings> greekPizza = RxList<Toppings>([
    Toppings(
      'assets/toppings/cheese.png',
      <Offset>[
        const Offset(0.8, 0.15),
        const Offset(0.6, 0.45),
        const Offset(0.7, 0.2),
        const Offset(0.8, 0.55),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/olives.png',
      <Offset>[
        const Offset(0.6, 0.2),
        const Offset(0.5, 0.4),
        const Offset(0.7, 0.25),
        const Offset(0.9, 0.50),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/onion.png',
      <Offset>[
        const Offset(0.5, 0.3),
        const Offset(0.6, 0.65),
        const Offset(0.7, 0.15),
        const Offset(0.9, 0.55),
      ],
      false,
    ),
  ]);

  /// NeapolitanPizza Pizza Add Topping -- mushrooms, tomatoes, oregano
  RxList<Toppings> neapolitanPizza = RxList<Toppings>([
    Toppings(
      'assets/toppings/mushrooms.png',
      <Offset>[
        const Offset(0.8, 0.15),
        const Offset(0.6, 0.45),
        const Offset(0.7, 0.2),
        const Offset(0.8, 0.55),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/tomatos.png',
      <Offset>[
        const Offset(0.6, 0.2),
        const Offset(0.5, 0.4),
        const Offset(0.7, 0.25),
        const Offset(0.9, 0.50),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/oregano.png',
      <Offset>[
        const Offset(0.5, 0.3),
        const Offset(0.6, 0.65),
        const Offset(0.7, 0.15),
        const Offset(0.9, 0.55),
      ],
      false,
    ),
  ]);

  /// ChicagoPizza Pizza Add Topping -- mushrooms, tomatoes, onion
  RxList<Toppings> chicagoPizza = RxList<Toppings>([
    Toppings(
      'assets/toppings/mushrooms.png',
      <Offset>[
        const Offset(0.8, 0.15),
        const Offset(0.6, 0.45),
        const Offset(0.7, 0.2),
        const Offset(0.8, 0.55),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/tomatos.png',
      <Offset>[
        const Offset(0.6, 0.2),
        const Offset(0.5, 0.4),
        const Offset(0.7, 0.25),
        const Offset(0.9, 0.50),
      ],
      false,
    ),
    Toppings(
      'assets/toppings/onion.png',
      <Offset>[
        const Offset(0.5, 0.3),
        const Offset(0.6, 0.65),
        const Offset(0.7, 0.15),
        const Offset(0.9, 0.55),
      ],
      false,
    ),
  ]);

  /// For Selection View --- Final Empty List For Select Position
  RxList<Toppings> toppingDetailsList = RxList<Toppings>([]);

  /// For Topping View -- Final Empty List For Select Position
  RxList<Toppings> toppingList = RxList<Toppings>([]);

  /// Animation Controller and Page Controller
  late AnimationController animationController;
  final List<Animation> animationList = <Animation>[];

  late Rx<BoxConstraints> pizzaConstraints = Rx<BoxConstraints>(const BoxConstraints());
  late Rx<PageController> pageControllerTwo = Rx<PageController>(PageController(viewportFraction: 1.0));
  late Rx<PageController> pageControllerOne = Rx<PageController>(PageController(initialPage: 0, viewportFraction: 1.1));
  late Rx<PageController> textPageController = Rx<PageController>(PageController(initialPage: 0, viewportFraction: 1.1));
  late Rx<PageController> pageControllerThree = Rx<PageController>(PageController(viewportFraction: 0.3));

  /// Counter And Current Page Index Value
  RxDouble currentPageValue = RxDouble(0.0);
  RxDouble currentPage = RxDouble(0.0);
  RxInt counter = RxInt(0);

  /// For Pizza Size
  RxDouble pizzaSize = RxDouble(195);
  double pizzaSizeS = 195;
  double pizzaSizeM = 215;
  double pizzaSizeL = 240;

  late int total, pizzaPrice, pizzaPriceS, pizzaPriceM, pizzaPriceL;

  /// For Pizza Price
  RxInt toppingsPrice = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    pageControllerTwo.value = PageController(initialPage: 0, viewportFraction: 1.0);
    pageControllerOne.value = PageController(initialPage: 0, viewportFraction: 1.1);
    textPageController.value = PageController(initialPage: 0, viewportFraction: 1.1);

    pageControllerTwo.value.addListener(() {
      currentPageValue.value = pageControllerTwo.value.page!;

      toppingList.clear();
      animationList.clear();
      animationController.reset();

      for (int i = 0; i < toppingDetailsList.length; i++) {
        toppingDetailsList[i].tapped = false;
        counter.value = 0;
        toppingsPrice.value = 0;
      }
      pageControllerOne.value.animateToPage(
        currentPageValue.value.toInt(),
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      textPageController.value.jumpToPage(
        currentPageValue.value.toInt(),
      );

      currentPageValue.refresh();
      currentPage.refresh();
    });

    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
  }

  /// Add Build Topping At Particular Position
  Widget buildIngredientsShowWidget() {
    List<Widget> elements = [];
    if (animationList.isNotEmpty) {
      for (int i = 0; i < toppingList.length; i++) {
        Toppings ingredient = toppingList[i];
        final pizzaToppingWidget = Image.asset(ingredient.image, height: 25);
        for (int j = 0; j < ingredient.positions.length; j++) {
          final animation = animationList[j];
          final position = ingredient.positions[j];
          final positionX = position.dx;
          final positionY = position.dy;

          if (i == toppingList.length - 1) {
            if (j < 1) {
            } else if (j < 2) {
            } else if (j < 4) {
            } else {}
            if (animation.value > 0) {
              elements.add(
                Transform(
                  transform: Matrix4.identity()
                    ..translate(
                      pizzaConstraints.value.maxHeight * positionX,
                      pizzaConstraints.value.maxHeight * positionY,
                    ),
                  child: pizzaToppingWidget,
                ),
              );
            }
          } else {
            elements.add(
              Transform(
                transform: Matrix4.identity()
                  ..translate(
                    pizzaConstraints.value.maxHeight * positionX,
                    pizzaConstraints.value.maxHeight * positionY,
                  ),
                child: pizzaToppingWidget,
              ),
            );
          }
        }
      }
      return Stack(
        children: elements,
      );
    }
    return SizedBox.fromSize();
  }

  void toppingAddOnPizza() {
    animationList.clear();
    animationList.add(CurvedAnimation(parent: animationController, curve: const Interval(0.4, 0.8, curve: Curves.decelerate)));
    animationList.add(CurvedAnimation(parent: animationController, curve: const Interval(0.1, 0.5, curve: Curves.decelerate)));
    animationList.add(CurvedAnimation(parent: animationController, curve: const Interval(0.8, 0.8, curve: Curves.decelerate)));
    animationList.add(CurvedAnimation(parent: animationController, curve: const Interval(0.5, 0.7, curve: Curves.decelerate)));
  }

  @override
  void dispose() {
    super.dispose();
    pageControllerTwo.value.dispose();
    pageControllerOne.value.dispose();
    textPageController.value.dispose();
    animationController.dispose();
  }

  /// Refresh And Add Topping List AS Per Pizza Page Change
  void refreshToppings(int index) {
    print("currentToppingSource -----======----->> $currentToppingSource");
    print("currentPageValue -----======----->> $currentPageValue");
    print("Index -----======----->> $index");

    if (index == 0) {
      selectedPizza = Pizzas.Greek;
    } else if (index == 1) {
      selectedPizza = Pizzas.Neapolitan;
    } else {
      selectedPizza = Pizzas.Chicago;
    }

    toppingDetailsListDefault = selectedPizza == Pizzas.Greek
        ? greekPizza
        : selectedPizza == Pizzas.Neapolitan
            ? neapolitanPizza
            : chicagoPizza;

    toppingDetailsList.refresh();
    print(toppingDetailsList.toString());
    update();
  }
}

/// Pizza Detail Model
class Pizza {
  String? pizzaTitle;
  String? pizzaDesc;
  String? pizzaImage;
  int? pizzaPriceS;
  int? pizzaPriceM;
  int? pizzaPriceL;

  Pizza({
    required this.pizzaTitle,
    required this.pizzaDesc,
    required this.pizzaImage,
    required this.pizzaPriceS,
    required this.pizzaPriceM,
    required this.pizzaPriceL,
  });
}

/// Pizza Size Model
class SizePizza {
  String? sizeTitle;
  bool? isSelected;

  SizePizza({this.sizeTitle, this.isSelected});
}

/// Topping Model
class Toppings {
  Toppings(this.image, this.positions, this.tapped);

  final String image;
  final List<Offset> positions;
  bool tapped;

  @override
  String toString() {
    return 'Toppings{image: $image, positions: $positions, tapped: $tapped}';
  }
}

/// Topping Selection Source Enum
enum ToppingSource { Default, TopLeft, TopRight, BottomLeft, BottomRight }
ToppingSource currentToppingSource = ToppingSource.Default;


/// On Default Topping Selection -- Select Topping As Per PiZza Page Change Enum
enum Pizzas { Greek, Neapolitan, Chicago }

Pizzas selectedPizza = Pizzas.Greek;





//----------------------------Extra---------------
// //----------------------------- toppingIsBlur -------------------------//
// final RxMap toppingIsBlur = {}.obs;
//
// void toggleToppingBlurState(int index) {
//   if (toppingIsBlur.containsKey(index)) {
//     toppingIsBlur[index] = !toppingIsBlur[index]!;
//   } else {
//     toppingIsBlur[index] = true;
//   }
//   update();
// }
// RotationTransition(
//   turns: Tween(begin: 0.0, end: 2.0).animate(rotationController),
//   alignment: Alignment.center,
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.end,
//     children: [
//       Image.asset(ingredient.image, height: 35),
//     ],
//   ),
// );

// AnimationController rotationController = AnimationController(
//   vsync: TickerProviderMixin(),
//   duration: const Duration(seconds: 10),
// )..repeat();
//
// AnimationController toppingRotator = AnimationController(
//   vsync: TickerProviderMixin(),
//   duration: const Duration(seconds: 10),
// )..repeat();
