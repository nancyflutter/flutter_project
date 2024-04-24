import 'package:flutter/material.dart';

class PizzaHomePage extends StatefulWidget {
  const PizzaHomePage({Key? key}) : super(key: key);

  @override
  State<PizzaHomePage> createState() => _PizzaHomePageState();
}

class _PizzaHomePageState extends State<PizzaHomePage> with SingleTickerProviderStateMixin {
  List<bool> isSelected = [false, true, false];
  PageController toppingController = PageController(viewportFraction: 0.3);

  List<Pizza> myPizzas = [
    Pizza(
        pizzaTitle: "Greek",
        pizzaDesc: "feta cheese, black olives, red onion",
        pizzaImage: 'assets/pizzas/pizza1.png',
        pizzaPriceS: 8,
        pizzaPriceM: 11,
        pizzaPriceL: 13),
    Pizza(
        pizzaTitle: "Neapolitan",
        pizzaDesc: "mozzarella, tomatoes, oregano",
        pizzaImage: 'assets/pizzas/pizza2.png',
        pizzaPriceS: 7,
        pizzaPriceM: 10,
        pizzaPriceL: 12),
    Pizza(
        pizzaTitle: "Chicago",
        pizzaDesc: "mozzarella, tomatoes, onion",
        pizzaImage: 'assets/pizzas/pizza3.png',
        pizzaPriceS: 8,
        pizzaPriceM: 11,
        pizzaPriceL: 13),
  ];

  List<Ingredient> topping = [];

  late Ingredient ingredient;

  late AnimationController _animationController;
  final List<Animation> _animationList = <Animation>[];
  late BoxConstraints _pizzaConstraints;

