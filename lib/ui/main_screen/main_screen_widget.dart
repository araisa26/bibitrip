import 'package:bibitrip/resources/app_resources.dart';
import 'package:bibitrip/ui/main_screen/main_screen_bloc.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<MainScreenBloc>();

    return BlocListener<MainScreenBloc, MainScreenState>(
      listenWhen: (prev, current) {
        return current == prev;
      },
      listener: (context, state) {},
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                size: 30,
              ),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                  icon: const Icon(
                    Icons.exit_to_app_outlined,
                    size: 30,
                  ),
                  onPressed: () => bloc.exitApp(context))
            ],
            title: const Text('Поиск автобусов',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700))),
        body: RefreshIndicator(
          onRefresh: () => bloc.refresh(),
          child: const SingleChildScrollView(
            child: Column(
              children: [
                MainScreenHeader(),
                BusSearchButton(),
                BusListBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainScreenHeader extends StatelessWidget {
  const MainScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<MainScreenBloc>();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: bloc.state.errorMessage != null ? 300 : 270,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ErrorMessageWidget(),
            DepartureAndDestinitionForm(),
            SizedBox(
              height: 15,
            ),
            DateForm(),
          ],
        ),
      ),
    );
  }
}

class DepartureAndDestinitionForm extends StatelessWidget {
  const DepartureAndDestinitionForm({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainScreenBloc>();
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.trip_origin,
              size: 25,
              color: AppResources.mainColor,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: TextField(
                controller: bloc.state.departureCity,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(243, 243, 243, 1),
                  labelText: "Откуда",
                  labelStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.my_location,
                    size: 20,
                    color: AppResources.mainColor,
                  ),
                ),
                style: AppResources.textFieldStylee,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_on_rounded,
              size: 25,
              color: AppResources.mainColor,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: TextField(
                controller: bloc.state.destinationCity,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(243, 243, 243, 1),
                  labelText: "Куда",
                  labelStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.my_location,
                    size: 20,
                    color: AppResources.mainColor,
                  ),
                ),
                style: AppResources.textFieldStylee,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DateForm extends StatelessWidget {
  const DateForm({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainScreenBloc>();
    return Row(
      children: [
        const Icon(
          Icons.calendar_today,
          size: 25,
          color: AppResources.mainColor,
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: TextField(
            controller: bloc.state.departureDate,
            obscureText: false,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(243, 243, 243, 1),
              labelText: "Дата поездки",
              labelStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
            style: AppResources.textFieldStylee,
            readOnly: true,
            onTap: () => bloc.selectDate(context),
          ),
        ),
      ],
    );
  }
}

class BusSearchButton extends StatelessWidget {
  const BusSearchButton({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<MainScreenBloc>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () => bloc.busSearchButton(),
          style: AppResources.buttonStyle,
          child: bloc.state.startFindLoading == true
              ? AppResources.circularProgresIndicator
              : const Text(
                  'Найти',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
        ),
      ),
    );
  }
}

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<MainScreenBloc>();
    if (bloc.state.errorMessage == null) {
      return const SizedBox.shrink();
    } else {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              bloc.state.errorMessage!,
              style: AppResources.errorMessageStyle,
            ),
          ),
        ],
      );
    }
  }
}

class BusListBuilder extends StatelessWidget {
  const BusListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<MainScreenBloc>();
    return (bloc.state.busTrips == null || bloc.state.busTrips!.trips.isEmpty)
        ? const SizedBox.shrink()
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: bloc.state.busTrips!.trips.length,
            itemExtent: 209,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 15,
                ),
                child: Stack(children: [
                  Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 30, top: 20, right: 30, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Column(
                                  children: [
                                    Icon(
                                      Icons.trip_origin,
                                      color: Colors.grey,
                                      size: 26,
                                    ),
                                    DottedDashedLine(
                                      height: 33,
                                      width: 1,
                                      axis: Axis.vertical,
                                      dashColor: Colors.grey,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ConstrainedBox(
                                          constraints: const BoxConstraints(
                                              minWidth: 120),
                                          child: Text(
                                            bloc.state.departureCity.text,
                                            style: AppResources
                                                .busListCityTextStyle,
                                          ),
                                        ),
                                        Text(
                                          bloc.getDay(bloc.state.busTrips!
                                              .trips[index].departureTime),
                                          style: AppResources
                                              .busListOptionTextStyle,
                                        ),
                                        Text(
                                          bloc.getTime(bloc.state.busTrips!
                                              .trips[index].departureTime),
                                          style: AppResources
                                              .busListOptionTextStyle,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        bloc.state.busTrips?.trips[index]
                                                    .departure?.name ==
                                                null
                                            ? const SizedBox.shrink()
                                            : const Icon(
                                                Icons.circle,
                                                size: 7,
                                                color: Colors.grey,
                                              ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          bloc.state.busTrips?.trips[index]
                                                      .departure?.name ==
                                                  null
                                              ? ''
                                              : bloc
                                                  .state
                                                  .busTrips!
                                                  .trips[index]
                                                  .departure!
                                                  .name!,
                                          style: AppResources
                                              .busListOptionTextStyle,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 12.5),
                              child: DottedDashedLine(
                                height: 20,
                                width: 1,
                                axis: Axis.vertical,
                                dashColor: Colors.grey,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.trip_origin,
                                  color: Colors.grey,
                                  size: 26,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ConstrainedBox(
                                          constraints: const BoxConstraints(
                                              minWidth: 120),
                                          child: Text(
                                            bloc.state.destinationCity.text,
                                            style: AppResources
                                                .busListCityTextStyle,
                                          ),
                                        ),
                                        Text(
                                          bloc.getDay(bloc.state.busTrips!
                                              .trips[index].arrivalTime),
                                          style: AppResources
                                              .busListOptionTextStyle,
                                        ),
                                        Text(
                                          bloc.getTime(bloc.state.busTrips!
                                              .trips[index].arrivalTime),
                                          style: AppResources
                                              .busListOptionTextStyle,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        bloc.state.busTrips?.trips[index]
                                                    .destination?.name ==
                                                null
                                            ? const SizedBox.shrink()
                                            : const Icon(
                                                Icons.circle,
                                                size: 7,
                                                color: Colors.grey,
                                              ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          bloc.state.busTrips?.trips[index]
                                                      .destination?.name ==
                                                  null
                                              ? ''
                                              : bloc
                                                  .state
                                                  .busTrips!
                                                  .trips[index]
                                                  .destination!
                                                  .name!,
                                          style: AppResources
                                              .busListOptionTextStyle,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {}, // переход в детальное описание поездки
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                ]),
              );
            },
          );
  }
}
