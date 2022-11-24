class Event {
  String _id;
  String typeEvent;
  List members;
  String owner;
  String location;
  String duration;
  DateTime date;
  String discipline;
  String level;
  List pictures;

  Event(this._id, this.typeEvent, this.members, this.owner, this.location,
      this.duration, this.date, this.discipline, this.level, this.pictures);
}
