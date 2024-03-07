import 'package:allevents/model/category_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key, required this.eventItem});
  final Item eventItem;

  @override
  Widget build(BuildContext context) {
    print('location ${eventItem.location}');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          eventItem.eventname ?? '',
          style: TextStyle(
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
                child: Icon(
                  Icons.ios_share,
                  size: 15,
                )),
          ),
          SizedBox(width: 15),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(25)),
        child: TextButton(
          onPressed: () => null,
          child: Text(
            'Book Now',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
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
            margin: EdgeInsets.symmetric(vertical: 10),
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
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Stack(
                            textDirection: TextDirection.rtl,
                            alignment: Alignment.bottomLeft,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                  foregroundImage:
                                      AssetImage('assets/images/person1.jpeg'),
                                  maxRadius: 16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: CircleAvatar(
                                    foregroundImage:
                                        AssetImage('assets/images/person2.jpg'),
                                    maxRadius: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: CircleAvatar(
                                    foregroundImage:
                                        AssetImage('assets/images/person3.jpg'),
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
                      SizedBox(
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
                      Icons.star_border_outlined,
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
                SizedBox(
                  height: 15,
                ),
                Row(
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
                SizedBox(
                  height: 15,
                ),
                Text(eventItem.startTimeDisplay!),
                SizedBox(
                  height: 20,
                ),
                Row(
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
                SizedBox(
                  height: 15,
                ),
                Text(eventItem.startTimeDisplay!),
                SizedBox(
                  height: 15,
                ),
                // Text(
                //   'View Map',
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // SizedBox(
                //   height: 15,
                // ),
                // Container(
                //   height: 100,
                //   child: WebViewWidget(
                //       controller: WebViewController()
                //         ..loadRequest(Uri.parse(eventItem.location!))),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
