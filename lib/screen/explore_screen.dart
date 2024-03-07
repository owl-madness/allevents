import 'package:allevents/controller/category_provider.dart';
import 'package:allevents/screen/event_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:social_share/social_share.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<CategoryController>(context, listen: false)
          .fetchCategoryList(context);
      await Provider.of<CategoryController>(context, listen: false)
          .fetchCategoryDetailsList(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet: _bottomSheet,
      appBar: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (context) => _bottomSheet(context),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.category,
                          size: 15,
                        ),
                        Text(
                          'Category',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Null,
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 15,
                        ),
                        Text(
                          'Date & Time',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Null,
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.sort,
                          size: 15,
                        ),
                        Text(
                          'Sort',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
      body: Consumer<CategoryController>(
        builder: (context, categoryController, child) {
          return Center(
              child: Container(
            color: categoryController.isLoading
                ? Colors.transparent
                : Colors.black12,
            child: categoryController.isLoading
                ? const CircularProgressIndicator()
                : SingleChildScrollView(
                    child: Column(
                      children: categoryController.categoryDetailsList
                          .map((eventItem) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 28.0, vertical: 8.0),
                                child: GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EventDetailsScreen(
                                                eventItem: eventItem),
                                      )),
                                  child: Container(
                                    height: 140,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: SizedBox(
                                            height: double.maxFinite,
                                            width: 140,
                                            child: Image.network(
                                                eventItem.thumbUrl!),
                                          ),
                                        ),
                                        const SizedBox(width: 8.0),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 8.0,
                                            ),
                                            SizedBox(
                                                width: 180,
                                                child: Text(
                                                  eventItem.eventname!,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )),
                                            const SizedBox(
                                              height: 3.0,
                                            ),
                                            SizedBox(
                                                width: 180,
                                                child: Text(
                                                  eventItem.startTimeDisplay!,
                                                  style: const TextStyle(
                                                      fontSize: 11),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )),
                                            const SizedBox(
                                              height: 3.0,
                                            ),
                                            SizedBox(
                                                width: 200,
                                                child: Text(
                                                  eventItem.location!,
                                                  style: const TextStyle(
                                                      fontSize: 11),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )),
                                            const SizedBox(
                                              height: 3.0,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Stack(
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: CircleAvatar(
                                                        foregroundImage: AssetImage(
                                                            'assets/images/person1.jpeg'),
                                                        maxRadius: 11,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 12.0),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: CircleAvatar(
                                                          foregroundImage:
                                                              AssetImage(
                                                                  'assets/images/person2.jpg'),
                                                          maxRadius: 11,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 22.0),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: CircleAvatar(
                                                          foregroundImage:
                                                              AssetImage(
                                                                  'assets/images/person3.jpg'),
                                                          maxRadius: 11,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 2,
                                                ),
                                                const Text(
                                                  '+20 Going',
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 9),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () => SocialShare
                                                          .shareOptions(eventItem
                                                                  .eventname ??
                                                              ''),
                                                      child: Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        11),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black38)),
                                                        child: const Icon(
                                                          Icons.share,
                                                          size: 15,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          eventItem
                                                                  .isFavourite =
                                                              !eventItem
                                                                  .isFavourite;
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(SnackBar(
                                                                  content: Text(eventItem
                                                                          .isFavourite
                                                                      ? 'Added to favourite'
                                                                      : 'Removed from favourite')));
                                                        });
                                                        // categoryController.addToFavourites(eventItem);
                                                      },
                                                      child: Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        11),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black38)),
                                                        child: Icon(
                                                          eventItem.isFavourite
                                                              ? Icons.star
                                                              : Icons
                                                                  .star_border_outlined,
                                                          size: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 3.0,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
          ));
        },
      ),
    );
  }

  Widget _bottomSheet(BuildContext context) {
    return Consumer<CategoryController>(
      builder: (context, categoryController, child) => Container(
        height: 500,
        width: MediaQuery.sizeOf(context).width - 8.0,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 5,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.black38),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Categories',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                children: categoryController.categoryList
                    .map((category) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8.0),
                          child: GestureDetector(
                            onTap: () => categoryController.onSelectCategory(
                                category, context),
                            child: Container(
                              constraints: const BoxConstraints(minWidth: 80),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 8.0),
                              decoration: BoxDecoration(
                                  color: category.data ==
                                          categoryController
                                              .selectedCategory?.data
                                      ? Colors.blue
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(13),
                                  border: Border.all(
                                      color: Colors.black, width: 0.5)),
                              child: Text(
                                category.category!,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
