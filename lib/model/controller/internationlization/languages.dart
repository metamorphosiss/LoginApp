class Languages{
 
  final String name;
  final String languageCode;
  final String country;
  Languages(this.name,this.languageCode,this.country);
  static List<Languages> languageList(){
    return <Languages> [
      Languages('فارسی','ar','QA'),
      Languages('English','en','US'),
    ];
  }
}
