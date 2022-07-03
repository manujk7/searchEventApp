// To parse this JSON data, do
//
//     final eventDetailModel = eventDetailModelFromJson(jsonString);

import 'dart:convert';

EventDetailModel eventDetailModelFromJson(String str) => EventDetailModel.fromJson(json.decode(str));

String eventDetailModelToJson(EventDetailModel data) => json.encode(data.toJson());

class EventDetailModel {
  EventDetailModel({
    this.type,
    this.id,
    this.datetimeUtc,
    this.venue,
    this.datetimeTbd,
    this.performers,
    this.isOpen,
    this.links,
    this.datetimeLocal,
    this.timeTbd,
    this.shortTitle,
    this.visibleUntilUtc,
    this.stats,
    this.taxonomies,
    this.url,
    this.score,
    this.announceDate,
    this.createdAt,
    this.dateTbd,
    this.title,
    this.popularity,
    this.description,
    this.status,
    this.accessMethod,
    this.eventPromotion,
    this.announcements,
    this.conditional,
    this.enddatetimeUtc,
    this.themes,
    this.domainInformation,
    this.isFavourite
  });

  String type;
  int id;
  DateTime datetimeUtc;
  Venue venue;
  bool datetimeTbd;
  List<Performer> performers;
  bool isOpen;
  List<dynamic> links;
  DateTime datetimeLocal;
  bool timeTbd;
  String shortTitle;
  DateTime visibleUntilUtc;
  EventDetailModelStats stats;
  List<Taxonomy> taxonomies;
  String url;
  double score;
  DateTime announceDate;
  DateTime createdAt;
  bool dateTbd;
  String title;
  double popularity;
  String description;
  String status;
  AccessMethod accessMethod;
  dynamic eventPromotion;
  Announcements announcements;
  bool conditional;
  dynamic enddatetimeUtc;
  List<dynamic> themes;
  List<dynamic> domainInformation;
  bool isFavourite;

  factory EventDetailModel.fromJson(Map<String, dynamic> json) => EventDetailModel(
    type: json["type"],
    id: json["id"],
    isFavourite: false,
    datetimeUtc: DateTime.parse(json["datetime_utc"]),
    venue: Venue.fromJson(json["venue"]),
    datetimeTbd: json["datetime_tbd"],
    performers: List<Performer>.from(json["performers"].map((x) => Performer.fromJson(x))),
    isOpen: json["is_open"],
    // links: List<dynamic>.from(json["links"].map((x) => x)),
    datetimeLocal: DateTime.parse(json["datetime_local"]),
    timeTbd: json["time_tbd"],
    shortTitle: json["short_title"],
    // visibleUntilUtc: DateTime.parse(json["visible_until_utc"]),
    // stats: EventDetailModelStats.fromJson(json["stats"]),
    // taxonomies: List<Taxonomy>.from(json["taxonomies"].map((x) => Taxonomy.fromJson(x))),
    // url: json["url"],
    // score: json["score"].toDouble(),
    // announceDate: DateTime.parse(json["announce_date"]),
    // createdAt: DateTime.parse(json["created_at"]),
    dateTbd: json["date_tbd"],
    title: json["title"],
    // popularity: json["popularity"].toDouble(),
    description: json["description"],
    status: json["status"],
    // accessMethod: AccessMethod.fromJson(json["access_method"]),
    // eventPromotion: json["event_promotion"],
    // announcements: Announcements.fromJson(json["announcements"]),
    // conditional: json["conditional"],
    // enddatetimeUtc: json["enddatetime_utc"],
    // themes: List<dynamic>.from(json["themes"].map((x) => x)),
    // domainInformation: List<dynamic>.from(json["domain_information"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "datetime_utc": datetimeUtc.toIso8601String(),
    "venue": venue.toJson(),
    "datetime_tbd": datetimeTbd,
    "performers": List<dynamic>.from(performers.map((x) => x.toJson())),
    "is_open": isOpen,
    "links": List<dynamic>.from(links.map((x) => x)),
    "datetime_local": datetimeLocal.toIso8601String(),
    "time_tbd": timeTbd,
    "short_title": shortTitle,
    "visible_until_utc": visibleUntilUtc.toIso8601String(),
    "stats": stats.toJson(),
    "taxonomies": List<dynamic>.from(taxonomies.map((x) => x.toJson())),
    "url": url,
    "score": score,
    "announce_date": announceDate.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "date_tbd": dateTbd,
    "title": title,
    "popularity": popularity,
    "description": description,
    "status": status,
    "access_method": accessMethod.toJson(),
    "event_promotion": eventPromotion,
    "announcements": announcements.toJson(),
    "conditional": conditional,
    "enddatetime_utc": enddatetimeUtc,
    "themes": List<dynamic>.from(themes.map((x) => x)),
    "domain_information": List<dynamic>.from(domainInformation.map((x) => x)),
  };
}

