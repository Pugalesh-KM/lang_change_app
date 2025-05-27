import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language App',
      debugShowCheckedModeBanner: false,
      home: LanguageSelectionScreen(),
    );
  }
}

class LanguageSelectionScreen extends StatefulWidget {
  LanguageSelectionScreen({super.key});
  final Map<String, Map<String, dynamic>> localizedStrings = {
    'en': {
      'title': 'Language App',
      'items': ['One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight'],
      'footer': 'Select a language',
    },
    'ta': {
      'title': 'மொழி செயலி',
      'items': ['ஒன்று', 'இரண்டு', 'மூன்று', 'நான்கு', 'ஐந்து', 'ஆறு', 'ஏழு', 'எட்டு'],
      'footer': 'மொழியைத் தேர்ந்தெடுக்கவும்',
    },
    'hi': {
      'title': 'भाषा ऐप',
      'items': ['एक', 'दो', 'तीन', 'चार', 'पांच', 'छह', 'सात', 'आठ'],
      'footer': 'भाषा चुनें',
    },
  };



  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLanguage = 'en';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _showLanguageBottomSheet());
  }

  void _showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.5,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.localizedStrings[selectedLanguage]!['footer'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              ListTile(
                title: Text('English'),
                onTap: () {
                  _selectLanguage('en');
                },
              ),
              ListTile(
                title: Text('தமிழ்'),
                onTap: () {
                  _selectLanguage('ta');
                },
              ),
              ListTile(
                title: Text('हिन्दी'),
                onTap: () {
                  _selectLanguage('hi');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _selectLanguage(String lang) {
    setState(() {
      selectedLanguage = lang;
    });
    Navigator.pop(context); // Close bottom sheet
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainContentScreen(
          selectedLanguage: selectedLanguage,
          localizedStrings: widget.localizedStrings,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class MainContentScreen extends StatefulWidget {
  final String selectedLanguage;
  final Map<String, Map<String, dynamic>> localizedStrings;

  const MainContentScreen({super.key,
    required this.selectedLanguage,
    required this.localizedStrings,
  });

  @override
  State<MainContentScreen> createState() => _MainContentScreenState();
}

class _MainContentScreenState extends State<MainContentScreen> {
  late String selectedLanguage;

  @override
  void initState() {
    super.initState();
    selectedLanguage = widget.selectedLanguage;
  }

  void _openLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.5,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.localizedStrings[selectedLanguage]!['footer'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              ListTile(
                title: Text('English'),
                onTap: () => _changeLanguage('en'),
              ),
              ListTile(
                title: Text('தமிழ்'),
                onTap: () => _changeLanguage('ta'),
              ),
              ListTile(
                title: Text('हिन्दी'),
                onTap: () => _changeLanguage('hi'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _changeLanguage(String lang) {
    setState(() {
      selectedLanguage = lang;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final strings = widget.localizedStrings[selectedLanguage]!;
    final List<String> items = strings['items'];

    return Scaffold(
      appBar: AppBar(
        title: Text(strings['title']),
        leading: IconButton(
          icon: Icon(Icons.language),
          onPressed: _openLanguageBottomSheet,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.lightBlue.shade100,
                  child: Center(
                    child: Text(
                      items[index],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
