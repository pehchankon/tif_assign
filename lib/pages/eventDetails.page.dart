import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tif_assign/textStyles.dart';
import '../colors.dart';
import '../data/eventRepository.dart';
import '../models/event.model.dart';
import '../widgets/eventBookButton.widget.dart';
import '../widgets/eventDetailsRowItem.widget.dart';
import '../widgets/loader.widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';

class EventDetailsPage extends StatefulWidget {
  EventDetailsPage({super.key, required this.eventId});
  final int eventId;

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  PreferredSize _appBar(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(isLoading ? 60 : 200.0),
        child: _childAppBar());
  }

  AppBar _childAppBar() {
    return AppBar(
      leadingWidth: 65,
      titleSpacing: -15,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: isLoading ? Brightness.dark : Brightness.light,
      ),
      iconTheme: IconThemeData(
          color: isLoading ? AppColors.primaryPurpleColor : Colors.white),
      backgroundColor: Colors.transparent,
      flexibleSpace: !isLoading
          ? Stack(children: [
              Image(
                image: NetworkImage(event.bannerImage),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ])
          : null,
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          'Event Details',
          style: isLoading
              ? AppTextStyles.primaryPurpleBoldText24
              : AppTextStyles.whiteBoldText24,
        ),
      ),
      actions: [
        !isLoading
            ? Padding(
                padding: const EdgeInsets.only(right: 15),
                child: IconButton(
                  icon: Container(
                    width: 33,
                    height: 33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.3),
                    ),
                    child: Icon(Icons.bookmark_rounded, size: 18),
                  ),
                  onPressed: () {},
                ),
              )
            : Container(),
      ],
    );
  }

  bool isLoading = true;
  late EventRepository eventRepository;
  late Event event;

  @override
  void initState() {
    eventRepository = RepositoryProvider.of<EventRepository>(context);
    _init();
    super.initState();
  }

  void _init() async {
    event = await eventRepository.fetchEventDetails(widget.eventId);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: isLoading
            ? Loader()
            : Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.title,
                          style: AppTextStyles.primaryPurpleText35,
                        ),
                        SizedBox(height: 10),
                        EventDetailsRowItem(
                          topText: event.organiserName,
                          bottomText: 'Organizer',
                          icon: Image.network(event.organiserIcon),
                        ),
                        EventDetailsRowItem(
                          topText:
                              DateFormat('d MMMM, yyyy').format(event.dateTime),
                          bottomText: DateFormat('EEEE, h:mma')
                              .format(event.dateTime.toLocal()),
                          icon: SvgPicture.asset(kDateIcon),
                        ),
                        EventDetailsRowItem(
                          topText: event.venueName,
                          bottomText:
                              '${event.venueCity}, ${event.venueCountryCode}',
                          icon: SvgPicture.asset(kLocationIcon),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'About Event',
                          style: AppTextStyles.primaryPurpleBoldText18,
                        ),
                        SizedBox(height: 8),
                        Text(
                          event.description,
                          style: AppTextStyles.primaryPurpleText16,
                        ),
                        SizedBox(height: 150),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      alignment: Alignment(0, 0.75),
                      child: BookButton(),
                      width: double.infinity,
                      height: 180,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0),
                            Colors.white,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
