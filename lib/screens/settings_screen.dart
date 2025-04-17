// screens/settings_screen.dart
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  String _language = 'English';
  double _textSize = 1.0;

  // Controller for refresh functionality
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive padding
    final double screenWidth = MediaQuery.of(context).size.width;
    final double paddingHorizontal = screenWidth > 600 ? 24 : 16;

    return RefreshIndicator(
      // Add pull-to-refresh functionality
      onRefresh: () async {
        // Simulating refresh operation
        await Future.delayed(Duration(seconds: 1));
        // Here you would typically reload settings from a backend
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        physics: AlwaysScrollableScrollPhysics(), // Enable scrolling even when content is short
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(paddingHorizontal),
              color: Theme.of(context).primaryColor,
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 22, // Slightly smaller for better fit
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Customize your Al-Aqsa Mosque visitor guide experience',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14, // Smaller for better fit on small screens
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),

            // Notifications settings
            _buildSettingCard(
              title: 'Notifications',
              children: [
                SwitchListTile(
                  title: Text('Enable Push Notifications'),
                  subtitle: Text(
                    'Receive updates about prayer times and special events',
                    style: TextStyle(fontSize: 12), // Smaller subtitle text
                  ),
                  value: _notificationsEnabled,
                  activeColor: Theme.of(context).colorScheme.secondary,
                  onChanged: (bool value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                    // Show feedback with snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(value ? 'Notifications enabled' : 'Notifications disabled'),
                        duration: Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating, // Floating for better mobile UX
                      ),
                    );
                  },
                ),
                Divider(),
                CheckboxListTile(
                  title: Text('Prayer Time Alerts'),
                  value: _notificationsEnabled,
                  dense: true, // More compact
                  activeColor: Theme.of(context).colorScheme.secondary,
                  onChanged: _notificationsEnabled
                      ? (bool? value) {
                          // This would normally update a specific notification setting
                        }
                      : null,
                ),
                CheckboxListTile(
                  title: Text('Special Events'),
                  value: _notificationsEnabled,
                  dense: true, // More compact
                  activeColor: Theme.of(context).colorScheme.secondary,
                  onChanged: _notificationsEnabled
                      ? (bool? value) {
                          // This would normally update a specific notification setting
                        }
                      : null,
                ),
                CheckboxListTile(
                  title: Text('Tour Reminders'),
                  value: _notificationsEnabled,
                  dense: true, // More compact
                  activeColor: Theme.of(context).colorScheme.secondary,
                  onChanged: _notificationsEnabled
                      ? (bool? value) {
                          // This would normally update a specific notification setting
                        }
                      : null,
                ),
              ],
            ),

            // Appearance settings
            _buildSettingCard(
              title: 'Appearance',
              children: [
                SwitchListTile(
                  title: Text('Dark Mode'),
                  subtitle: Text(
                    'Use dark theme throughout the app',
                    style: TextStyle(fontSize: 12), // Smaller subtitle text
                  ),
                  value: _darkModeEnabled,
                  activeColor: Theme.of(context).colorScheme.secondary,
                  onChanged: (bool value) {
                    setState(() {
                      _darkModeEnabled = value;
                    });
                    // Show feedback
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(value ? 'Dark mode enabled' : 'Dark mode disabled'),
                        duration: Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                ),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 8),
                      child: Text(
                        'Text Size',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text('A', style: TextStyle(fontSize: 12)),
                          Expanded(
                            child: Slider(
                              value: _textSize,
                              min: 0.8,
                              max: 1.4,
                              divisions: 6,
                              label: _getTextSizeLabel(),
                              activeColor: Theme.of(context).colorScheme.secondary,
                              onChanged: (double value) {
                                setState(() {
                                  _textSize = value;
                                });
                              },
                            ),
                          ),
                          Text('A', style: TextStyle(fontSize: 24)),
                        ],
                      ),
                    ),
                    Center(
                      child: Text(
                        _getTextSizeLabel(),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ],
            ),

            // Language settings
            _buildSettingCard(
              title: 'Language',
              children: [
                // Add search bar for languages
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search languages',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    ),
                  ),
                ),
                Divider(),
                _buildLanguageOption('English'),
                _buildLanguageOption('Arabic'),
                _buildLanguageOption('Turkish'),
                _buildLanguageOption('French'),
                _buildLanguageOption('Urdu'),
              ],
            ),

            // Account settings
            _buildSettingCard(
              title: 'Account',
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Edit Profile'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Show a placeholder modal bottom sheet for mobile-friendly experience
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      builder: (context) => Container(
                        padding: EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Edit Profile',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text('Profile editing would appear here'),
                            SizedBox(height: 16),
                            ElevatedButton(
                              child: Text('Close'),
                              onPressed: () => Navigator.pop(context),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 48),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text('Tour Booking History'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Navigate to booking history screen
                  },
                ),
                ListTile(
                  leading: Icon(Icons.star_border),
                  title: Text('Saved Items'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Navigate to saved items screen
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text(
                    'Logout',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    // Show confirmation dialog - mobile-friendly pattern
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Logout'),
                          content: Text('Are you sure you want to logout?'),
                          actions: [
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text(
                                'Logout',
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                // Perform logout
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Logged out successfully'),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),

            // About settings
            _buildSettingCard(
              title: 'About',
              children: [
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text('About This App'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Show about dialog
                    showAboutDialog(
                      context: context,
                      applicationName: 'Al-Aqsa Mosque Visitor Guide',
                      applicationVersion: '1.0.0',
                      applicationIcon: FlutterLogo(size: 48),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('A comprehensive guide for visitors to the Al-Aqsa Mosque in Jerusalem.'),
                        ),
                      ],
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.description),
                  title: Text('Terms of Service'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Show terms of service
                  },
                ),
                ListTile(
                  leading: Icon(Icons.privacy_tip),
                  title: Text('Privacy Policy'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Show privacy policy
                  },
                ),
                ListTile(
                  title: Text('Version'),
                  subtitle: Text('1.0.0'),
                  leading: Icon(Icons.android),
                ),
              ],
            ),

            // Add some space at bottom for better scrolling experience
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String language) {
    return RadioListTile<String>(
      title: Text(language),
      value: language,
      groupValue: _language,
      activeColor: Theme.of(context).colorScheme.secondary,
      onChanged: (String? value) {
        if (value != null) {
          setState(() {
            _language = value;
          });
          // Show confirmation
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Language changed to $value'),
              duration: Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      dense: true, // Make the list tile more compact
    );
  }

  Widget _buildSettingCard({required String title, required List<Widget> children}) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12), // Slightly more rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18, // Slightly smaller for better fit on small screens
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.secondary,
            thickness: 2,
            indent: 16,
            endIndent: 16,
          ),
          ...children,
          SizedBox(height: 8),
        ],
      ),
    );
  }

  String _getTextSizeLabel() {
    if (_textSize <= 0.8) return 'XS';
    if (_textSize <= 0.9) return 'S';
    if (_textSize <= 1.0) return 'M';
    if (_textSize <= 1.1) return 'L';
    if (_textSize <= 1.2) return 'XL';
    if (_textSize <= 1.3) return '2XL';
    return '3XL';
  }
}
