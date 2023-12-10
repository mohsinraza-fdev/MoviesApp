import 'package:flutter/material.dart';
import 'package:ten_twenty_test/app/core/core_views/core_view.dart';
import 'package:ten_twenty_test/presentation/dashboard/modules/watch/modules/watch_trailer/view_model/watch_trailer_view_model.dart';
import 'package:ten_twenty_test/shared/enums/app_device_orientation_enum.dart';
import 'package:ten_twenty_test/shared/helpers/app_device.dart';
import 'package:ten_twenty_test/shared/helpers/utils.dart';
import 'package:ten_twenty_test/widgets/others/app_loading_indicator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchTrailerView extends CoreView<WatchTrailerViewModel> {
  final String linkCode;
  const WatchTrailerView({
    super.key,
    required this.linkCode,
  });

  @override
  Widget builder(
      BuildContext context, WatchTrailerViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: viewModel.controller == null
          ? const AppLoadingIndicator()
          : Center(
              child: YoutubePlayer(
                controller: viewModel.controller!,
                width: screenWidth(context),
                aspectRatio: AppDevice.of(context).orientation ==
                        AppDeviceOrientation.landscape
                    ? screenWidth(context) / screenHeight(context)
                    : screenHeight(context) / screenWidth(context),
                bottomActions: [
                  CurrentPosition(),
                  ProgressBar(isExpanded: true),
                  RemainingDuration(),
                ],
              ),
            ),
    );
  }

  @override
  WatchTrailerViewModel viewModelBuilder(BuildContext context) {
    return WatchTrailerViewModel(linkCode: linkCode);
  }
}