class AccessMethod {
  AccessMethod({
    this.method,
    this.createdAt,
    this.employeeOnly,
  });

  String method;
  DateTime createdAt;
  bool employeeOnly;

  factory AccessMethod.fromJson(Map<String, dynamic> json) => AccessMethod(
    method: json["method"],
    createdAt: DateTime.parse(json["created_at"]),
    employeeOnly: json["employee_only"],
  );

  Map<String, dynamic> toJson() => {
    "method": method,
    "created_at": createdAt.toIso8601String(),
    "employee_only": employeeOnly,
  };
}

class Announcements {
  Announcements({
    this.checkoutDisclosures,
  });

  CheckoutDisclosures checkoutDisclosures;

  factory Announcements.fromJson(Map<String, dynamic> json) => Announcements(
    checkoutDisclosures: CheckoutDisclosures.fromJson(json["checkout_disclosures"]),
  );

  Map<String, dynamic> toJson() => {
    "checkout_disclosures": checkoutDisclosures.toJson(),
  };
}

class CheckoutDisclosures {
  CheckoutDisclosures({
    this.messages,
  });

  List<Message> messages;

  factory CheckoutDisclosures.fromJson(Map<String, dynamic> json) => CheckoutDisclosures(
    messages: List<Message>.from(json["messages"].map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
  };
}

class Message {
  Message({
    this.text,
  });

  String text;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
  };
}

class Performer {
  Performer({
    this.type,
    this.name,
    this.image,
    this.id,
    this.images,
    this.divisions,
    this.hasUpcomingEvents,
    this.primary,
    this.stats,
    this.taxonomies,
    this.imageAttribution,
    this.url,
    this.score,
    this.slug,
    this.homeVenueId,
    this.shortName,
    this.numUpcomingEvents,
    this.colors,
    this.imageLicense,
    this.popularity,
    this.homeTeam,
    this.location,
    this.imageRightsMessage,
    this.awayTeam,
  });

  String type;
  String name;
  String image;
  int id;
  Images images;
  List<Division> divisions;
  bool hasUpcomingEvents;
  bool primary;
  PerformerStats stats;
  List<Taxonomy> taxonomies;
  String imageAttribution;
  String url;
  double score;
  String slug;
  int homeVenueId;
  String shortName;
  int numUpcomingEvents;
  Colors colors;
  String imageLicense;
  int popularity;
  bool homeTeam;
  Location location;
  String imageRightsMessage;
  bool awayTeam;

  factory Performer.fromJson(Map<String, dynamic> json) => Performer(
    type: json["type"],
    name: json["name"],
    image: json["image"],
    id: json["id"],
    // images: Images.fromJson(json["images"]),
    // divisions: List<Division>.from(json["divisions"].map((x) => Division.fromJson(x))),
    // hasUpcomingEvents: json["has_upcoming_events"],
    // primary: json["primary"] == null ? null : json["primary"],
    // stats: PerformerStats.fromJson(json["stats"]),
    // taxonomies: List<Taxonomy>.from(json["taxonomies"].map((x) => Taxonomy.fromJson(x))),
    // imageAttribution: json["image_attribution"],
    // url: json["url"],
    // score: json["score"].toDouble(),
    // slug: json["slug"],
    // homeVenueId: json["home_venue_id"],
    // shortName: json["short_name"],
    // numUpcomingEvents: json["num_upcoming_events"],
    // colors: Colors.fromJson(json["colors"]),
    // imageLicense: json["image_license"],
    // popularity: json["popularity"],
    // homeTeam: json["home_team"] == null ? null : json["home_team"],
    // location: Location.fromJson(json["location"]),
    // imageRightsMessage: json["image_rights_message"],
    // awayTeam: json["away_team"] == null ? null : json["away_team"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "name": name,
    "image": image,
    "id": id,
    "images": images.toJson(),
    "divisions": List<dynamic>.from(divisions.map((x) => x.toJson())),
    "has_upcoming_events": hasUpcomingEvents,
    "primary": primary == null ? null : primary,
    "stats": stats.toJson(),
    "taxonomies": List<dynamic>.from(taxonomies.map((x) => x.toJson())),
    "image_attribution": imageAttribution,
    "url": url,
    "score": score,
    "slug": slug,
    "home_venue_id": homeVenueId,
    "short_name": shortName,
    "num_upcoming_events": numUpcomingEvents,
    "colors": colors.toJson(),
    "image_license": imageLicense,
    "popularity": popularity,
    "home_team": homeTeam == null ? null : homeTeam,
    "location": location.toJson(),
    "image_rights_message": imageRightsMessage,
    "away_team": awayTeam == null ? null : awayTeam,
  };
}

