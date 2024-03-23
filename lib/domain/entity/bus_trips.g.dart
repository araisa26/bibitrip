// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_trips.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusTrips _$BusTripsFromJson(Map<String, dynamic> json) => BusTrips(
      trips: (json['trips'] as List<dynamic>)
          .map((e) => Trip.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BusTripsToJson(BusTrips instance) => <String, dynamic>{
      'trips': instance.trips.map((e) => e.toJson()).toList(),
    };

Trip _$TripFromJson(Map<String, dynamic> json) => Trip(
      json['Id'] as String?,
      json['RouteId'] as String?,
      json['ScheduleTripId'] as String?,
      json['RouteName'] as String?,
      json['RouteNum'] as String?,
      json['Carrier'] as String?,
      Bus.fromJson(json['Bus'] as Map<String, dynamic>),
      json['Driver1'] as String?,
      json['Driver2'] as String?,
      json['Frequency'] as String?,
      json['WaybillNum'] as String?,
      json['Status'] as String?,
      json['StatusPrint'] as String?,
      json['StatusReason'] as String?,
      json['StatusComment'] as String?,
      json['StatusDate'] as String?,
      Departure.fromJson(json['Departure'] as Map<String, dynamic>),
      json['DepartureTime'] as String?,
      json['ArrivalToDepartureTime'] as String?,
      Destination.fromJson(json['Destination'] as Map<String, dynamic>),
      json['ArrivalTime'] as String?,
      json['Distance'] as String?,
      json['Duration'] as int?,
      json['TransitSeats'] as bool?,
      json['FreeSeatsAmount'] as int?,
      json['PassengerFareCost'] as String?,
      json['Fares'] as List<dynamic>?,
      json['Platform'] as int?,
      json['OnSale'] as bool?,
      json['Route'] as List<dynamic>?,
      json['Additional'] as bool?,
      json['AdditionalTripTime'] as List<dynamic>?,
      json['TransitTrip'] as bool?,
      json['SaleStatus'] as String?,
      json['ACBPDP'] as bool?,
      json['FactTripReturnTime'] as String?,
      json['Currency'] as String?,
      json['PrincipalTaxId'] as String?,
      CarrierData.fromJson(json['CarrierData'] as Map<String, dynamic>),
      json['PassengerFareCostAvibus'] as String?,
    );

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
      'Id': instance.id,
      'RouteId': instance.routeId,
      'ScheduleTripId': instance.scheduleTripId,
      'RouteName': instance.routeName,
      'RouteNum': instance.routeNum,
      'Carrier': instance.carrier,
      'Bus': instance.bus,
      'Driver1': instance.driver1,
      'Driver2': instance.driver2,
      'Frequency': instance.frequency,
      'WaybillNum': instance.waybillNum,
      'Status': instance.status,
      'StatusPrint': instance.statusPrint,
      'StatusReason': instance.statusReason,
      'StatusComment': instance.statusComment,
      'StatusDate': instance.statusDate,
      'Departure': instance.departure,
      'DepartureTime': instance.departureTime,
      'ArrivalToDepartureTime': instance.arrivalToDepartureTime,
      'Destination': instance.destination,
      'ArrivalTime': instance.arrivalTime,
      'Distance': instance.distance,
      'Duration': instance.duration,
      'TransitSeats': instance.transitSeats,
      'FreeSeatsAmount': instance.freeSeatsAmount,
      'PassengerFareCost': instance.passengerFareCost,
      'Fares': instance.fares,
      'Platform': instance.platform,
      'OnSale': instance.onSale,
      'Route': instance.route,
      'Additional': instance.additional,
      'AdditionalTripTime': instance.additionalTripTime,
      'TransitTrip': instance.transitTrip,
      'SaleStatus': instance.saleStatus,
      'ACBPDP': instance.acbpdp,
      'FactTripReturnTime': instance.factTripReturnTime,
      'Currency': instance.currency,
      'PrincipalTaxId': instance.principalTaxId,
      'CarrierData': instance.carrierData,
      'PassengerFareCostAvibus': instance.passengerFareCostAvibus,
    };

Bus _$BusFromJson(Map<String, dynamic> json) => Bus(
      json['Id'] as String?,
      json['Model'] as String?,
      json['LicencePlate'] as String?,
      json['Name'] as String?,
      json['SeatsClass'] as String?,
      json['SeatCapacity'] as int?,
      json['StandCapacity'] as int?,
      json['BaggageCapacity'] as int?,
      json['SeatsScheme'] as List<dynamic>?,
      json['GarageNum'] as String?,
    );

Map<String, dynamic> _$BusToJson(Bus instance) => <String, dynamic>{
      'Id': instance.id,
      'Model': instance.model,
      'LicencePlate': instance.licencePlate,
      'Name': instance.name,
      'SeatsClass': instance.seatsClass,
      'SeatCapacity': instance.seatCapacity,
      'StandCapacity': instance.standCapacity,
      'BaggageCapacity': instance.baggageCapacity,
      'SeatsScheme': instance.seatsScheme,
      'GarageNum': instance.garageNum,
    };

Departure _$DepartureFromJson(Map<String, dynamic> json) => Departure(
      json['Name'] as String?,
      json['Code'] as String?,
      json['Id'] as String?,
      json['Country'] as String?,
      json['Region'] as String?,
      json['District'] as String?,
      json['Automated'] as bool?,
      json['HasDestinations'] as bool?,
      json['UTC'] as String?,
      json['GPSCoordinates'] as String?,
      json['LocationType'] as String?,
      json['Locality'] as String?,
      json['StoppingPlace'] as String?,
      json['Address'] as String?,
      json['Phone'] as String?,
    );

