import 'package:json_annotation/json_annotation.dart';

part 'bus_trips.g.dart';

@JsonSerializable(explicitToJson: true)
class BusTrips {
  final List<Trip> trips;
  BusTrips({
    required this.trips,
  });
  factory BusTrips.fromJson(Map<String, dynamic> json) =>
      _$BusTripsFromJson(json);
  Map<String, dynamic> toJson() => _$BusTripsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class Trip {
  final String? id;
  final String? routeId;
  final String? scheduleTripId;
  final String? routeName;
  final String? routeNum;
  final String? carrier;
  final Bus? bus;
  final String? driver1;
  final String? driver2;
  final String? frequency;
  final String? waybillNum;
  final String? status;
  final String? statusPrint;
  final String? statusReason;
  final String? statusComment;
  final String? statusDate;
  final Departure? departure;
  final String? departureTime;
  final String? arrivalToDepartureTime;
  final Destination? destination;
  final String? arrivalTime;
  final String? distance;
  final int? duration;
  final bool? transitSeats;
  final int? freeSeatsAmount;
  final String? passengerFareCost;
  final List<dynamic>? fares;
  final int? platform;
  final bool? onSale;
  final List<dynamic>? route;
  final bool? additional;
  final List<dynamic>? additionalTripTime;
  final bool? transitTrip;
  final String? saleStatus;
  @JsonKey(name: 'ACBPDP')
  final bool? acbpdp;
  final String? factTripReturnTime;
  final String? currency;
  final String? principalTaxId;
  final CarrierData? carrierData;
  final String? passengerFareCostAvibus;
  Trip(
    this.id,
    this.routeId,
    this.scheduleTripId,
    this.routeName,
    this.routeNum,
    this.carrier,
    this.bus,
    this.driver1,
    this.driver2,
    this.frequency,
    this.waybillNum,
    this.status,
    this.statusPrint,
    this.statusReason,
    this.statusComment,
    this.statusDate,
    this.departure,
    this.departureTime,
    this.arrivalToDepartureTime,
    this.destination,
    this.arrivalTime,
    this.distance,
    this.duration,
    this.transitSeats,
    this.freeSeatsAmount,
    this.passengerFareCost,
    this.fares,
    this.platform,
    this.onSale,
    this.route,
    this.additional,
    this.additionalTripTime,
    this.transitTrip,
    this.saleStatus,
    this.acbpdp,
    this.factTripReturnTime,
    this.currency,
    this.principalTaxId,
    this.carrierData,
    this.passengerFareCostAvibus,
  );

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
  Map<String, dynamic> toJson() => _$TripToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class Bus {
  final String? id;
  final String? model;
  final String? licencePlate;
  final String? name;
  final String? seatsClass;
  final int? seatCapacity;
  final int? standCapacity;
  final int? baggageCapacity;
  final List<dynamic>? seatsScheme;
  final String? garageNum;
  Bus(
    this.id,
    this.model,
    this.licencePlate,
    this.name,
    this.seatsClass,
    this.seatCapacity,
    this.standCapacity,
    this.baggageCapacity,
    this.seatsScheme,
    this.garageNum,
  );
  factory Bus.fromJson(Map<String, dynamic> json) => _$BusFromJson(json);
  Map<String, dynamic> toJson() => _$BusToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class Departure {
  final String? name;
  final String? code;
  final String? id;
  final String? country;
  final String? region;
  final String? district;
  final bool? automated;
  final bool? hasDestinations;
  @JsonKey(name: 'UTC')
  final String? utc;
  @JsonKey(name: 'GPSCoordinates')
  final String? gpsCoordinates;
  final String? locationType;
  final String? locality;
  final String? stoppingPlace;
  final String? address;
  final String? phone;
  Departure(
    this.name,
    this.code,
    this.id,
    this.country,
    this.region,
    this.district,
    this.automated,
    this.hasDestinations,
    this.utc,
    this.gpsCoordinates,
    this.locationType,
    this.locality,
    this.stoppingPlace,
    this.address,
    this.phone,
  );
  factory Departure.fromJson(Map<String, dynamic> json) =>
      _$DepartureFromJson(json);
  Map<String, dynamic> toJson() => _$DepartureToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class Destination {
  final String? name;
  final String? code;
  final String? id;
  final String? country;
  final String? region;
  final String? district;
  final bool? automated;
  final bool? hasDestinations;
  @JsonKey(name: 'UTC')
  final String? utc;
  @JsonKey(name: 'GPSCoordinates')
  final String? gpsCoordinates;
  final String? locationType;
  final String? locality;
  final String? stoppingPlace;
  final String? address;
  final String? phone;
  Destination(
    this.name,
    this.code,
    this.id,
    this.country,
    this.region,
    this.district,
    this.automated,
    this.hasDestinations,
    this.utc,
    this.gpsCoordinates,
    this.locationType,
    this.locality,
    this.stoppingPlace,
    this.address,
    this.phone,
  );
  factory Destination.fromJson(Map<String, dynamic> json) =>
      _$DestinationFromJson(json);
  Map<String, dynamic> toJson() => _$DestinationToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class CarrierData {
  final String? carrierName;
  final String? carrierTaxId;
  final String? carrierStateRegNum;
  final List<CarrierPersonalData>? carrierPersonalData;
  final String? carrierAddress;
  final String? carrierWorkingHours;
  CarrierData(
    this.carrierName,
    this.carrierTaxId,
    this.carrierStateRegNum,
    this.carrierPersonalData,
    this.carrierAddress,
    this.carrierWorkingHours,
  );
  factory CarrierData.fromJson(Map<String, dynamic> json) =>
      _$CarrierDataFromJson(json);
  Map<String, dynamic> toJson() => _$CarrierDataToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class CarrierPersonalData {
  final String? name;
  final String? caption;
  final bool? mandatory;
  final bool? personIdentifier;
  final String? type;
  final List<dynamic>? valueVariants;
  final String? inputMask;
  final String? value;
  final String? valueKind;
  final DefaultValueVariant? defaultValueVariant;
  final String? documentIssueDateRequired;
  final String? documentIssueOrgRequired;
  final String? documentValidityDateRequired;
  final String? documentInceptionDateRequired;
  final String? documentIssuePlaceRequired;
  final String? value1;
  final String? value2;
  final String? value3;
  final String? value4;
  final String? value5;
  CarrierPersonalData(
    this.name,
    this.caption,
    this.mandatory,
    this.personIdentifier,
    this.type,
    this.valueVariants,
    this.inputMask,
    this.value,
    this.valueKind,
    this.defaultValueVariant,
    this.documentIssueDateRequired,
    this.documentIssueOrgRequired,
    this.documentValidityDateRequired,
    this.documentInceptionDateRequired,
    this.documentIssuePlaceRequired,
    this.value1,
    this.value2,
    this.value3,
    this.value4,
    this.value5,
  );
  factory CarrierPersonalData.fromJson(Map<String, dynamic> json) =>
      _$CarrierPersonalDataFromJson(json);
  Map<String, dynamic> toJson() => _$CarrierPersonalDataToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class DefaultValueVariant {
  final String? name;
  final String? inputMask;
  final String? valueProperty1;
  final String? valueProperty2;
  final String? valueProperty3;
  final String? valueProperty4;
  final String? valueProperty5;
  DefaultValueVariant(
    this.name,
    this.inputMask,
    this.valueProperty1,
    this.valueProperty2,
    this.valueProperty3,
    this.valueProperty4,
    this.valueProperty5,
  );
  factory DefaultValueVariant.fromJson(Map<String, dynamic> json) =>
      _$DefaultValueVariantFromJson(json);
  Map<String, dynamic> toJson() => _$DefaultValueVariantToJson(this);
}
