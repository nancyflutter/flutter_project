import 'package:flutter_project/Models/example_view_model.dart';
import 'package:flutter_project/Screens/DartCodeFilesForExampleView/TweetGenerator/Controller/pizza_app_controller_.dart';
import 'package:get/get.dart';
import 'imports_.dart';

class ExampleController extends GetxController {
  final pizzaController = Get.find<PizzaController>();

  bool expanded = false;

  /// Example Screen View List
  final List<ExampleModel> exampleList = <ExampleModel>[
    /// Splash Screen
    ExampleModel(
      title: "Splash Screen",
      designList: [
        DesignModel(
          title: "Splash Design - 1",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SplashScreens/splash_design_one.dart",
          screenName: const SplashDesignOne(),
        ),
        DesignModel(
          title: "Splash Design - 2",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SplashScreens/splash_design_two.dart",
          screenName: const SplashDesignTwo(),
        ),
        DesignModel(
          title: "Splash Design - 3",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SplashScreens/splash_design_three.dart",
          screenName: const SplashDesignThree(),
        ),
        DesignModel(
          title: "Splash Design - 4",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SplashScreens/splash_design_four.dart",
          screenName: const SplashDesignFour(),
        ),
        DesignModel(
          title: "Splash Design - 5",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SplashScreens/splash_design_five.dart",
          screenName: const SplashDesignFive(),
        ),
        DesignModel(
          title: "Splash Design - 6",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SplashScreens/splash_design_six.dart",
          screenName: const SplashDesignSix(),
        ),
        DesignModel(
          title: "Splash Design - 7",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SplashScreens/splash_design_seven.dart",
          screenName: const SplashDesignSeven(),
        ),
        DesignModel(
          title: "Splash Design - 8",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SplashScreens/splash_design_eight.dart",
          screenName: const SplashDesignEight(),
        ),
      ],
    ),

    /// Login
    ExampleModel(
      title: "Login",
      designList: [
        DesignModel(
          title: "Login Design - 1",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/LogInScreens/login_design_one.dart",
          screenName: const LogInDesignOne(),
        ),
        DesignModel(
          title: "Login Design - 2",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/LogInScreens/login_design_two.dart",
          screenName: const LogInDesignTwo(),
        ),
        DesignModel(
          title: "Login Design - 3",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/LogInScreens/login_design_three.dart",
          screenName: const LogInDesignThree(),
        ),
        DesignModel(
          title: "Login Design - 4",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/LogInScreens/login_design_four.dart",
          screenName: const LogInDesignFour(),
        ),
        DesignModel(
          title: "Login Design - 5",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/LogInScreens/login_design_five.dart",
          screenName: const LogInDesignFive(),
        ),
        DesignModel(
          title: "Login Design - 6",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/LogInScreens/login_design_six.dart",
          screenName: const LogInDesignSix(),
        ),
        DesignModel(
          title: "Login Design - 7",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/LogInScreens/login_design_seven.dart",
          screenName: const LogInDesignSeven(),
        ),
      ],
    ),

    /// Calculator
    ExampleModel(
      title: "Calculator",
      designList: [
        DesignModel(
          title: "Calculator - 1",
          codeFile: "lib/Screens/Screens/DartCodeFilesForExampleView/CalculatorScreen/calculator_one.dart",
          screenName: const CalculatorOne(),
        ),
        DesignModel(
          title: "Calculator - 2",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/CalculatorScreen/calculator_two.dart",
          screenName: const CalculatorTwo(),
        ),
        DesignModel(
          title: "EMI Calculator",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/CalculatorScreen/emi_calculator_.dart",
          screenName: const MonthlyEmiCalculator(),
        ),
      ],
    ),

    /// Todo
    ExampleModel(
      title: "Todo",
      designList: [
        DesignModel(
          title: "ToDo - 1",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/ToDoScreens/to_do_one.dart",
          screenName: const ToDoOne(),
        ),
        DesignModel(
          title: "ToDo - 2",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/ToDoScreens/to_do_two.dart",
          screenName: const ToDoTwo(),
        ),
        DesignModel(
          title: "ToDo - 3",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/ToDoScreens/to_do_three.dart",
          screenName: const ToDoThree(),
        ),
      ],
    ),

    /// Home Screen
    ExampleModel(
      title: "Home Screen",
      designList: [
        DesignModel(
          title: "Home Screen - 1",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/ExampleHomeScreens/home_screen_one.dart",
          screenName: const HomeScreenOne(),
        ),
        DesignModel(
          title: "Home Screen - 2",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/ExampleHomeScreens/home_screen_two.dart",
          screenName: const HomeScreenTwo(),
        ),
        DesignModel(
          title: "Home Screen - 3",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/ExampleHomeScreens/home_screen_three.dart",
          screenName: const HomeScreenThree(),
        ),
        DesignModel(
          title: "Home Screen - 4",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/ExampleHomeScreens/home_screen_four.dart",
          screenName: const HomeScreenFour(),
        ),
        DesignModel(
          title: "Home Screen - 5",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/ExampleHomeScreens/home_screen_five.dart",
          screenName: const HomeScreenFive(),
        ),
        DesignModel(
          title: "Home Screen - 6",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/ExampleHomeScreens/home_screen_six.dart",
          screenName: const HomeScreenSix(),
        ),
      ],
    ),

    /// Profile
    ExampleModel(
      title: "Profile",
      designList: [
        DesignModel(
          title: "Profile - 1",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/ProfileScreens/profile_one.dart",
          screenName: const ProfileOne(),
        ),
        DesignModel(
          title: "Profile - 2",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/ProfileScreens/profile_two.dart",
          screenName: const ProfileTwo(),
        ),
        DesignModel(
          title: "Profile - 3",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/ProfileScreens/profile_three.dart",
          screenName: const ProfileThree(),
        ),
        DesignModel(
          title: "Profile - 4",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/ProfileScreens/profile_four.dart",
          screenName: const ProfileFour(),
        ),
        DesignModel(
          title: "Profile - 5",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/ProfileScreens/profile_five.dart",
          screenName: const ProfileFive(),
        ),
      ],
    ),

    /// Game
    ExampleModel(
      title: "Game",
      designList: [
        DesignModel(
          title: "Memory Game",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/GameScreen/memory_game.dart",
          screenName: const MemoryGame(),
        ),
        DesignModel(
          title: "Tic Tac Toe Game",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/GameScreen/tic_tac_tio_game_screen.dart",
          screenName: const TicTacToeHomePage(),
        ),
      ],
    ),

    /// OTP Screen
    ExampleModel(
      title: "OTP Screen",
      designList: [
        DesignModel(
          title: "Otp Screen 1",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/OTP Screen/otp_screen_one_.dart",
          screenName: const OTPScreenOne(),
        ),
      ],
    ),

    /// Example App
    ExampleModel(
      title: "Example App",
      designList: [
        DesignModel(
          title: "Tweet Generator",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/TweetGenerator/create_quote_like_tweet.dart",
          screenName: const QuotesAppScreen(),
        ),
        DesignModel(
          title: "Example Instagram Filter Selection",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/TweetGenerator/a_photo_filter_carousel_.dart",
          screenName: const ExampleInstagramFilterSelection(),
        ),
        DesignModel(
          title: "Scrolling Parallax Effect",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/TweetGenerator/scrolling_parallax_effect_.dart",
          screenName: const ExampleParallax(),
        ),
        DesignModel(
          title: "A Shimmer Loading Effect",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/TweetGenerator/a_shimmer_loading_effect_.dart",
          screenName: const ExampleUiLoadingAnimation(),
        ),
        DesignModel(
          title: "A  Download Button",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/TweetGenerator/a_download_button_.dart",
          screenName: const ExampleCupertinoDownloadButton(),
        ),
        DesignModel(
          title: "Example Staggered Animations",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/TweetGenerator/a_staggered_menu_animation_.dart",
          screenName: const ExampleStaggeredAnimations(),
        ),
        DesignModel(
          title: "A Typing Indicator",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/TweetGenerator/a_typing_indicator_.dart",
          screenName: const ExampleIsTyping(),
        ),
        DesignModel(
          title: "Example Drag And Drop",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/TweetGenerator/drag_ui_element_.dart",
          screenName: const ExampleDragAndDrop(),
        ),
        DesignModel(
          title: "Example Gradient Bubbles",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/TweetGenerator/gradient_chat_bubbles_.dart",
          screenName: const ExampleGradientBubbles(),
        ),
        DesignModel(
          title: "Pizza App GetX",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/TweetGenerator/pizza_app_.dart",
          screenName: const PizzaApp(),
        ),
        // DesignModel(
        //   title: "Pizza App Example",
        //   codeFile: "lib/Screens/DartCodeFilesForExampleView/TweetGenerator/example_pizza_.dart",
        //   screenName: const PizzaHomePage(),
        // ),
        DesignModel(
          title: "3D Drawer",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/TweetGenerator/three_d_drawer_.dart",
          screenName: const Drawer3DScreen(),
        ),
        DesignModel(
          title: "Swipe Drawer",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/TweetGenerator/swipe_drawer_.dart",
          screenName: const SwipeDrawer(),
        ),
        DesignModel(
          title: "3D Object Render On Screen",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/TweetGenerator/three_d_object_render_on_screeen.dart",
          screenName: const ObjectRender3D(),
        ),
      ],
    ),

    /// Rive Animation
    ExampleModel(
      title: "Rive Animation",
      designList: [
        DesignModel(
          title: "Rive Animation 1",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/RiveAnimation/rive_animation_one_.dart",
          screenName: const RiveAnimationOne(),
        ),
        DesignModel(
          title: "Rive Animation 2",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/RiveAnimation/rive_animation_two_.dart",
          screenName: const OTPScreenTwo(),
        ),
      ],
    ),

    /// How To...
    ExampleModel(
      title: "How To...",
      designList: [
        DesignModel(
          title: "How To Access Contact Book",
          codeFile: "lib/Screens/DartCodeFilesForExampleView/HowTo/access_contact_book_.dart",
          screenName: const ContactBookAccess(),
        ),
      ],
    ),

    /// SpaceX List GET APIs
    ExampleModel(
      title: "SpaceX List GET APIs",
      designList: [
        DesignModel(
          title: "All Ships FutureBuilder GET", // 'https://api.spacexdata.com/v3/ships
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceX/all_ships_api_get_.dart",
          screenName: const AllShipApiScreen(),
        ),
        DesignModel(
          title: "RocketAPI FutureBuilder GET", // https://api.spacexdata.com/v3/rockets
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceX/using_future_builder_.dart",
          screenName: const UsingFutureBuilder(),
        ),
        DesignModel(
          title: "All Dragon Simple GET", // https://api.spacexdata.com/v3/dragons
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceX/all_dragon_simple_get_.dart",
          screenName: const AllDragonApiGet(),
        ),
        DesignModel(
          title: "All Launches GET Future", // https://api.spacexdata.com/v3/launches
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceX/launches_get_normal.dart",
          screenName: const AllLaunchesNormal(),
        ),
        DesignModel(
          title: "All Capsules GET Future", // https://api.spacexdata.com/v3/capsules
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceX/all_capsules_get_.dart",
          screenName: const AllCapsulesAPI(),
        ),
        DesignModel(
          title: "UpComing Capsules GET FutureBuilder", // https://api.spacexdata.com/v3/capsules/upcoming
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceX/upcoming_capsules_get_api_.dart",
          screenName: const UpComingCapsulesAPI(),
        ),
        DesignModel(
          title: "Past Capsules Simple", // https://api.spacexdata.com/v3/capsules/past
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceX/past_capsules_api_get_.dart",
          screenName: const PastCapsulesAPI(),
        ),
        DesignModel(
          title: "All Cores GET Future", // https://api.spacexdata.com/v3/cores
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceX/all_cores_api_get_.dart",
          screenName: const AllCoresAPIScreen(),
        ),
        DesignModel(
          title: "UpComing Core GET FutureBuilder", // https://api.spacexdata.com/v3/cores/upcoming
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceX/upcoming_capsules_get_api_.dart",
          screenName: const UpComingCoreAPIScreen(),
        ),
        DesignModel(
          title: "Past Core Simple", // https://api.spacexdata.com/v3/cores/past
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceX/past_core_get_api_.dart",
          screenName: const PastCoreAPIGet(),
        ),
        DesignModel(
          title: "All History GET Future", // https://api.spacexdata.com/v3/history
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceX/all_history_api_get_.dart",
          screenName: const AllHistoryAPIGet(),
        ),
        DesignModel(
          title: "All Landing"
              " FutureBuilder GET", // https://api.spacexdata.com/v3/landpads
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceX/all_landing_api_get_.dart",
          screenName: const AllLandingAPIScreen(),
        ),
        DesignModel(
          title: "All LaunchPad GET Future", // https://api.spacexdata.com/v3/launchpads
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceX/all_launch_pad_api_get_.dart",
          screenName: const AllLaunchPadAPIScreen(),
        ),
        DesignModel(
          title: "All Mission Simple GET", // https://api.spacexdata.com/v3/missions
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceX/mission_api_simple_get_.dart",
          screenName: const MissionApiScreen(),
        ),
        DesignModel(
          title: "All PayLoads GET FutureBuilder", // https://api.spacexdata.com/v3/payloads
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceX/all_pay_load_api_get_.dart",
          screenName: const AllPayLoadAPIScreen(),
        ),
      ],
    ),

    /// SpaceX Map GET APIs
    ExampleModel(
      title: "SpaceX Map GET APIs",
      designList: [
        DesignModel(
          title: "One Ship GET",
          // https://api.spacexdata.com/v3/ships/AMERICANCHAMPION
          // OneShipModel
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceXModelAPIs/one_ship_api_get_.dart",
          screenName: const OneShipAPIScreen(),
        ),
        DesignModel(
          title: "Roadster FutureBuilder GET",
          // https://api.spacexdata.com/v3/roadster
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceXModelAPIs/with_future_builder_.dart",
          screenName: const MapAPIWithFutureBuilder(),
        ),
        DesignModel(
          title: "OneCapsule Simple GET",
          // https://api.spacexdata.com/v3/capsules/C112
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceXModelAPIs/one_capsules_api_get_.dart",
          screenName: const OneCapsulesAPI(),
        ),
        DesignModel(
          title: "One Core FutureBuilder",
          // https://api.spacexdata.com/v3/cores/B1042
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceXModelAPIs/one_core_get_api_.dart",
          screenName: const OneCoreAPIGet(),
        ),
        DesignModel(
          title: "OneDragon Future GET",
          // https://api.spacexdata.com/v3/dragons/dragon1
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceXModelAPIs/dragon_one_api_future_.dart",
          screenName: const DragonAPIScreen(),
        ),
        DesignModel(
          title: "One History Future GET",
          // https://api.spacexdata.com/v3/history/1
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceXModelAPIs/one_history_api_get_.dart",
          screenName: const OneHistoryAPIScreen(),
        ),
        DesignModel(
          title: "Company Info FutureBuilder GET ",
          // https://api.spacexdata.com/v3/info
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceXModelAPIs/company_info_api_get_.dart",
          screenName: const CompanyInfoAPI(),
        ),
        DesignModel(
          title: "API Info GET Simple",
          // https://api.spacexdata.com/v3
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceXModelAPIs/api_info_api_get_.dart",
          screenName: const ApiInfoGETScreen(),
        ),
        DesignModel(
          title: "One Landing API GET Future",
          // https://api.spacexdata.com/v3/landpads/LZ-4
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceXModelAPIs/one_landpads_api_get_.dart",
          screenName: const OneLandPadsAPIScreen(),
        ),
        DesignModel(
          title: "OneLaunches Simple GET",
          // https://api.spacexdata.com/v3/launches/67
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceXModelAPIs/simple_way_.dart",
          screenName: const SimpleModelTypeAPI(),
        ),
        DesignModel(
          title: "One Mission GET",
          // https://api.spacexdata.com/v3/missions/F3364BF
          // OneMissionModel
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceXModelAPIs/one_mission_api_get.dart",
          screenName: const OneMissionAPIScreen(),
        ),
        DesignModel(
          title: "One PayLoad GET",
          // https://api.spacexdata.com/v3/payloads/Telkom-4
          // OnePayloadModel
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceXModelAPIs/one_pay_load_api_get_.dart",
          screenName: const OnePayLoadAPIScreen(),
        ),
        DesignModel(
          title: "One Rocket GET",
          // https://api.spacexdata.com/v3/rockets/falcon9
          // OneRocketModel
          codeFile: "lib/Screens/DartCodeFilesForExampleView/SpaceXModelAPIs/one_rocket_api_get_.dart",
          screenName: const OneRocketAPIScreen(),
        ),
      ],
    ),
  ].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