Map<String, dynamic> _$DepartureToJson(Departure instance) => <String, dynamic>{
      'Name': instance.name,
      'Code': instance.code,
      'Id': instance.id,
      'Country': instance.country,
      'Region': instance.region,
      'District': instance.district,
      'Automated': instance.automated,
      'HasDestinations': instance.hasDestinations,
      'UTC': instance.utc,
      'GPSCoordinates': instance.gpsCoordinates,
      'LocationType': instance.locationType,
      'Locality': instance.locality,
      'StoppingPlace': instance.stoppingPlace,
      'Address': instance.address,
      'Phone': instance.phone,
    };

Destination _$DestinationFromJson(Map<String, dynamic> json) => Destination(
      json['Name'] as String?,
      json['Code'] as String?,
      json['Id'] as String?,
      json['Country'] as String?,
      json['Region'] as String?,
      json['District'] as String?,
      json['Automated'] as bool?,
      json['HasDestinations'] as bool?,
      json['UTC'] as String?,
      json['GPSCoordinates'] as String?,
      json['LocationType'] as String?,
      json['Locality'] as String?,
      json['StoppingPlace'] as String?,
      json['Address'] as String?,
      json['Phone'] as String?,
    );

Map<String, dynamic> _$DestinationToJson(Destination instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Code': instance.code,
      'Id': instance.id,
      'Country': instance.country,
      'Region': instance.region,
      'District': instance.district,
      'Automated': instance.automated,
      'HasDestinations': instance.hasDestinations,
      'UTC': instance.utc,
      'GPSCoordinates': instance.gpsCoordinates,
      'LocationType': instance.locationType,
      'Locality': instance.locality,
      'StoppingPlace': instance.stoppingPlace,
      'Address': instance.address,
      'Phone': instance.phone,
    };

CarrierData _$CarrierDataFromJson(Map<String, dynamic> json) => CarrierData(
      json['CarrierName'] as String?,
      json['CarrierTaxId'] as String?,
      json['CarrierStateRegNum'] as String?,
      (json['CarrierPersonalData'] as List<dynamic>)
          .map((e) => CarrierPersonalData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['CarrierAddress'] as String?,
      json['CarrierWorkingHours'] as String?,
    );

Map<String, dynamic> _$CarrierDataToJson(CarrierData instance) =>
    <String, dynamic>{
      'CarrierName': instance.carrierName,
      'CarrierTaxId': instance.carrierTaxId,
      'CarrierStateRegNum': instance.carrierStateRegNum,
      'CarrierPersonalData': instance.carrierPersonalData,
      'CarrierAddress': instance.carrierAddress,
      'CarrierWorkingHours': instance.carrierWorkingHours,
    };

CarrierPersonalData _$CarrierPersonalDataFromJson(Map<String, dynamic> json) =>
    CarrierPersonalData(
      json['Name'] as String?,
      json['Caption'] as String?,
      json['Mandatory'] as bool?,
      json['PersonIdentifier'] as bool?,
      json['Type'] as String?,
      json['ValueVariants'] as List<dynamic>?,
      json['InputMask'] as String?,
      json['Value'] as String?,
      json['ValueKind'] as String?,
      DefaultValueVariant.fromJson(
          json['DefaultValueVariant'] as Map<String, dynamic>),
      json['DocumentIssueDateRequired'] as String?,
      json['DocumentIssueOrgRequired'] as String?,
      json['DocumentValidityDateRequired'] as String?,
      json['DocumentInceptionDateRequired'] as String?,
      json['DocumentIssuePlaceRequired'] as String?,
      json['Value1'] as String?,
      json['Value2'] as String?,
      json['Value3'] as String?,
      json['Value4'] as String?,
      json['Value5'] as String?,
    );

Map<String, dynamic> _$CarrierPersonalDataToJson(
        CarrierPersonalData instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Caption': instance.caption,
      'Mandatory': instance.mandatory,
      'PersonIdentifier': instance.personIdentifier,
      'Type': instance.type,
      'ValueVariants': instance.valueVariants,
      'InputMask': instance.inputMask,
      'Value': instance.value,
      'ValueKind': instance.valueKind,
      'DefaultValueVariant': instance.defaultValueVariant,
      'DocumentIssueDateRequired': instance.documentIssueDateRequired,
      'DocumentIssueOrgRequired': instance.documentIssueOrgRequired,
      'DocumentValidityDateRequired': instance.documentValidityDateRequired,
      'DocumentInceptionDateRequired': instance.documentInceptionDateRequired,
      'DocumentIssuePlaceRequired': instance.documentIssuePlaceRequired,
      'Value1': instance.value1,
      'Value2': instance.value2,
      'Value3': instance.value3,
      'Value4': instance.value4,
      'Value5': instance.value5,
    };

DefaultValueVariant _$DefaultValueVariantFromJson(Map<String, dynamic> json) =>
    DefaultValueVariant(
      json['Name'] as String?,
      json['InputMask'] as String?,
      json['ValueProperty1'] as String?,
      json['ValueProperty2'] as String?,
      json['ValueProperty3'] as String?,
      json['ValueProperty4'] as String?,
      json['ValueProperty5'] as String?,
    );

Map<String, dynamic> _$DefaultValueVariantToJson(
        DefaultValueVariant instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'InputMask': instance.inputMask,
      'ValueProperty1': instance.valueProperty1,
      'ValueProperty2': instance.valueProperty2,
      'ValueProperty3': instance.valueProperty3,
      'ValueProperty4': instance.valueProperty4,
      'ValueProperty5': instance.valueProperty5,
    };
