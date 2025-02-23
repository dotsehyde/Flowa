import 'package:flowa/features/home/widgets/home_card.widget.dart';
import 'package:flutter/material.dart';
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
                      color: Colors.red,
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
                                  style: context.textTheme.bodyMedium!
                                      .copyWith(color: Colors.white),
                                ),
                                Text("Name",
                                    style: context.textTheme.bodyMedium!
                                        .copyWith(color: Colors.white)),
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
                    ).paddingSymmetric(horizontal: 5.sw),
                  ),
                ),
              ),
              //Services
              Positioned(
                  bottom: 0,
                  child: Container(
                    width: 100.sw,
                    height: 70.sh,
                    color: Colors.amber,
                  )),
              //Card
              Positioned(
                  top: 20.sh,
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
                      height: 28.sh,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Balance",
                                style: context.textTheme.bodyLarge!.copyWith(
                                    fontSize: 14.sp, color: Colors.grey),
                              ),
                              Text(
                                "ACTIVE",
                                style: context.textTheme.bodyLarge!.copyWith(
                                    fontSize: 14.sp,
                                    color: context.primaryColor),
                              )
                            ],
                          ),
                          Text(
                            "\$ 700",
                            style: context.textTheme.bodyLarge!.copyWith(
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
                          ).paddingTop(2.sh)
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
