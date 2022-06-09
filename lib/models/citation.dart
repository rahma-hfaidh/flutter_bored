class Citation {
  int id_citation=0;
  String description="";

  Citation(this.id_citation, this.description);


  Citation.formJson(Map<String, dynamic> json) {
    id_citation = json['id_citation'];
    description = json['description'];
  }

  Map<String, dynamic> toJson(Citation c) => {
    'id_citation': c.id_citation,
    'description': c.description,


  };
}