import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Action',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
        rows: <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(
                ElevatedButton(
                  child: Text(AppLocalizations.of(context)!.rate_app),
                  onPressed: () {
                    // Implement your method to rate the app here
                  },
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(
                ElevatedButton(
                  child: Text(AppLocalizations.of(context)!.share),
                  onPressed: () async {
                    // share the app with friends
                    await Share.share(
                        'Check out this app: https://energise.notion.site/Flutter-f86d340cadb34e9cb1ef092df4e566b7');
                  },
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(
                ElevatedButton(
                  child: Text(AppLocalizations.of(context)!.contact_us),
                  onPressed: () async {
                    const url =
                        'https://energise.notion.site/Flutter-f86d340cadb34e9cb1ef092df4e566b7';
                    if (!await launchUrl(Uri.parse(url))) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Could not launch $url'),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
