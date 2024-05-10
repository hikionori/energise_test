part of 'ip_info_cubit.dart';

@immutable
sealed class IpInfoState extends Equatable {
  const IpInfoState();
}

final class IpInfoInitial extends IpInfoState {
  const IpInfoInitial();

  @override
  List<Object> get props => [];
}

final class IpInfoLoading extends IpInfoState {
  const IpInfoLoading();

  @override
  List<Object> get props => [];
}

final class IpInfoLoaded extends IpInfoState {
  final IpInfo ipInfo;
  const IpInfoLoaded(this.ipInfo);

  @override
  List<Object> get props => [ipInfo];
}

final class IpInfoError extends IpInfoState {
  final String message;
  const IpInfoError(this.message);

  @override
  List<Object> get props => [message];
}