class Colors {
  Colors({
    this.all,
    this.iconic,
    this.primary,
  });

  List<String> all;
  String iconic;
  List<String> primary;

  factory Colors.fromJson(Map<String, dynamic> json) => Colors(
    all: List<String>.from(json["all"].map((x) => x)),
    iconic: json["iconic"],
    primary: List<String>.from(json["primary"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "all": List<dynamic>.from(all.map((x) => x)),
    "iconic": iconic,
    "primary": List<dynamic>.from(primary.map((x) => x)),
  };
}

class Division {
  Division({
    this.taxonomyId,
    this.shortName,
    this.displayName,
    this.displayType,
    this.divisionLevel,
    this.slug,
  });

  int taxonomyId;
  String shortName;
  String displayName;
  String displayType;
  int divisionLevel;
  String slug;

  factory Division.fromJson(Map<String, dynamic> json) => Division(
    taxonomyId: json["taxonomy_id"],
    shortName: json["short_name"] == null ? null : json["short_name"],
    displayName: json["display_name"],
    displayType: json["display_type"],
    divisionLevel: json["division_level"],
    slug: json["slug"] == null ? null : json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "taxonomy_id": taxonomyId,
    "short_name": shortName == null ? null : shortName,
    "display_name": displayName,
    "display_type": displayType,
    "division_level": divisionLevel,
    "slug": slug == null ? null : slug,
  };
}

class Images {
  Images({
    this.huge,
  });

  String huge;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    huge: json["huge"],
  );

  Map<String, dynamic> toJson() => {
    "huge": huge,
  };
}

class Location {
  Location({
    this.lat,
    this.lon,
  });

  double lat;
  double lon;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    lat: json["lat"].toDouble(),
    lon: json["lon"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
  };
}

class PerformerStats {
  PerformerStats({
    this.eventCount,
  });

  int eventCount;

  factory PerformerStats.fromJson(Map<String, dynamic> json) => PerformerStats(
    eventCount: json["event_count"],
  );

  Map<String, dynamic> toJson() => {
    "event_count": eventCount,
  };
}

class Taxonomy {
  Taxonomy({
    this.id,
    this.name,
    this.parentId,
    this.documentSource,
    this.rank,
  });

  int id;
  String name;
  int parentId;
  DocumentSource documentSource;
  int rank;

  factory Taxonomy.fromJson(Map<String, dynamic> json) => Taxonomy(
    id: json["id"],
    name: json["name"],
    parentId: json["parent_id"] == null ? null : json["parent_id"],
    documentSource: json["document_source"] == null ? null : DocumentSource.fromJson(json["document_source"]),
    rank: json["rank"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "parent_id": parentId == null ? null : parentId,
    "document_source": documentSource == null ? null : documentSource.toJson(),
    "rank": rank,
  };
}

class DocumentSource {
  DocumentSource({
    this.sourceType,
    this.generationType,
  });

  String sourceType;
  String generationType;

  factory DocumentSource.fromJson(Map<String, dynamic> json) => DocumentSource(
    sourceType: json["source_type"],
    generationType: json["generation_type"],
  );

  Map<String, dynamic> toJson() => {
    "source_type": sourceType,
    "generation_type": generationType,
  };
}

class EventDetailModelStats {
  EventDetailModelStats({
    this.listingCount,
    this.averagePrice,
    this.lowestPriceGoodDeals,
    this.lowestPrice,
    this.highestPrice,
    this.visibleListingCount,
    this.dqBucketCounts,
    this.medianPrice,
    this.lowestSgBasePrice,
    this.lowestSgBasePriceGoodDeals,
  });

