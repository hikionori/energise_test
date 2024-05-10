import 'package:energise_test/controllers/ip_info/ip_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListIpInfo extends StatelessWidget {
  final IpInfoLoaded state;

  const ListIpInfo({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('IP'),
          subtitle: Text(state.ipInfo.ip),
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.country),
          subtitle: Text(state.ipInfo.country),
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.city),
          subtitle: Text(state.ipInfo.city),
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.region),
          subtitle: Text(state.ipInfo.regionName),
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.zip),
          subtitle: Text(state.ipInfo.zip),
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.timezone),
          subtitle: Text(state.ipInfo.timezone),
        ),
      ],
    );
  }
}
