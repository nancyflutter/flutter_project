import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_project/Models/widget_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'imports_.dart';

class HomeController extends GetxController {
  RxBool search = false.obs;
  final TextEditingController searchController = TextEditingController();

  final List<WidgetModel> widgetList = <WidgetModel>[
    WidgetModel(id: 01, title: 'Material App', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/material_app_widget.dart", screenName: const MaterialWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 02, title: 'Scaffold', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/scaffold_widget.dart", screenName: const ScaffoldWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 03, title: 'AppBar', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/app_bar_widget.dart", screenName: const AppBarWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 04, title: 'Container', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/container_widget.dart", screenName: const ContainerWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 05, title: 'Text', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/text_widget_.dart", screenName: const TextWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 06, title: 'Button', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/button_widget_.dart", screenName: const ButtonWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 07, title: 'Snack Bar', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/snack_bar_widget_.dart", screenName: const SnackBarWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 08, title: 'Alert', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/alert_dialog_widget_.dart", screenName: AlertDialogWidget(), details: "An application that uses Material Design."),
    WidgetModel(id: 09, title: 'Column', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/column_widget_screen.dart", screenName: ColumnWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 10, title: 'Row', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/row_widget_.dart", screenName: RowWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 11, title: 'Icon', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/icon_widget_.dart", screenName: const IconWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 12, title: 'Image', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/image_widget_.dart", screenName: const ImageWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 13, title: 'List View', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/list_view_widget_.dart", screenName: ListViewWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 14, title: 'Grid View', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/grid_view_widget_.dart", screenName: GridViewWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 15, title: 'Sliver AppBar', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/silver_app_bar_widget_.dart", screenName: SliverAppBarWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 16, title: 'Sliver List', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/silver_list_widget_.dart", screenName: const SliverListWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 17, title: 'Sliver Grid', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/sliver_grid_widget_.dart", screenName: const SliverGridWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 18, title: 'Animated Icon', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/animated_icon_widget_.dart", screenName: const AnimatedIconWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 19, title: 'Expanded', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/expanded_widget_.dart", screenName: const ExpandedWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 20, title: 'Wrap', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/wrap_widget_.dart", screenName: const WrapWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 21, title: 'Sized Box', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/sized_box_widget_.dart", screenName: const SizedBoxWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 22, title: 'Stack', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/stack_widget_.dart", screenName: const StackWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 23, title: 'Cupertino Page Scaffold', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/cupertino_page_scaffold.dart", screenName: const CupertinoPageScaffoldScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 24, title: 'Hero', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/hero_animation_widget.dart", screenName: const HeroAnimationWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 25, title: 'Drawer', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/drawer_widget_.dart", screenName: const DrawerWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 26, title: 'Backdrop Filter', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/back_drop_filter_widget_.dart", screenName: BackDropFilterWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 27, title: 'Dismissible', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/dismissible_widget_.dart", screenName: DismissibleWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 28, title: 'Dropdown Button', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/drop_down_button_widget_.dart", screenName: const DropDownButtonScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 29, title: 'Card', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/card_widget_.dart", screenName: const CardWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 30, title: 'Chip', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/chip_widget_.dart", screenName: const ChipWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 31, title: 'Spacer', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/spacer_widget_.dart", screenName: const SpacerWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 32, title: 'Stepper', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/stepper_widget_.dart", screenName: const StepperWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 33, title: 'Animated Switcher', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/animated_switcher_widget_.dart", screenName: const AnimatedSwitcherWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 34, title: 'Rotated Box', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/rotated_box_widget_.dart", screenName: const RotatedBoxWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 35, title: 'Draggable', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/draggable_widget_.dart", screenName: const DraggableWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 36, title: 'Transform', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/transform_widget_.dart", screenName: const TransFormWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 37, title: 'Future Builder', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/future_builder_widget_.dart", screenName: const FutureBuilderScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 38, title: 'Stream Builder', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/stream_builder_widget_.dart", screenName: const StreamBuilderScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 39, title: 'Tooltip', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/tool_tip_widget_.dart", screenName: const ToolTipWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 40, title: 'Fractionally Sized Box', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/fractionally_sized_box_widget_.dart", screenName: const FractionallySizedBoxWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 41, title: 'Single Child Scroll View', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/single_child_scroll_view_widget_.dart", screenName: const SingleChildScrollViewWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 42, title: 'Data Table', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/data_table_widget_.dart", screenName: const DataTableWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 43, title: 'Clip Rect', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/clip_rect_widget_.dart", screenName: const ClipRectWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 44, title: 'Selectable Text', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/selectable_text_widget_.dart", screenName: const SelectableTextWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 45, title: 'Placeholder', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/place_holder_widget_.dart", screenName: const PlaceHolderWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 46, title: 'Radio Button', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/radio_button_widget_.dart", screenName: RadioButtonWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 47, title: 'CheckBox', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/check_box_widget_.dart", screenName: const CheckBoxWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 48, title: 'Floating Action Button', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/floating_action_button_widget_.dart", screenName: const FloatingActionButtonWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 49, title: 'List Wheel ScrollView', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/list_wheel_scroll_view_widget_.dart", screenName: const ListWheelScrollViewWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 50, title: 'Animated Padding', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/animated_padding_widget_.dart", screenName: const AnimatedPaddingWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 51, title: 'Shader Mask', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/shader_mask_widget_.dart", screenName: const ShaderMaskWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 52, title: 'Animated Cross Fade', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/animated_cross_fade_widget_.dart", screenName: const AnimatedCrossFadeScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 53, title: 'Animated Container', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/animated_container_widget_.dart", screenName: const AnimatedContainerWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 54, title: 'Animated List', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/animated_list_widget_.dart", screenName: const AnimatedListWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 55, title: 'Page View', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/page_view_widget_.dart", screenName: const PageViewWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 56, title: 'Aspect Ratio', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/aspect_ratio_widget_.dart", screenName: const AspectRatioScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 57, title: 'Divider', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/divider_widget_.dart", screenName: const DividerWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 58, title: 'Absorb Pointer', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/absorb_pointer_widget_.dart", screenName: const AbsorbPointerWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 59, title: 'Ignore Pointer', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/ignore_pointer_widget_.dart", screenName: const IgnorePointerScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 60, title: 'Indexed Stack', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/indexed_stack_widget_.dart", screenName: const IndexedStackWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 61, title: 'Fade in image', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/fade_in_image_.dart", screenName: const FadeInImageScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 62, title: 'Clip Oval', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/clip_oval_widget_.dart", screenName: const ClipOvalWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 63, title: 'About Dialog', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/about_dialog_widget.dart", screenName: const AboutDialogScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 64, title: 'Safe Area', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/safe_area_widget_.dart", screenName: const SafeAreaWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 65, title: 'Padding', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/padding_widget_.dart", screenName: const PaddingWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 66, title: 'Color Filtered', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/color_filtered_widget_.dart", screenName: const ColorFilteredWidget(), details: "An application that uses Material Design."),
    WidgetModel(id: 67, title: 'Media Query', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/media_query_screen_.dart", screenName: const MediaQueryScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 68, title: 'Builder', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/builder_widget_screen_.dart", screenName: const BuilderWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 69, title: 'Value Listenable Builder', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/value_listenable_builder_screen_.dart", screenName: ValueListenableBuilderScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 70, title: 'Tween Animation Builder', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/tween_animation_builder_screen_.dart", screenName: const TweenAnimationBuilderScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 71, title: 'Layout Builder', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/layout_builder_widget_.dart", screenName: const LayoutBuilderScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 72, title: 'Clip Path', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/clip_path_screen_.dart", screenName: const ClipPathScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 73, title: 'Animated Positioned', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/animated_position_widget_.dart", screenName: const AnimatedPositionScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 74, title: 'Align', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/align_widget_.dart", screenName: const AlignWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 75, title: 'Decorated Box', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/decorated_box_widget_.dart", screenName: const DecoratedBoxScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 76, title: 'Flexible', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/flexible_widget_.dart", screenName: const FlexibleWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 77, title: 'Switch List Tile', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/switch_list_tile_widget_.dart", screenName: const SwitchListTileScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 78, title: 'Radio List Tile', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/radio_list_tile_widget_.dart", screenName: const RadioListTileWidget(), details: "An application that uses Material Design."),
    WidgetModel(id: 79, title: 'Checkbox List Tile', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/check_box_list_tile_screen_.dart", screenName: const CheckBoxListTileScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 80, title: 'Action Chip', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/action_chip_widget_.dart", screenName: const ActionChipWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 81, title: 'Choice Chip', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/choice_chip_widget_.dart", screenName: const ChoiceChipWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 82, title: 'Input Chip', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/input_chip_widget_.dart", screenName: const InputChipWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 83, title: 'Filter Chip', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/filter_chip_widget_.dart", screenName: const FilterChipWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 84, title: 'Draggable Scrollable Sheet', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/draggable_scrollable_sheet_.dart", screenName: const DraggableScrollableSheetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 85, title: 'Fade Transition', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/fade_transition_widget_.dart", screenName: const FadeTransitionWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 86, title: 'Interactive Viewer', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/interactive_viewer_screen_.dart", screenName: const InterActiveViewerScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 87, title: 'Image Filtered', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/image_filter_widget_.dart", screenName: const ImageFilterWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 88, title: 'Physical Model', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/physical_model_screen_.dart", screenName: const PhysicalModelScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 89, title: 'Expansion Panel List', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/expansion_panel_list_screen_.dart", screenName: const ExpansionPanelListScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 90, title: 'Flutter Logo', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/flutter_logo_widget_.dart", screenName: const FlutterLogoWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 91, title: 'Mouse Region', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/mouse_region_widget_.dart", screenName: const MouseRegionWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 92, title: 'Flow', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/flow_widget_screen_.dart", screenName: const FlowWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 93, title: 'Tab Page Selector', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/tab_page_selector_screen_.dart", screenName: const TabPageSelectorScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 94, title: 'Refresh Indicator', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/refresh_indicator_widget_.dart", screenName: RefreshIndicatorWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 95, title: 'Gesture Detector', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/gesture_detector_screen_.dart", screenName: const GestureDetectorScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 96, title: 'Baseline', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/baseline_screen_.dart", screenName: const BaseLineScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 97, title: 'Autocomplete', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/auto_complete_screen_.dart", screenName: const AutoCompleteScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 98, title: 'Linear Gradient', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/linear_gradient_widget_.dart", screenName: const LinearGradientWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 99, title: 'Animation Task', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/animation_task_.dart", screenName: const AnimationTask(), details: "An application that uses Material Design."),
    WidgetModel(id: 100, title: 'Custom Paint', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/custom_paint_widget_.dart", screenName: const CustomPaintWidget(), details: "An application that uses Material Design."),
    WidgetModel(id: 101, title: 'Flipping Card', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/flipping_card_widget_.dart", screenName: const FlippingCardWidget(), details: "An application that uses Material Design."),
    WidgetModel(id: 102, title: 'Repaint Boundary', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/re_paint_boundary_widget_.dart", screenName: const RepaintBoundaryWidgetScreen(), details: "An application that uses Material Design."),
    WidgetModel(id: 103, title: 'Flutter 3D Cube Effect', isFavorite: false.obs, codeFilePath: "lib/Screens/WidgetsScreens/flutter_3d_cube_effect.dart", screenName: const Flutter3DCubeEffect(), details: "An application that uses Material Design."),
  ].obs;

  Rx<List<WidgetModel>> searchWidgets = Rx<List<WidgetModel>>([]);

  /// load wish list from your local storage
  Future<void> loadWishListItems() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      List<int> wishListIds = prefs.getStringList('wishListIds')?.map((id) => int.parse(id)).toList() ?? [];

      for (var item in widgetList) {
        item.isFavorite.value = wishListIds.contains(item.id);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error Loading wish list item : $e");
      }
    }
  }

  /// Save wish list
  Future<void> saveWishListItems() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<int?> wishListIds = widgetList.where((item) => item.isFavorite.value).map((item) => item.id).toList();
      await prefs.setStringList('wishListIds', wishListIds.map((id) => id.toString()).toList());
    } catch (e) {
      if (kDebugMode) {
        print("Error saving wish list item : $e");
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    searchWidgets.value = widgetList;
    loadWishListItems();
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

  /// search functionality
  void searchFilterWidget({String? title}) {
    List<WidgetModel> results = [];
    if (title?.isNotEmpty ?? false) {
      results = widgetList.where((element) => element.title.toString().toLowerCase().contains(title!.toLowerCase())).toList();
    } else {
      results = widgetList;
    }
    searchWidgets.value = results;
  }

  /// Use this to retrieve all Widgets
  List<WidgetModel> get widgets {
    return [...widgetList];
  }

  /// This will return the Widgets that were added to wish list
  List<WidgetModel> get wishListItems {
    return widgetList.where((item) => item.isFavorite.value == true).toList();
  }

  /// Add an item to the wish list
  void addItem(int id) {
    final int index = widgetList.indexWhere((item) => item.id == id);
    widgetList[index].isFavorite.value = true;
    saveWishListItems();
  }

  /// Remove an item from the wish list
  void removeItem(int id) {
    final int index = widgetList.indexWhere((item) => item.id == id);
    widgetList[index].isFavorite.value = false;
    saveWishListItems();
  }
}
