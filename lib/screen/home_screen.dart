import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_user/helpers/user_api_helper.dart';
import 'package:random_user/model/use_random_model.dart';
import 'package:random_user/uttls/app_componet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserDataModel userData = UserDataModel();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      UserDataModel? user = await UserApiHelper.userApiHelper.getUserData();
      if (user != null) {
        userData = user;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xff8d82fc),
      body: (userData.results.isNotEmpty)
          ? Stack(children: [
              Column(
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(CupertinoIcons.home, color: Colors.white),
                        Text("Profile",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Icon(Icons.more_vert, color: Colors.white),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      children: [
                        const Text("Welcome!",
                            style:
                                TextStyle(fontSize: 25, color: Colors.white)),
                        Text(
                          "  ${userData.results[0].name?.title ?? ""}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.white,
                                foregroundImage: NetworkImage(userData.results[0].picture!.medium!),
                                backgroundImage: (userData.results[0].name?.title == "Mrs" || userData.results[0].name?.title == "Miss" || userData.results[0].name?.title == "Ms")
                                    ? const AssetImage("asset/img/female.png")
                                    : const AssetImage("asset/img/male.png"),
                                // child: CachedNetworkImage(
                                //   imageUrl:
                                //       userData.results[0].picture!.medium!,
                                //   placeholder: (context, _) {
                                //     return (userData.results[0].name?.title == "Mrs")
                                //         ? Image.asset("asset/img/female.png")
                                //         : Image.asset("asset/img/male.png");
                                //   },
                                // ),
                                // NetworkImage(
                                //
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(userData.results[0].login?.username ?? "",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Icon(Icons.location_on,
                                    color: Colors.white70, size: 20),
                                Text(
                                    "  ${userData.results[0].location?.country ?? ""}",
                                    style:
                                        const TextStyle(color: Colors.white70)),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: _size.height / 2,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20))),
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Personal Information",
                                style: TextStyles.titleStyle
                                    .copyWith(fontSize: 17)),
                            const SizedBox(height: 5),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 8,
                                      spreadRadius: 0.5,
                                    )
                                  ]),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Id:",
                                          style: TextStyles.titleStyle),
                                      const Spacer(),
                                      Text(userData.results[0].id?.name ?? "",
                                          style: TextStyles.textStyle)
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Name:",
                                          style: TextStyles.titleStyle),
                                      const Spacer(),
                                      Text(
                                          "${userData.results[0].name?.title ?? ""} ${userData.results[0].name?.first ?? ""} ${userData.results[0].name?.last ?? ""}",
                                          style: TextStyles.textStyle)
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Email:",
                                          style: TextStyles.titleStyle),
                                      const Spacer(),
                                      Flexible(
                                        child: Text(
                                            userData.results[0].email ?? "",
                                            style: TextStyles.textStyle),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Phone:",
                                          style: TextStyles.titleStyle),
                                      const Spacer(),
                                      Text(userData.results[0].phone ?? "",
                                          style: TextStyles.textStyle)
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Cell:",
                                          style: TextStyles.titleStyle),
                                      const Spacer(),
                                      Text(userData.results[0].cell ?? "",
                                          style: TextStyles.textStyle)
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text("Address",
                                style: TextStyles.titleStyle
                                    .copyWith(fontSize: 17)),
                            const SizedBox(height: 5),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 8,
                                      spreadRadius: 0.5,
                                    )
                                  ]),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Street: ",
                                          style: TextStyles.titleStyle),
                                      const Spacer(),
                                      Flexible(
                                        flex: 5,
                                        child: Text(
                                          "${userData.results[0].location?.street?.number ?? "0"}, ${userData.results[0].location?.street?.name ?? ""}",
                                          style: TextStyles.textStyle,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("City: ",
                                          style: TextStyles.titleStyle),
                                      const Spacer(),
                                      Text(
                                        userData.results[0].location?.city ??
                                            "City",
                                        style: TextStyles.textStyle,
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("State: ",
                                          style: TextStyles.titleStyle),
                                      const Spacer(),
                                      Text(
                                        userData.results[0].location?.state ??
                                            "State",
                                        style: TextStyles.textStyle,
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Country: ",
                                          style: TextStyles.titleStyle),
                                      const Spacer(),
                                      Text(
                                        userData.results[0].location?.country ??
                                            "Country",
                                        style: TextStyles.textStyle,
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("PostCode: ",
                                          style: TextStyles.titleStyle),
                                      const Spacer(),
                                      Text(
                                        "${userData.results[0].location?.postcode ?? "0"}",
                                        style: TextStyles.textStyle,
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
              Positioned(
                height: 50,
                width: 50,
                right: 50,
                bottom: _size.height / 2 - 20,
                child: InkWell(
                  onTap: () async {
                    setState(() {
                      UserApiHelper.userApiHelper.isGettingData = true;
                    });

                    UserDataModel? user =
                        await UserApiHelper.userApiHelper.getUserData();

                    if (user != null) {
                      userData = user;
                    }
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: (UserApiHelper.userApiHelper.isGettingData)
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.black,
                              strokeWidth: 3,
                            ))
                        : const Icon(Icons.refresh_sharp,
                            color: Colors.black, size: 30),
                  ),
                ),
              )
            ])
          : const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
    );
  }
}
