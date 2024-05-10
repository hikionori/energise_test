import 'package:energise_test/controllers/ip_info/ip_info_cubit.dart';
import 'package:energise_test/views/ip_info/widgets/list_ip_info.dart';
import 'package:energise_test/views/ip_info/widgets/map_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IpInfoScreen extends StatefulWidget {
  const IpInfoScreen({super.key});
  @override
  State<IpInfoScreen> createState() => _IpInfoScreenState();
}

class _IpInfoScreenState extends State<IpInfoScreen> {
  @override
  void initState() {
    super.initState();
    context.read<IpInfoCubit>().getIpInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<IpInfoCubit>().getIpInfo();
          },
          child: BlocBuilder<IpInfoCubit, IpInfoState>(
            builder: (context, state) {
              if (state is IpInfoLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is IpInfoLoaded) {
                return Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: MapDisplay(
                          ipInfo: state.ipInfo,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: ListIpInfo(state: state),
                      ),
                    ],
                  ),
                );
              } else if (state is IpInfoError) {
                return Text('Error: ${state.message}');
              }
              return Container();
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<IpInfoCubit>().getIpInfo();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
