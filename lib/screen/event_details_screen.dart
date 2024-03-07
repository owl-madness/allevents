import 'package:allevents/model/category_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_share/social_share.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key, required this.eventItem});
  final Item eventItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          eventItem.eventname ?? '',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                border: Border.all(color: Colors.black38)),
            child: GestureDetector(
                onTap: () =>
                    SocialShare.shareOptions(eventItem.eventname ?? ''),
                child: const Icon(
                  Icons.ios_share,
                  size: 15,
                )),
          ),
          const SizedBox(width: 15),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(25)),
        child: TextButton(
          onPressed: () => null,
          child: const Text(
            'Book Now',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.maxFinite,
              child: Image.network(
                eventItem.bannerUrl!,
                fit: BoxFit.fitWidth,
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 180,
                            child: Text(
                              eventItem.eventname!,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Stack(
                              textDirection: TextDirection.rtl,
                              alignment: Alignment.bottomLeft,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: CircleAvatar(
                                    foregroundImage: AssetImage(
                                        'assets/images/person1.jpeg'),
                                    maxRadius: 16,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: CircleAvatar(
                                      foregroundImage: AssetImage(
                                          'assets/images/person2.jpg'),
                                      maxRadius: 16,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 40.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: CircleAvatar(
                                      foregroundImage: AssetImage(
                                          'assets/images/person3.jpg'),
                                      maxRadius: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '+20 Going',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(color: Colors.black38)),
                      child: Icon(
                        eventItem.isFavourite
                            ? Icons.star
                            : Icons.star_border_outlined,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      Icon(Icons.calendar_month),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Date & Time',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(eventItem.startTimeDisplay!),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Icon(Icons.location_pin),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Venue',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(eventItem.startTimeDisplay!),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'View Map',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      try {
                        Uri email = Uri(
                            scheme: 'https',
                            path:
                                "www.google.com/maps/@?api=1&map_action=map&center=${eventItem.venue?.latitude},${eventItem.venue?.longitude}");
                        await launchUrl(email);
                      } catch (e) {
                        debugPrint('e : ${e.toString()}');
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        width: double.maxFinite,
                        height: 150,
                        child: Image.asset(
                          'assets/images/google_map.jpg',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
