import 'package:auto_size_text/auto_size_text.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../extensions/hover_extensions.dart';
import '../../generated/my_icons.dart';
import '../../themes/colors.dart';
import '../../themes/fonts.dart';
import 'project_buttons.dart';

class Project extends StatelessWidget {
  const Project(
      {@required this.projectName,
      @required this.projectDesc,
      @required this.pathToImage,
      @required this.designURL,
      @required this.appURL});

  final String projectName, projectDesc, pathToImage, designURL, appURL;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: (width > 1023) ? width / 3 : width,
      child: Card(
        color: MyColors.primaryColorLight,
        borderOnForeground: false,
        clipBehavior: Clip.hardEdge,
        elevation: 10,
        margin: const EdgeInsets.only(top: 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
                borderOnForeground: false,
                clipBehavior: Clip.hardEdge,
                elevation: 0,
                margin: const EdgeInsets.only(bottom: 10),
                shape: const RoundedRectangleBorder(),
                child: Image.asset(pathToImage).zoomInOnHover.colorOnHover),
            ExpandablePanel(
              theme: const ExpandableThemeData(
                  iconColor: MyColors.accentColor,
                  iconPadding: EdgeInsets.symmetric(horizontal: 15),
                  iconSize: 18,
                  fadeCurve: Curves.fastOutSlowIn,
                  sizeCurve: Curves.easeInToLinear,
                  expandIcon: MyIcon.caret_down,
                  collapseIcon: MyIcon.caret_up,
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                  useInkWell: false),
              header: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: SizedBox(
                  height: 35,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 35),
                        Text(projectName, textAlign: TextAlign.center, softWrap: true, style: MyTextStyles.bodyText2),
                      ],
                    ),
                  ),
                ),
              ),
              expanded: Column(
                children: [
                  const SizedBox(height: 10),
                  FractionallySizedBox(
                    widthFactor: 0.85,
                    child: AutoSizeText(projectDesc,
                        textAlign: TextAlign.justify,
                        maxLines: 8,
                        maxFontSize: 20,
                        softWrap: true,
                        style: MyTextStyles.bodyText1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ProjectButtonBar(designURL, appURL, isWide: width > 399),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
