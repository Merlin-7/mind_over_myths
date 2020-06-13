class Stats{
int cases;
int deaths;
int recovered;
int active;
int updated;
Stats({
  this.cases,
  this.deaths,
  this.recovered,
  this.active,
  this.updated,


});


 factory Stats.fromJson(Map<String, dynamic >json){
   return Stats(
        cases: json['cases'],
        deaths: json['deaths'],
        recovered : json['recovered'],
        active : json['active'],
        updated : json['updated'],
        );
 }


}