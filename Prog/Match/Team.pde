Score curTeam;
long[] Score = {0,0,0};

void newTeam(){
  maxId++;
  curTeam = new Score();
  curTeam.setTeamName(JOptionPane.showInputDialog("Entrez le nom de l'équipe"));
  curTeam.setCity(JOptionPane.showInputDialog("Entrez la ville d'origine"));
  curTeam.setId(maxId);
  Score[0] = 0;
  Score[1] = 0;
  Score[2] = 0;
}


long maximum(long[] array){
  long max = array[0];
  for(int i = 0; i < array.length; i++){
    if(array[i] > max) max = array[i];
  }
  
  return max;
}

long minimum(long[] array){
  long min = array[0];
  for(int i = 0; i < array.length; i++){
    if(array[i] < min) min = array[i];
  }
  
  return min;
}