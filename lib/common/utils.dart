class Utils {
  static int getIdFromUrl(String url){
    int index = url.lastIndexOf('/');
    if(index < 0)return index;
    String subString = url.substring(index + 1);
    return int.parse(subString);
  }
}