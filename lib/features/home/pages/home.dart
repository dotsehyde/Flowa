import 'package:flowa/features/home/widgets/home_card.widget.dart';
import 'package:flowa/features/home/widgets/home_menu.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: Container(
                  width: 100.w,
                  height: 35.sh,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/img/home_bg.png"),
                          fit: BoxFit.cover)),
                  child: SafeArea(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          spacing: 2.sw,
                          children: [
                            CircleAvatar(
                                radius: 20, backgroundColor: Colors.tealAccent),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Welcome Back",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white),
                                ).animate().fadeIn(),
                                Text("Name",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: Colors.white))
                                    .animate()
                                    .fadeIn(),
                              ],
                            ),
                          ],
                        ),
                        Badge.count(
                          count: 0,
                          padding: EdgeInsets.zero,
                          alignment: Alignment.topRight,
                          child: IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                Icons.notifications_outlined,
                                color: Colors.white,
                                size: 22.sp,
                              )),
                        )
                      ],
                    ).paddingSymmetric(horizontal: 5.sw).paddingTop(2.sh),
                  ),
                ),
              ),
              //Services
              Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: 100.sw,
                    height: 75.sh,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 2.sh,
                      children: [
                        Text(
                          "All Services",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 18.sp, fontWeight: FontWeight.bold),
                        )
                            .withWidth(100.sw)
                            .paddingSymmetric(horizontal: 5.sw)
                            .paddingTop(25.sh)
                            .animate()
                            .fade(
                              duration: 300.ms,
                            )
                            .slideY(
                                begin: -.3,
                                end: 0,
                                duration: 300.ms,
                                curve: Curves.easeInOut),
                        Expanded(
                          child: GridView(
                            padding: EdgeInsets.symmetric(horizontal: 6.sw),
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 3,
                                    mainAxisExtent: 36.sp,
                                    maxCrossAxisExtent: 70.sp),
                            children: [
                              HomeMenuCard(
                                bgColor: Colors.pink.shade300,
                                icon: Icon(Icons.electric_bolt_sharp,
                                    color: Colors.pink.shade700),
                                title: "Electric",
                                onTap: () {
                                  context.push("/home/electric");
                                },
                              ),
                              HomeMenuCard(
                                bgColor: Colors.purple.shade300,
                                icon: Icon(Icons.shopping_cart,
                                    color: Colors.purple.shade700),
                                title: "Merchant",
                                onTap: () {},
                              ),
                              HomeMenuCard(
                                bgColor: Colors.blue.shade300,
                                icon: Icon(CupertinoIcons.globe,
                                    color: Colors.blue.shade700),
                                title: "Internet",
                                onTap: () {},
                              ),
                              HomeMenuCard(
                                bgColor: Colors.yellow.shade300,
                                icon: Icon(CupertinoIcons.ticket,
                                    color: Colors.yellow.shade800),
                                title: "Ticket",
                                onTap: () {},
                              ),
                              HomeMenuCard(
                                bgColor: Colors.orange.shade300,
                                icon: Icon(Icons.phone_android_rounded,
                                    color: Colors.orange.shade700),
                                title: "Mobile",
                                onTap: () {},
                              ),
                              HomeMenuCard(
                                bgColor: Colors.indigo.shade300,
                                icon: Icon(CupertinoIcons.arrow_up_arrow_down,
                                    color: Colors.indigo.shade700),
                                title: "Transfer",
                                onTap: () {},
                              ),
                              HomeMenuCard(
                                bgColor: Colors.red.shade200,
                                icon: Icon(Icons.category_rounded,
                                    color: Colors.red.shade700),
                                title: "More",
                              ),
                            ],
                          )
                              .animate()
                              .slideY(
                                begin: 1,
                                end: 0,
                                delay: 130.ms,
                                duration: 300.ms,
                                curve: Curves.easeInOut,
                              )
                              .fadeIn(),
                        ),
                      ],
                    ),
                  )),
              //Card
              Positioned(
                  top: 18.sh,
                  child: Container(
                    width: 100.sw,
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withValues(alpha: 0.18),
                                offset: Offset(-1, 6),
                                blurRadius: 49,
                                spreadRadius: 0)
                          ]),
                      width: 90.sw,
                      height: 30.sh,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Balance",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 15.sp, color: Colors.grey),
                              ),
                              Text(
                                "ACTIVE",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 15.sp,
                                        color: context.primaryColor,
                                        fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Text(
                            "\$ 700",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 20.sp,
                                    ),
                          ),
                          Divider(
                            color: Colors.grey.shade300,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              HomeTopCard(
                                label: "Transfer",
                                icon: Icon(Icons.send_rounded),
                              ),
                              HomeTopCard(
                                label: "Withdraw",
                                icon: Icon(Icons.wallet),
                              ),
                              HomeTopCard(
                                label: "Top Up",
                                icon: Icon(Icons.wallet_membership),
                              ),
                              HomeTopCard(
                                label: "Deposit",
                                icon: Icon(Icons.add),
                              )
                            ],
                          ).paddingTop(3.sh)
                        ],
                      )
                          .paddingSymmetric(horizontal: 5.sw, vertical: 2.sh)
                          .paddingTop(1.sh),
                    ),
                  )),
            ],
          )),
    );
  }
}
