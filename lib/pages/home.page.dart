import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tif_assign/constants.dart';
import '../colors.dart';
import '../textStyles.dart';
import '../widgets/loader.widget.dart';
import 'searchEvents.page.dart';
import 'package:flutter/services.dart';
import '../widgets/eventListRowCard.widget.dart';
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
      titleSpacing: 32,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(color: AppColors.primaryPurpleColor),
      backgroundColor: Colors.transparent,
      toolbarHeight: 60,
      title: Text(
        'Events',
        style: AppTextStyles.primaryPurpleBoldText24,
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            kSearchIcon,
            color: AppColors.primaryPurpleColor,
          ),
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
                itemBuilder: (context, index) => EventListRowCard(
                  event: events[index],
                ),
              ),
      ),
    );
  }
}