  int listingCount;
  int averagePrice;
  int lowestPriceGoodDeals;
  int lowestPrice;
  int highestPrice;
  int visibleListingCount;
  List<int> dqBucketCounts;
  int medianPrice;
  int lowestSgBasePrice;
  int lowestSgBasePriceGoodDeals;

  factory EventDetailModelStats.fromJson(Map<String, dynamic> json) => EventDetailModelStats(
    listingCount: json["listing_count"],
    averagePrice: json["average_price"],
    lowestPriceGoodDeals: json["lowest_price_good_deals"],
    lowestPrice: json["lowest_price"],
    highestPrice: json["highest_price"],
    visibleListingCount: json["visible_listing_count"],
    dqBucketCounts: List<int>.from(json["dq_bucket_counts"].map((x) => x)),
    medianPrice: json["median_price"],
    lowestSgBasePrice: json["lowest_sg_base_price"],
    lowestSgBasePriceGoodDeals: json["lowest_sg_base_price_good_deals"],
  );

  Map<String, dynamic> toJson() => {
    "listing_count": listingCount,
    "average_price": averagePrice,
    "lowest_price_good_deals": lowestPriceGoodDeals,
    "lowest_price": lowestPrice,
    "highest_price": highestPrice,
    "visible_listing_count": visibleListingCount,
    "dq_bucket_counts": List<dynamic>.from(dqBucketCounts.map((x) => x)),
    "median_price": medianPrice,
    "lowest_sg_base_price": lowestSgBasePrice,
    "lowest_sg_base_price_good_deals": lowestSgBasePriceGoodDeals,
  };
}

class Venue {
  Venue({
    this.state,
    this.nameV2,
    this.postalCode,
    this.name,
    this.links,
    this.timezone,
    this.url,
    this.score,
    this.location,
    this.address,
    this.country,
    this.hasUpcomingEvents,
    this.numUpcomingEvents,
    this.city,
    this.slug,
    this.extendedAddress,
    this.id,
    this.popularity,
    this.accessMethod,
    this.metroCode,
    this.capacity,
    this.displayLocation,
  });

  String state;
  String nameV2;
  String postalCode;
  String name;
  List<dynamic> links;
  String timezone;
  String url;
  double score;
  Location location;
  String address;
  String country;
  bool hasUpcomingEvents;
  int numUpcomingEvents;
  String city;
  String slug;
  String extendedAddress;
  int id;
  int popularity;
  AccessMethod accessMethod;
  int metroCode;
  int capacity;
  String displayLocation;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
    state: json["state"],
    nameV2: json["name_v2"],
    postalCode: json["postal_code"],
    name: json["name"],
    // links: List<dynamic>.from(json["links"].map((x) => x)),
    timezone: json["timezone"],
    url: json["url"],
    score: json["score"].toDouble(),
    // location: Location.fromJson(json["location"]),
    address: json["address"],
    country: json["country"],
    hasUpcomingEvents: json["has_upcoming_events"],
    numUpcomingEvents: json["num_upcoming_events"],
    city: json["city"],
    slug: json["slug"],
    extendedAddress: json["extended_address"],
    id: json["id"],
    popularity: json["popularity"],
    // accessMethod: AccessMethod.fromJson(json["access_method"]),
    metroCode: json["metro_code"],
    capacity: json["capacity"],
    displayLocation: json["display_location"],
  );

  Map<String, dynamic> toJson() => {
    "state": state,
    "name_v2": nameV2,
    "postal_code": postalCode,
    "name": name,
    "links": List<dynamic>.from(links.map((x) => x)),
    "timezone": timezone,
    "url": url,
    "score": score,
    "location": location.toJson(),
    "address": address,
    "country": country,
    "has_upcoming_events": hasUpcomingEvents,
    "num_upcoming_events": numUpcomingEvents,
    "city": city,
    "slug": slug,
    "extended_address": extendedAddress,
    "id": id,
    "popularity": popularity,
    "access_method": accessMethod.toJson(),
    "metro_code": metroCode,
    "capacity": capacity,
    "display_location": displayLocation,
  };
}
