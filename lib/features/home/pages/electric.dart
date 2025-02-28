import 'package:flowa/features/home/controller/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
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
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
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
                        },
                        selected: HomeController.to.electricTab.value == 0,
                      ),
                      ElectricTab(
                        index: 1,
                        title: "Bill",
                        onTap: () {
                          HomeController.to.electricTab.value = 1;
                        },
                        selected: HomeController.to.electricTab.value == 1,
                      ),
                    ],
                  );
                })),
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
                      _ElectricityTokenView().animate().fadeIn().slideY(
                            begin: .1,
                            end: 0,
                          ),
                      _BillView().animate().fadeIn().slideY(
                            begin: .1,
                            end: 0,
                          ),
                    ],
                  )),
            ),
          ],
        ).paddingSymmetric(horizontal: 5.sw),
      ),
    );
  }
}

class _ElectricityTokenView extends StatelessWidget {
  const _ElectricityTokenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Electricity Token"),
      ],
    );
  }
}

class _BillView extends StatelessWidget {
  const _BillView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Bill"),
      ],
    );
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
