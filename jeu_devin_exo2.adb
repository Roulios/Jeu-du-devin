with Text_IO; use Text_IO;
with ada.integer_text_io; use ada.integer_text_io;

procedure jeu_devin_exo2 is

neTrichePas : Boolean:=True;
choixNonConfirme : Boolean:=True;
nombreNonTrouve : Boolean:=True;
reponseUtilisateurNonValide: Boolean:=True;

min : Integer :=1;
max : Integer :=999;
propositionOrdinateur : Integer;
nombreEssai : Integer :=0;


confirmationChoix : Character;
reponseUtilisateur : Character;

begin
  --Demander si l'tuilisateur a choisi un nombre compris entre 1 et 999 jusqu'à que son choix soit effectif
  While(choixNonConfirme) loop

    Put("Avez-vous choisi un nombre compris entre 1 et 999 (o/n)");
    New_Line;
    Get(confirmationChoix);
    Skip_Line;

    if confirmationChoix='o' then
      choixNonConfirme:=False;
      --L'utilisateur  confirme que son choix est effectif, on arrête donc la boucle  
    else
      Put("J'attends");
      New_Line;   

    end if;
  
  end loop;

  --L'initalisation des variables min, max, neTrichePas, nimbreNonTrouve a déjà eu lieu au début du programme.

  --LAncement du jeu
  while(neTrichePas and nombreNonTrouve) loop
    --recherche de solution par la méthode dichotomique
    propositionOrdinateur:= (min+max)/2;
    Put("Proposition ");
    Put(nombreEssai);
    Put(" ");
    Put(propositionOrdinateur);
    New_Line;

    nombreEssai:=nombreEssai+1;
    reponseUtilisateurNonValide:=True; --On réinitialise le booléen à chaque tour de boucle pour avoir la confirmation d'une réponse valide pour chaqque tour de boucle

    --Permet à l'tuilisateur de donner une réponse à la proposition de l'ordinateur, la boucle s'arrête a la condition d'une réponse compréhensible par l'ordinateur
    while(reponseUtilisateurNonValide) loop
      Put("Trop (g)rnad, trop (p)etit ou (t)rouve ?");
      New_line;
      Get(reponseUtilisateur);
      Skip_Line;

      case reponseUtilisateur is

        when 't'|'T'|'g'|'G'|'p'|'P' =>
          reponseUtilisateurNonValide:=False;
        
        when others =>
          Null;
      
      end case;
          
    end loop;
    --Vérifiaction que l'utilisateur ne triche pas
    if(min=max) and (reponseUtilisateur='g' or reponseUtilisateur='p') then
      --On a ici un intervalle de recherche de taille 1 pour deviner le nombre de l'utilisateur, on a donc forcément la bonne réponse, donc on est certain que l'utilisateur ment si il déclare que l'ordinateur se trompe

      Put("Vous trichez. J'arrête cette partie.");
      New_Line;
      neTrichePas:=False;
      
    else
      null;
      
    end if;

    --réaction du programme à la réponse de l'utilisateur
    case reponseUtilisateur is

      when 't' | 'T' =>
        --cas de la réussite du jeu
        Put("J'ai trouvé en ");
        Put(nombreEssai);
	      Put(" tentative !");
	      New_Line;	  
        nombreNonTrouve:= False;
          
      when 'g' | 'G' =>
        --cas d'un nombre proposé trop grand
	      max:= propositionOrdinateur;
          
      when 'p' | 'P' =>
        --cas d'un nombre proposé trop petit
	      min:= propositionOrdinateur+1;

      when others =>
        null;  
        
    end case;

  


  end loop;

end jeu_devin_exo2;





