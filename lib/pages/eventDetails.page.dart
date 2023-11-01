import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../data/eventRepository.dart';
import '../models/event.model.dart';
import '../widgets/loader.widget.dart';
import 'searchEvents.page.dart';
import 'package:flutter/services.dart';
import '../widgets/rowCard.widget.dart';

class EventDetailsPage extends StatefulWidget {
  EventDetailsPage({super.key, required this.eventId});
  final int eventId;

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  PreferredSize _appBar(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(
            isLoading ? 60 : 200.0), // Set the height of the AppBar
        child: _childAppBar());
  }

  AppBar _childAppBar() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: isLoading ? Brightness.dark : Brightness.light,
      ),
      iconTheme:
          IconThemeData(color: isLoading ? Color(0xFF120D26) : Colors.white),
      backgroundColor: Colors.transparent,
      // toolbarHeight: 250,
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
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  ),
                ),
              ),
            ])
          : null,
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          'Event Details',
          style: GoogleFonts.inter(
              color: isLoading ? Color(0xFF120D26) : Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 24),
        ),
      ),
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
                          style: GoogleFonts.inter(fontSize: 35),
                        ),
                        SizedBox(height: 10), //TODO: add const style
                        EventDetailsRowItem(
                          topText: event.organiserName,
                          bottomText: 'Organizer',
                          icon: Image.network(event.organiserIcon),
                        ),
                        EventDetailsRowItem(
                          topText:
                              DateFormat('d MMMM, yyyy').format(event.dateTime),
                          bottomText:
                              DateFormat('EEEE, h:mma').format(event.dateTime.toLocal()),
                          icon: Image.network(event.organiserIcon),
                        ),
                        EventDetailsRowItem(
                          topText: event.venueName,
                          bottomText: '${event.venueCity}, ${event.venueCountryCode}',
                          icon: Image.network(event.organiserIcon),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'About Event',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 18, //TODO: fix
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          event.description,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 16, //TODO: fix
                          ),
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
                          colors: [Colors.white.withOpacity(0), Colors.white],
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

class EventDetailsRowItem extends StatelessWidget {
  const EventDetailsRowItem(
      {super.key,
      required this.topText,
      required this.bottomText,
      required this.icon});

  final String topText;
  final String bottomText;
  final Image icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(width: 45, height: 45, child: icon),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                topText,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              Text(
                bottomText,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BookButton extends StatelessWidget {
  const BookButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 270, //TODO: add some sizing idk
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xFF5669FF),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(111, 126, 201, 0.25), //TODO: add palatte
              offset: Offset(0, 10),
              blurRadius: 35,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                'BOOK NOW',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(right: 14),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF3D56F0), //TODO: const
                ),
                child: Icon(Icons.arrow_forward, color: Colors.white, size: 20),
              ),
            ),
          ],
        ));
  }
}
