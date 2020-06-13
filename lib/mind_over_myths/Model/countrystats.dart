class CountryStats{

int updated;
String country;
var countryInfo;
String flag;
int cases;
int deaths;
int recovered;
int todayDeaths;
int active;
int critical;
int todayCases;


CountryStats({this.updated, this.country, this.countryInfo, this.cases, this.deaths, this.recovered, this.todayDeaths, this.active, this.critical, this.todayCases,this.flag });




factory CountryStats.fromJson(Map<String, dynamic> json){
  return CountryStats(
    updated: json['updated'],
    country: json['country'],
    countryInfo: json['countryInfo'],
    cases: json['cases'],
    deaths: json['deaths'],
    recovered: json['recovered'],
    active: json['active'],
    critical: json['critical'],
    todayCases: json['todayCases'],
    todayDeaths: json['todayDeaths'],
    flag: json['countryInfo']['flag']

  );
}

}

