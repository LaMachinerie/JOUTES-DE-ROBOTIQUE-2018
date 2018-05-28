class Score{
  Score(){
    _id = 0;
    _highScore = 0;
    _city = "NONE";
    _name = "NONE";
  }
  
  Score(int id, long highScore, String name, String city){
    _id = id;
    _highScore = highScore;
    _city = city;
    _name = name;
  }
  
  public int getId(){
    return _id;
  }
  
  public long getScore(){
    return _highScore;
  }
  
  public String getTeamName(){
    return _name;
  }
  
  public String getCity(){
    return _city;
  }
    
    
  public void setId(int id){
    _id = id;
  }
  
  public void setScore(long score){
    _highScore = score;
  }
  
  public void setTeamName(String name){
     _name = name;
  }
  
  public void setCity(String city){
    _city = city;
  }
  
  int _id;
  long _highScore;
  String _city;
  String _name;  
};