  Widget _buildIngredientsWidget() {
    List<Widget> elements = [];
    if (_animationList.isNotEmpty) {
      for (int i = 0; i < topping.length; i++) {
        Ingredient ingredient = topping[i];
        final pizzaToppingWidget = Image.asset(ingredient.image, height: 35);
        for (int j = 0; j < ingredient.positions.length; j++) {
          final animation = _animationList[j];
          final position = ingredient.positions[j];
          final positionX = position.dx;
          final positionY = position.dy;

          if (i == topping.length - 1) {
            if (j < 1) {
            } else if (j < 2) {
            } else if (j < 4) {
            } else {}
            if (animation.value > 0) {
              elements.add(
                Transform(
                  transform: Matrix4.identity()
                    ..translate(
                      _pizzaConstraints.maxHeight * positionX,
                      _pizzaConstraints.maxHeight * positionY,
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
                    _pizzaConstraints.maxHeight * positionX,
                    _pizzaConstraints.maxHeight * positionY,
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

  void _buildIngredientAnimation() {
    _animationList.clear();
    _animationList.add(CurvedAnimation(parent: _animationController, curve: const Interval(0.4, 0.8, curve: Curves.decelerate)));
    _animationList.add(CurvedAnimation(parent: _animationController, curve: const Interval(0.1, 0.5, curve: Curves.decelerate)));
    _animationList.add(CurvedAnimation(parent: _animationController, curve: const Interval(0.8, 0.8, curve: Curves.decelerate)));
    _animationList.add(CurvedAnimation(parent: _animationController, curve: const Interval(0.5, 0.7, curve: Curves.decelerate)));
  }

  late PageController _pageController1;
  late PageController _pageController2;
  late PageController _pageController3;
  late PageController _pageController4;

  var currentPageValue = 0.0;
  var currentPage = 0.0;
  int counter = 0;

  double pizzaSize = 215;
  double pizzaSizeS = 195;
  double pizzaSizeM = 215;
  double pizzaSizeL = 240;

  late int total, pizzaPrice, pizzaPriceS, pizzaPriceM, pizzaPriceL;
  int toppingsPrice = 0;

  @override
  void initState() {
    super.initState();

    _pageController1 = PageController(initialPage: 1, viewportFraction: 1.0);
    _pageController2 = PageController(initialPage: 1, viewportFraction: 1.1);
    _pageController3 = PageController(initialPage: 1, viewportFraction: 1.1);
    _pageController4 = PageController(initialPage: 3, viewportFraction: 0.2);

    _pageController1.addListener(() {
      setState(() {
        currentPageValue = _pageController1.page!;

        topping.clear();
        _animationList.clear();
        _animationController.reset();

        for (int i = 0; i < ingredients.length; i++) {
          ingredients[i].tapped = false;
          counter = 0;
          toppingsPrice = 0;
        }
        _pageController2.animateToPage(
          currentPageValue.toInt(),
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
        _pageController3.jumpToPage(
          currentPageValue.toInt(),
        );
      });
    });

    _pageController4.addListener(() {
      setState(() {
        currentPage = _pageController4.page!;
      });
    });

    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
  }

  @override
  void dispose() {
    _pageController1.dispose();
    _pageController2.dispose();
    _pageController3.dispose();
    _pageController4.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            _topView(),
            const SizedBox(
              height: 15,
            ),
            _pizzaView(),
            const SizedBox(
              height: 10,
            ),
            _textView(),
            const SizedBox(height: 20),
            _buttonView(),
            const SizedBox(
              height: 10,
            ),
            _toppingCounterView(),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 15,
            ),
            Flexible(
              child: SizedBox(
                height: 170,
                width: MediaQuery.of(context).size.width,
                child: _toppingView(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topView() {
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
        Expanded(
          child: ScrollConfiguration(
            behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
            child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                controller: _pageController2,
                itemCount: myPizzas.length,
                itemBuilder: (context, index) {
                  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      child: Text(
                        myPizzas[index].pizzaTitle,
                        style: const TextStyle(color: Colors.black, fontSize: 32),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        child: Text(
                          myPizzas[index].pizzaDesc,
                          style: const TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ),
                  ]);
                }),
          ),
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

  Widget _pizzaView() {
    return Container(
      height: 240,
      alignment: Alignment.center,
      child: LayoutBuilder(builder: (context, constraints) {
        _pizzaConstraints = constraints;
        return Stack(
          children: [
            Center(
              child: AnimatedContainer(
                height: pizzaSize,
                duration: const Duration(milliseconds: 500),
                child: Transform.rotate(
                  angle: currentPageValue * 4,
                  child: Image.asset('assets/pizzas/plate_5.png'),
                ),
              ),
            ),
            Center(
              child: AnimatedContainer(
                height: pizzaSize,
                duration: const Duration(milliseconds: 500),
                child: PageView.builder(
                    controller: _pageController1,
                    itemCount: myPizzas.length,
                    itemBuilder: (context, index) {
                      final parent = currentPageValue - index;
                      return Padding(
                        padding: const EdgeInsets.all(4),
                        child: Transform.rotate(
                          angle: parent * 4,
                          child: Image.asset(myPizzas[index].pizzaImage),
                        ),
                      );
                    }),
              ),
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, _) {
                return _buildIngredientsWidget();
              },
            ),
          ],
        );
      }),
    );
  }

  Widget _textView() {
    return SizedBox(
      height: 50,
      child: ScrollConfiguration(
        behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
        child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: _pageController3,
            itemCount: myPizzas.length,
            itemBuilder: (context, index) {
              pizzaPrice = myPizzas[index].pizzaPriceM;

              pizzaPriceS = myPizzas[index].pizzaPriceS;
              pizzaPriceM = myPizzas[index].pizzaPriceM;
              pizzaPriceL = myPizzas[index].pizzaPriceL;

              total = pizzaPrice + toppingsPrice;

              if (isSelected[0]) {
                total = pizzaPriceS + toppingsPrice;
              } else if (isSelected[1]) {
                total = pizzaPriceM + toppingsPrice;
              } else if (isSelected[2]) {
                total = pizzaPriceL + toppingsPrice;
              }

              return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "\$$total",
                  style: const TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ]);
            }),
      ),
    );
  }

  Widget _buttonView() {
    return SizedBox(
      height: 60,
      child: ToggleButtons(
        isSelected: isSelected,
        selectedColor: Colors.black,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        fillColor: Colors.transparent,
        renderBorder: false,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 10),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(color: isSelected[0] == false ? Colors.grey[300] : Colors.orange[300], shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Colors.grey[350]!,
                  offset: const Offset(-4, 3),
                  blurRadius: 2,
                  spreadRadius: 1,
                ),
              ]),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "S",
                  style: TextStyle(color: isSelected[0] == false ? Colors.grey[500] : Colors.black, fontSize: 17),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(color: isSelected[1] == false ? Colors.grey[300] : Colors.orange[300], shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                color: Colors.grey[350]!,
                offset: const Offset(0, 3),
                blurRadius: 2,
                spreadRadius: 1,
              ),
            ]),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "M",
                style: TextStyle(color: isSelected[1] == false ? Colors.grey[500] : Colors.black, fontSize: 17),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(color: isSelected[2] == false ? Colors.grey[300] : Colors.orange[300], shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Colors.grey[350]!,
                  offset: const Offset(4, 3),
                  blurRadius: 2,
                  spreadRadius: 1,
                ),
              ]),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "L",
                  style: TextStyle(color: isSelected[2] == false ? Colors.grey[500] : Colors.black, fontSize: 17),
                ),
              ),
            ),
          ),
        ],
        onPressed: (int newIndex) {
          setState(() {
            for (int index = 0; index < isSelected.length; index++) {
              if (index == newIndex) {
                isSelected[index] = true;
                setState(() {
                  if (isSelected[0]) {
                    pizzaSize = pizzaSizeS;
                  } else if (isSelected[1]) {
                    pizzaSize = pizzaSizeM;
                  } else if (isSelected[2]) {
                    pizzaSize = pizzaSizeL;
                  }
                });
              } else {
                isSelected[index] = false;
              }
            }
          });
        },
      ),
    );
  }

  Widget _toppingCounterView() {
    return Text(
      "$counter/3",
      style: const TextStyle(color: Colors.grey, fontSize: 15),
    );
  }

  Widget _toppingView(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 150,
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
            // color: Colors.red,
            borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(MediaQuery.of(context).size.width, 220.0)),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: 60,
          child: PageView.builder(
            controller: toppingController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: ingredients.length,
              itemBuilder: (context, index) {
                final ingredient = ingredients[index];
                return GestureDetector(
                  onTap: ingredient.tapped == false
                      ? () {
                          if (counter < 3) {
                            setState(() {
                              topping.add(ingredient);
                              ingredient.tapped = true;
                              toppingsPrice++;
                              counter++;
                              _buildIngredientAnimation();
                              _animationController.forward(from: 0.0);
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Row(
                                children: [
                                  Icon(
                                    Icons.front_hand_outlined,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Text(
                                      "Max toppings added",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ],
                              )),
                            );
                            _animationController.stop();
                          }
                        }
                      : null,
                  onLongPress: () {
                    setState(() {
                      topping.remove(ingredient);
                      // ingredient.tapped = false;
                      ingredient.tapped = !ingredient.tapped;
                      toppingsPrice--;
                      counter--;
                    });
                  },
                  child: Image.asset(
                    ingredient.image,
                    color: ingredient.tapped == false ? null : Colors.grey[300]!.withOpacity(0.5),
                    colorBlendMode: ingredient.tapped == false ? null : BlendMode.lighten,
                  ),
                );
              }),
        ),
        _addToCartView(),
      ],
    );
  }

  Widget _addToCartView() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 50,
        width: 150,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(top: 12, bottom: 12, left: 15, right: 15),
            backgroundColor: Colors.black,
            elevation: 3.0,
            splashFactory: NoSplash.splashFactory,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: const TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
          icon: const Icon(
            Icons.shopping_cart,
            size: 25,
            color: Colors.white,
          ),
          label: const Text(
            "Add to cart",
          ),
          onPressed: () {
            setState(() {});
            // Respond to button press
          },
        ),
      ),
    );
  }
}

