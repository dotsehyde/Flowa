import 'package:flowa/features/home/controller/home.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ElectricPage extends StatelessWidget {
  ElectricPage({super.key});
  final PageController _pageController =
      PageController(initialPage: HomeController.to.electricTab.value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Electric",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary),
        ),
      ),
      // backgroundColor: Color(0xFFCFD8E7),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: .5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(10)),
                width: 100.sw,
                margin: EdgeInsets.symmetric(vertical: 2.sh),
                padding: EdgeInsets.symmetric(vertical: 1.sh, horizontal: 3.sw),
                child: Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElectricTab(
                        index: 0,
                        title: "Electricity Token",
                        onTap: () {
                          HomeController.to.electricTab.value = 0;
                          _pageController.animateToPage(
                            0,
                            duration: 300.ms,
                            curve: Curves.easeInOut,
                          );
                        },
                        selected: HomeController.to.electricTab.value == 0,
                      ),
                      ElectricTab(
                        index: 1,
                        title: "Bill",
                        onTap: () {
                          HomeController.to.electricTab.value = 1;
                          _pageController.animateToPage(
                            1,
                            duration: 300.ms,
                            curve: Curves.easeInOut,
                          );
                        },
                        selected: HomeController.to.electricTab.value == 1,
                      ),
                    ],
                  );
                })).paddingSymmetric(horizontal: 5.sw),
            Expanded(
              child: SizedBox(
                  width: 100.sw,
                  child: PageView(
                    controller: _pageController,
                    pageSnapping: true,
                    physics: BouncingScrollPhysics(),
                    onPageChanged: (index) =>
                        HomeController.to.electricTab.value = index,
                    children: [
                      _ElectricityTokenView()
                          .animate()
                          .fadeIn()
                          .slideY(
                            begin: .1,
                            end: 0,
                          )
                          .paddingSymmetric(horizontal: 5.sw),
                      _BillView().animate().fadeIn().slideY(
                            begin: .1,
                            end: 0,
                          ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class _ElectricityTokenView extends StatelessWidget {
  const _ElectricityTokenView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        spacing: 2.5.sh,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.sw, vertical: .5.sh),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 1.sh,
                    children: [
                      Text(
                        "Electricity Token",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.grey),
                      ).paddingTop(1.sh),
                      TextField(
                        style: Theme.of(context).textTheme.bodySmall!,
                        decoration: InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: "**** **** **** ****"),
                      ).paddingBottom(1.sh)
                    ],
                  ),
                ),
                CupertinoButton.tinted(
                    borderRadius: BorderRadius.circular(15.sp),
                    sizeStyle: CupertinoButtonSize.small,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withValues(alpha: 0.2),
                    child: Text(
                      "check",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold),
                    ).paddingAll(8.sp),
                    onPressed: () {
                      HapticFeedback.lightImpact();
                    }).paddingSymmetric(horizontal: 1.sw)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.sw, vertical: .5.sh),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 1.sh,
                    children: [
                      Text(
                        "Enter Amount",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.grey),
                      ).paddingTop(1.sh),
                      TextField(
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            prefix: Text("\$").paddingRight(.5.sw),
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Colors.grey,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                            hintText: "150"),
                      ).paddingBottom(1.sh)
                    ],
                  ),
                ),
              ],
            ),
          ),
          CupertinoButton.filled(
              onPressed: () {
                HapticFeedback.mediumImpact();
              },
              child: Text(
                "BUY",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16.sp,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )).withWidth(80.sw).withHeight(8.sh),
        ],
      ),
    );
  }
}

class _BillView extends StatelessWidget {
  const _BillView();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          HomeController.to.seeAllBills.value
              ? SizedBox.shrink()
              : SizedBox(
                  height: 35.sh,
                  width: 100.sw,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(3.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.sp),
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withValues(alpha: .1),
                        ),
                        child: Icon(Icons.bolt,
                            size: 35.sp,
                            color: Theme.of(context).colorScheme.secondary),
                      ).paddingBottom(3.sh),
                      Text(
                        "\$50.00",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 22.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "need to be paid",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 14.sp, color: Colors.grey),
                      )
                    ],
                  ),
                ),
          Expanded(
            child: AnimatedContainer(
              duration: 300.ms,
              padding: EdgeInsets.only(top: 3.sh, left: 5.sw, right: 5.sw),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x89A2A2A2),
                    blurRadius: 25.sp,
                    spreadRadius: 5.sp,
                    offset: Offset(0, .5.sp),
                  )
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.sp),
                    topRight: Radius.circular(20.sp)),
              ),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Bills Enquiry",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 17.sp,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.bold),
                        ),
                        CupertinoButton(
                            sizeStyle: CupertinoButtonSize.small,
                            child: Text(
                              HomeController.to.seeAllBills.value
                                  ? "Hide All"
                                  : "See All",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      // fontSize: 20.sp,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold),
                            )
                                .animate(
                                    target: HomeController.to.seeAllBills.value
                                        ? 1
                                        : 1)
                                .fade(duration: 1000.ms),
                            onPressed: () {
                              HomeController.to.seeAllBills.value =
                                  !HomeController.to.seeAllBills.value;
                            })
                      ]).paddingBottom(2.sh),
                  Expanded(
                    child: ListView(
                      children: [
                        BillItem(
                          title: "My house",
                          amount: "\$15",
                          color: Colors.blue.shade600,
                          icon: CupertinoIcons.home,
                        ),
                        BillItem(
                          title: "My office",
                          amount: "\$35",
                          color: Colors.green.shade600,
                          icon: Icons.work,
                        ),
                        BillItem(
                          title: "My villa",
                          amount: "\$5",
                          color: Colors.purple.shade600,
                          icon: Icons.location_city_rounded,
                        ),
                        BillItem(
                          title: "My garage",
                          amount: "\$105",
                          color: Colors.orange.shade600,
                          icon: Icons.car_rental,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}

class ElectricTab extends StatelessWidget {
  final String title;
  final bool selected;
  final int index;
  final VoidCallback? onTap;

  const ElectricTab({
    super.key,
    required this.title,
    this.onTap,
    required this.selected,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 51.sp,
        child: Stack(
          children: [
            Positioned.fill(
              child: AnimatedContainer(
                duration: 300.ms,
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: selected
                      ? Theme.of(context).colorScheme.secondary
                      : Colors.transparent,
                ),
              )
                  .animate(
                    target: selected ? 1 : 0,
                  )
                  .slideY()
                  .fadeIn(),
            ),
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 15.sp,
                      color: selected ? Colors.white : Colors.black,
                    ),
              ).paddingAll(12.sp),
            ),
          ],
        ),
      ),
    );
  }
}

class BillItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String amount;
  const BillItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.color,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.sh),
      padding: EdgeInsets.symmetric(horizontal: 3.5.sw, vertical: 1.5.sh),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              spacing: 3.sw,
              children: [
                CircleAvatar(
                  radius: 20.sp,
                  backgroundColor: color,
                  child: Icon(icon),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 1.sh,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      "**** **** **** ****",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  amount,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
