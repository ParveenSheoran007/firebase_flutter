import 'package:firebase_flutter/util/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_flutter/util/storage_helper.dart';
import 'package:firebase_flutter/auth/ui/login_screen.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late StorageHelper storageHelper;
  String _selectedLanguage = 'Select Language';
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    storageHelper = StorageHelper();
    _loadSelectedLanguage();
  }

  Future<void> _loadSelectedLanguage() async {
    String? selectedLanguage = await storageHelper.getSelectedLanguage();
    if (selectedLanguage != null) {
      setState(() {
        _selectedLanguage = selectedLanguage;
      });
    }
  }

  Future<void> _onLanguageSelected() async {
    if (_selectedLanguage == 'Select Language') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a language before proceeding.'),
        ),
      );
      return;
    }

    await storageHelper.setLanguageSelected(true);
    await storageHelper.setSelectedLanguage(_selectedLanguage);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.image_outlined,
                size: 80,
                color: Colors.black,
              ),
              SizedBox(height: 16),
              Text(
                'Please select your Language',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                'You can change the language',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'at any time.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isDropdownOpen = !_isDropdownOpen;
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedLanguage,
                        style: TextStyle(fontSize: 18),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              if (_isDropdownOpen) _buildDropdown(),
              SizedBox(height: 32),
              CustomButton(
                name: 'NEXT',
                onPressed: _onLanguageSelected,
                buttonColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('English'),
            onTap: () {
              setState(() {
                _selectedLanguage = 'English';
                _isDropdownOpen = false;
              });
            },
          ),
          ListTile(
            title: Text('Hindi'),
            onTap: () {
              setState(() {
                _selectedLanguage = 'Hindi';
                _isDropdownOpen = false;
              });
            },
          ),
        ],
      ),
    );
  }
}
