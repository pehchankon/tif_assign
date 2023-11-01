import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:tif_assign/textStyles.dart';
import '../colors.dart';
import '../widgets/loader.widget.dart';
import '../widgets/eventListRowCard.widget.dart';
import '../data/eventRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/event.model.dart';
import '../widgets/searchBar.widget.dart';

class SearchEventsPage extends StatefulWidget {
  SearchEventsPage({super.key});

  @override
  State<SearchEventsPage> createState() => _SearchEventsPageState();
}

class _SearchEventsPageState extends State<SearchEventsPage> {
  final TextEditingController _textController = TextEditingController();

  bool isLoading = true;
  late EventRepository eventRepository;
  late List<Event> events;

  void _searchEvents() async {
    setState(() => isLoading = true);
    final fetchedEvents =
        await eventRepository.searchEvents(_textController.text);
    setState(() => events = fetchedEvents);
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    eventRepository = RepositoryProvider.of<EventRepository>(context);
    _textController.addListener(_searchEvents);
    _searchEvents();
    super.initState();
  }

  @override
  void dispose() {
    _textController.removeListener(_searchEvents);
    _textController.dispose();
    super.dispose();
  }

  final AppBar _appBar = AppBar(
    leadingWidth: 65,
    titleSpacing: -10,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    iconTheme: IconThemeData(color: AppColors.primaryPurpleColor),
    backgroundColor: Colors.transparent,
    toolbarHeight: 60,
    title: Text(
      'Search',
      style: AppTextStyles.primaryPurpleBoldText24,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          children: [
            SearchBar(textController: _textController),
            SizedBox(height: 15),
            isLoading
                ? Loader()
                : Expanded(
                    child: ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (context, index) => EventListRowCard(
                        event: events[index],
                        isSearchPage: true,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
