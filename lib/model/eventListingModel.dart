// To parse this JSON data, do
//
//     final evenListingModel = evenListingModelFromJson(jsonString);

import 'dart:convert';

EvenListingModel evenListingModelFromJson(String str) => EvenListingModel.fromJson(json.decode(str));

String evenListingModelToJson(EvenListingModel data) => json.encode(data.toJson());

class EvenListingModel {
  EvenListingModel({
    this.events,
    this.meta,
  });

  List<Event> events;
  Meta meta;

  factory EvenListingModel.fromJson(Map<String, dynamic> json) => EvenListingModel(
    events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "events": List<dynamic>.from(events.map((x) => x.toJson())),
    "meta": meta.toJson(),
  };
}

class Event {
  Event({
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

  Type type;
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
  EventStats stats;
  List<Taxonomy> taxonomies;
  String url;
  double score;
  DateTime announceDate;
  DateTime createdAt;
  bool dateTbd;
  String title;
  double popularity;
  String description;
  Status status;
  AccessMethod accessMethod;
  EventPromotion eventPromotion;
  Announcements announcements;
  bool conditional;
  dynamic enddatetimeUtc;
  List<dynamic> themes;
  List<dynamic> domainInformation;
  bool isFavourite;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    type: typeValues.map[json["type"]],
    id: json["id"],
    isFavourite: false,
    datetimeUtc: DateTime.parse(json["datetime_utc"]),
    venue: Venue.fromJson(json["venue"]),
    datetimeTbd: json["datetime_tbd"],
    performers: List<Performer>.from(json["performers"].map((x) => Performer.fromJson(x))),
    isOpen: json["is_open"],
    links: List<dynamic>.from(json["links"].map((x) => x)),
    datetimeLocal: DateTime.parse(json["datetime_local"]),
    timeTbd: json["time_tbd"],
    shortTitle: json["short_title"],
    visibleUntilUtc: DateTime.parse(json["visible_until_utc"]),
    // stats: EventStats.fromJson(json["stats"]),
    // taxonomies: List<Taxonomy>.from(json["taxonomies"].map((x) => Taxonomy.fromJson(x))),
    url: json["url"],
    // score: json["score"].toDouble(),
    announceDate: DateTime.parse(json["announce_date"]),
    createdAt: DateTime.parse(json["created_at"]),
    dateTbd: json["date_tbd"],
    title: json["title"],
    popularity: json["popularity"].toDouble(),
    description: json["description"],
    status: statusValues.map[json["status"]],
    accessMethod: json["access_method"] == null ? null : AccessMethod.fromJson(json["access_method"]),
    eventPromotion: json["event_promotion"] == null ? null : EventPromotion.fromJson(json["event_promotion"]),
    announcements: json["announcements"] == null ? null :Announcements.fromJson(json["announcements"]),
    conditional: json["conditional"],
    enddatetimeUtc: json["enddatetime_utc"],
    // themes: List<dynamic>.from(json["themes"].map((x) => x)),
    // domainInformation: List<dynamic>.from(json["domain_information"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": typeValues.reverse[type],
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
    "status": statusValues.reverse[status],
    "access_method": accessMethod == null ? null : accessMethod.toJson(),
    "event_promotion": eventPromotion == null ? null : eventPromotion.toJson(),
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

  Method method;
  DateTime createdAt;
  bool employeeOnly;

  factory AccessMethod.fromJson(Map<String, dynamic> json) => AccessMethod(
    method: methodValues.map[json["method"]],
    createdAt: DateTime.parse(json["created_at"]),
    employeeOnly: json["employee_only"],
  );

  Map<String, dynamic> toJson() => {
    "method": methodValues.reverse[method],
    "created_at": createdAt.toIso8601String(),
    "employee_only": employeeOnly,
  };
}

enum Method { PDF417 }

final methodValues = EnumValues({
  "PDF417": Method.PDF417
});

class Announcements {
  Announcements({
    this.checkoutDisclosures,
  });

  CheckoutDisclosures checkoutDisclosures;

  factory Announcements.fromJson(Map<String, dynamic> json) => Announcements(
    checkoutDisclosures: json["checkout_disclosures"] == null ? null : CheckoutDisclosures.fromJson(json["checkout_disclosures"]),
  );

  Map<String, dynamic> toJson() => {
    "checkout_disclosures": checkoutDisclosures == null ? null : checkoutDisclosures.toJson(),
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

class EventPromotion {
  EventPromotion({
    this.headline,
    this.additionalInfo,
    this.images,
  });

  String headline;
  String additionalInfo;
  EventPromotionImages images;

  factory EventPromotion.fromJson(Map<String, dynamic> json) => EventPromotion(
    headline: json["headline"],
    additionalInfo: json["additional_info"],
    images: EventPromotionImages.fromJson(json["images"]),
  );

  Map<String, dynamic> toJson() => {
    "headline": headline,
    "additional_info": additionalInfo,
    "images": images.toJson(),
  };
}

class EventPromotionImages {
  EventPromotionImages({
    this.icon,
    this.png2X,
    this.png3X,
  });

  String icon;
  String png2X;
  String png3X;

  factory EventPromotionImages.fromJson(Map<String, dynamic> json) => EventPromotionImages(
    icon: json["icon"],
    png2X: json["png@2x"],
    png3X: json["png@3x"],
  );

  Map<String, dynamic> toJson() => {
    "icon": icon,
    "png@2x": png2X,
    "png@3x": png3X,
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

  Type type;
  String name;
  String image;
  int id;
  String images;
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
    type: typeValues.map[json["type"]],
    name: json["name"],
    image: json["image"],
    id: json["id"],
    // images: json["images"].toString(),
    // hasUpcomingEvents: json["has_upcoming_events"],
    // primary: json["primary"],
    // stats: PerformerStats.fromJson(json["stats"]),
    // taxonomies: List<Taxonomy>.from(json["taxonomies"].map((x) => Taxonomy.fromJson(x))),
    // imageAttribution: json["image_attribution"],
    // url: json["url"],
    // score: json["score"].toDouble(),
    // slug: json["slug"],
    // homeVenueId: json["home_venue_id"],
    // shortName: json["short_name"],
    // numUpcomingEvents: json["num_upcoming_events"],
    // imageLicense: json["image_license"],
    // popularity: json["popularity"],
    // homeTeam: json["home_team"] == null ? null : json["home_team"],
    // location: Location.fromJson(json["location"]),
    // imageRightsMessage: json["image_rights_message"],
    // awayTeam: json["away_team"] == null ? null : json["away_team"],
  );

  Map<String, dynamic> toJson() => {
    "type": typeValues.reverse[type],
    "name": name,
    "image": image,
    "id": id,
    "images": images,
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
  ShortName shortName;
  DisplayName displayName;
  DisplayType displayType;
  int divisionLevel;
  DivisionSlug slug;

  factory Division.fromJson(Map<String, dynamic> json) => Division(
    taxonomyId: json["taxonomy_id"],
    shortName: json["short_name"] == null ? null : shortNameValues.map[json["short_name"]],
    displayName: displayNameValues.map[json["display_name"]],
    displayType: displayTypeValues.map[json["display_type"]],
    divisionLevel: json["division_level"],
    slug: json["slug"] == null ? null : divisionSlugValues.map[json["slug"]],
  );

  Map<String, dynamic> toJson() => {
    "taxonomy_id": taxonomyId,
    "short_name": shortName == null ? null : shortNameValues.reverse[shortName],
    "display_name": displayNameValues.reverse[displayName],
    "display_type": displayTypeValues.reverse[displayType],
    "division_level": divisionLevel,
    "slug": slug == null ? null : divisionSlugValues.reverse[slug],
  };
}

enum DisplayName { NATIONAL_LEAGUE, NATIONAL_LEAGUE_EAST, AMERICAN_LEAGUE, AMERICAN_LEAGUE_WEST, AMERICAN_LEAGUE_EAST, AMERICAN_LEAGUE_CENTRAL }

final displayNameValues = EnumValues({
  "American League": DisplayName.AMERICAN_LEAGUE,
  "American League Central": DisplayName.AMERICAN_LEAGUE_CENTRAL,
  "American League East": DisplayName.AMERICAN_LEAGUE_EAST,
  "American League West": DisplayName.AMERICAN_LEAGUE_WEST,
  "National League": DisplayName.NATIONAL_LEAGUE,
  "National League East": DisplayName.NATIONAL_LEAGUE_EAST
});

enum DisplayType { LEAGUE, DIVISION }

final displayTypeValues = EnumValues({
  "Division": DisplayType.DIVISION,
  "League": DisplayType.LEAGUE
});

enum ShortName { NL_EAST, AL_WEST, AL_EAST, AL_CENTRAL }

final shortNameValues = EnumValues({
  "AL Central": ShortName.AL_CENTRAL,
  "AL East": ShortName.AL_EAST,
  "AL West": ShortName.AL_WEST,
  "NL East": ShortName.NL_EAST
});

enum DivisionSlug { NATIONAL_LEAGUE_EAST, AMERICAN_LEAGUE_WEST, AMERICAN_LEAGUE_EAST, AMERICAN_LEAGUE_CENTRAL }

final divisionSlugValues = EnumValues({
  "american-league-central": DivisionSlug.AMERICAN_LEAGUE_CENTRAL,
  "american-league-east": DivisionSlug.AMERICAN_LEAGUE_EAST,
  "american-league-west": DivisionSlug.AMERICAN_LEAGUE_WEST,
  "national-league-east": DivisionSlug.NATIONAL_LEAGUE_EAST
});

class PerformerImages {
  PerformerImages({
    this.huge,
  });

  String huge;

  factory PerformerImages.fromJson(Map<String, dynamic> json) => PerformerImages(
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
  Type name;
  int parentId;
  DocumentSource documentSource;
  int rank;

  factory Taxonomy.fromJson(Map<String, dynamic> json) => Taxonomy(
    id: json["id"],
    name: typeValues.map[json["name"]],
    parentId: json["parent_id"] == null ? null : json["parent_id"],
    documentSource: json["document_source"] == null ? null : DocumentSource.fromJson(json["document_source"]),
    rank: json["rank"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": typeValues.reverse[name],
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

  SourceType sourceType;
  GenerationType generationType;

  factory DocumentSource.fromJson(Map<String, dynamic> json) => DocumentSource(
    sourceType: sourceTypeValues.map[json["source_type"]],
    generationType: generationTypeValues.map[json["generation_type"]],
  );

  Map<String, dynamic> toJson() => {
    "source_type": sourceTypeValues.reverse[sourceType],
    "generation_type": generationTypeValues.reverse[generationType],
  };
}

enum GenerationType { FULL }

final generationTypeValues = EnumValues({
  "FULL": GenerationType.FULL
});

enum SourceType { ELASTIC }

final sourceTypeValues = EnumValues({
  "ELASTIC": SourceType.ELASTIC
});

enum Type { SPORTS, BASEBALL, MLB }

final typeValues = EnumValues({
  "baseball": Type.BASEBALL,
  "mlb": Type.MLB,
  "sports": Type.SPORTS
});

class EventStats {
  EventStats({
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

  factory EventStats.fromJson(Map<String, dynamic> json) => EventStats(
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

enum Status { NORMAL }

final statusValues = EnumValues({
  "normal": Status.NORMAL
});

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

  State state;
  String nameV2;
  String postalCode;
  Name name;
  List<dynamic> links;
  Timezone timezone;
  String url;
  double score;
  Location location;
  Address address;
  Country country;
  bool hasUpcomingEvents;
  int numUpcomingEvents;
  City city;
  VenueSlug slug;
  ExtendedAddress extendedAddress;
  int id;
  int popularity;
  AccessMethod accessMethod;
  int metroCode;
  int capacity;
  DisplayLocation displayLocation;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
    state: stateValues.map[json["state"]],
    nameV2: json["name_v2"].toString(),
    postalCode: json["postal_code"],
    name: nameValues.map[json["name"]],
    links: List<dynamic>.from(json["links"].map((x) => x)),
    timezone: timezoneValues.map[json["timezone"]],
    url: json["url"],
    score: json["score"].toDouble(),
    location: Location.fromJson(json["location"]),
    address: addressValues.map[json["address"]],
    country: countryValues.map[json["country"]],
    hasUpcomingEvents: json["has_upcoming_events"],
    numUpcomingEvents: json["num_upcoming_events"],
    city: cityValues.map[json["city"]],
    slug: venueSlugValues.map[json["slug"]],
    extendedAddress: extendedAddressValues.map[json["extended_address"]],
    id: json["id"],
    popularity: json["popularity"],
    accessMethod: json["access_method"] == null ? null : AccessMethod.fromJson(json["access_method"]),
    metroCode: json["metro_code"],
    capacity: json["capacity"],
    displayLocation: displayLocationValues.map[json["display_location"]],
  );

  Map<String, dynamic> toJson() => {
    "state": stateValues.reverse[state],
    "name_v2": nameValues.reverse[nameV2],
    "postal_code": postalCode,
    "name": nameValues.reverse[name],
    "links": List<dynamic>.from(links.map((x) => x)),
    "timezone": timezoneValues.reverse[timezone],
    "url": url,
    "score": score,
    "location": location.toJson(),
    "address": addressValues.reverse[address],
    "country": countryValues.reverse[country],
    "has_upcoming_events": hasUpcomingEvents,
    "num_upcoming_events": numUpcomingEvents,
    "city": cityValues.reverse[city],
    "slug": venueSlugValues.reverse[slug],
    "extended_address": extendedAddressValues.reverse[extendedAddress],
    "id": id,
    "popularity": popularity,
    "access_method": accessMethod == null ? null : accessMethod.toJson(),
    "metro_code": metroCode,
    "capacity": capacity,
    "display_location": displayLocationValues.reverse[displayLocation],
  };
}

enum Address { THE_12301_ROOSEVELT_AVENUE, THE_333_WEST_CAMDEN_STREET, THE_734_STADIUM_DRIVE }

final addressValues = EnumValues({
  "123-01 Roosevelt Avenue": Address.THE_12301_ROOSEVELT_AVENUE,
  "333 West Camden Street": Address.THE_333_WEST_CAMDEN_STREET,
  "734 Stadium Drive": Address.THE_734_STADIUM_DRIVE
});

enum City { FLUSHING, BALTIMORE, ARLINGTON }

final cityValues = EnumValues({
  "Arlington": City.ARLINGTON,
  "Baltimore": City.BALTIMORE,
  "Flushing": City.FLUSHING
});

enum Country { US }

final countryValues = EnumValues({
  "US": Country.US
});

enum DisplayLocation { FLUSHING_NY, BALTIMORE_MD, ARLINGTON_TX }

final displayLocationValues = EnumValues({
  "Arlington, TX": DisplayLocation.ARLINGTON_TX,
  "Baltimore, MD": DisplayLocation.BALTIMORE_MD,
  "Flushing, NY": DisplayLocation.FLUSHING_NY
});

enum ExtendedAddress { FLUSHING_NY_11368, BALTIMORE_MD_21202, ARLINGTON_TX_76011 }

final extendedAddressValues = EnumValues({
  "Arlington, TX 76011": ExtendedAddress.ARLINGTON_TX_76011,
  "Baltimore, MD 21202": ExtendedAddress.BALTIMORE_MD_21202,
  "Flushing, NY 11368": ExtendedAddress.FLUSHING_NY_11368
});

enum Name { CITI_FIELD, ORIOLE_PARK_AT_CAMDEN_YARDS, GLOBE_LIFE_FIELD }

final nameValues = EnumValues({
  "Citi Field": Name.CITI_FIELD,
  "Globe Life Field": Name.GLOBE_LIFE_FIELD,
  "Oriole Park at Camden Yards": Name.ORIOLE_PARK_AT_CAMDEN_YARDS
});

enum VenueSlug { CITI_FIELD, ORIOLE_PARK_AT_CAMDEN_YARDS, GLOBE_LIFE_FIELD }

final venueSlugValues = EnumValues({
  "citi-field": VenueSlug.CITI_FIELD,
  "globe-life-field": VenueSlug.GLOBE_LIFE_FIELD,
  "oriole-park-at-camden-yards": VenueSlug.ORIOLE_PARK_AT_CAMDEN_YARDS
});

enum State { NY, MD, TX }

final stateValues = EnumValues({
  "MD": State.MD,
  "NY": State.NY,
  "TX": State.TX
});

enum Timezone { AMERICA_NEW_YORK, AMERICA_CHICAGO }

final timezoneValues = EnumValues({
  "America/Chicago": Timezone.AMERICA_CHICAGO,
  "America/New_York": Timezone.AMERICA_NEW_YORK
});

class Meta {
  Meta({
    this.total,
    this.took,
    this.page,
    this.perPage,
    this.geolocation,
  });

  int total;
  int took;
  int page;
  int perPage;
  dynamic geolocation;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    total: json["total"],
    took: json["took"],
    page: json["page"],
    perPage: json["per_page"],
    geolocation: json["geolocation"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "took": took,
    "page": page,
    "per_page": perPage,
    "geolocation": geolocation,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
