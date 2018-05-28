XML xml;

ArrayList<Score> scoreBoard;
int maxId = 0;
 
void loadScore() {
  scoreBoard = new ArrayList<Score>();
  
  xml = loadXML("score.xml");
  xml.print();
  
  if(xml != null){
    XML[] children = xml.getChildren("player");
    Score temp = new Score();
    
    for (int i = 0; i < children.length; i++) {
      temp.setId(children[i].getInt("id"));
      temp.setTeamName(children[i].getString("name"));
      temp.setCity(children[i].getString("city"));
      temp.setScore(children[i].getInt("highScore"));
      println(temp.getId() + ": " + temp.getTeamName() + ", " + temp.getScore() + ", " + temp.getCity());
      scoreBoard.add(temp);
      
      if(maxId < temp.getId()) maxId = temp.getId();
    }
  }
}



void saveScore(){
    if(xml != null){
      XML[] children = xml.getChildren("player");
      int retour = 0;
      for (int i = 0; i < children.length; i++) {
        if(children[i].getString("name").equalsIgnoreCase(curTeam.getTeamName()) && children[i].getString("city").equalsIgnoreCase(curTeam.getCity())){
           retour = JOptionPane.showConfirmDialog(null, "Attention : Cette équipe existe déjà\n Vous la remplacer ?", 
                "Attention", JOptionPane.OK_CANCEL_OPTION);
          println(retour);
        }
      }
      
        if(retour == 2){
          boolean isOk = true;
          do{
            isOk = true;
            curTeam.setTeamName(JOptionPane.showInputDialog("Entrez le nom de l'équipe"));
            for (int i = 0; i < children.length; i++) {
              if(children[i].getString("name").equalsIgnoreCase(curTeam.getTeamName()) && children[i].getString("city").equalsIgnoreCase(curTeam.getCity())) isOk = false;
            }
          }while(!isOk);
        }
        
        
      XML newChild = xml.addChild("player");
      newChild.setString("city", curTeam.getCity());
      newChild.setString("name", curTeam.getTeamName());
      newChild.setInt("id", curTeam.getId());
      newChild.setLong("highScore", curTeam.getScore());
      
      saveXML(xml, "data/score.xml");
  
      println("Score saved.");
  }
}