class Ingredient {
  Ingredient(this.image, this.positions, this.tapped);

  final String image;
  final List<Offset> positions;
  bool tapped;
}

var ingredients = <Ingredient>[
  Ingredient(
    'assets/toppings/onion.png',
    <Offset>[
      const Offset(0.8, 0.15),
      const Offset(0.6, 0.45),
      const Offset(0.7, 0.2),
      const Offset(0.8, 0.55),
    ],
    false,
  ),
  Ingredient(
    'assets/toppings/olives.png',
    <Offset>[
      const Offset(0.6, 0.2),
      const Offset(0.5, 0.4),
      const Offset(0.7, 0.25),
      const Offset(0.9, 0.50),
    ],
    false,
  ),
  Ingredient(
    'assets/toppings/cheese.png',
    <Offset>[
      const Offset(0.4, 0.3),
      const Offset(0.6, 0.65),
      const Offset(0.7, 0.15),
      const Offset(0.9, 0.55),
    ],
    false,
  ),
  Ingredient(
    'assets/toppings/mushrooms.png',
    <Offset>[
      const Offset(0.8, 0.15),
      const Offset(0.6, 0.45),
      const Offset(0.7, 0.2),
      const Offset(0.8, 0.55),
    ],
    false,
  ),
  Ingredient(
    'assets/toppings/tomatos.png',
    <Offset>[
      const Offset(0.6, 0.2),
      const Offset(0.5, 0.4),
      const Offset(0.7, 0.25),
      const Offset(0.9, 0.50),
    ],
    false,
  ),
  Ingredient(
    'assets/toppings/oregano.png',
    <Offset>[
      const Offset(0.8, 0.15),
      const Offset(0.6, 0.45),
      const Offset(0.7, 0.2),
      const Offset(0.8, 0.55),
    ],
    false,
  ),
];

class Pizza {
  late String pizzaTitle;
  late String pizzaDesc;
  late String pizzaImage;
  late int pizzaPriceS;
  late int pizzaPriceM;
  late int pizzaPriceL;

  Pizza({
    required this.pizzaTitle,
    required this.pizzaDesc,
    required this.pizzaImage,
    required this.pizzaPriceS,
    required this.pizzaPriceM,
    required this.pizzaPriceL,
  });
}

