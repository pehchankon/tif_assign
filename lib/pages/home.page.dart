import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/loader.widget.dart';
import 'searchEvents.page.dart';
import 'package:flutter/services.dart';
import '../widgets/rowCard.widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/eventRepository.dart';
import '../models/event.model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Event> events;
  bool isLoading = true;
  late EventRepository eventRepository;

  @override
  void initState() {
    eventRepository = RepositoryProvider.of<EventRepository>(context);
    _init();
    super.initState();
  }

  void _init() async {
    events = await eventRepository.fetchAllEvents();
    setState(() => isLoading = false);
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      iconTheme: IconThemeData(color: Color(0xFF120D26)),
      backgroundColor: Colors.transparent,
      toolbarHeight: 60,
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          'Events',
          style: GoogleFonts.inter(
              color: Color(0xFF120D26),
              fontWeight: FontWeight.w500,
              fontSize: 24),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchEventsPage()),
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: isLoading
            ? Loader()
            : ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) => RowCard(
                  event: events[index],
                ),
              ),
      ),
    );
  }
}