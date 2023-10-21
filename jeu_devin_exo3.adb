with Text_Io;          	use Text_Io;
with Ada.Integer_Text_Io;  use Ada.Integer_Text_Io;
with Jeu_Devin_Exo1;
with Jeu_Devin_Exo2;

-- Auteur : Baptiste RAJAONAH
procedure Jeu_Devin_Exo3 is
    	--la procedure affiche les modes de jeu
    	procedure afficher_modes_jeu is
    	begin   	 
            	Put("0 - Quitter le programme");
            	New_Line;
            	Put("1 - L'ordinateur choisit un nombre et vous le devinez.");
            	New_Line;
            	Put("2 - Vous choisissez un nombre et l'ordinateur le devine.");
            	New_Line;
    	end afficher_modes_jeu;

    	--declaration de variables globales
    	programme_ouvert: Boolean := True;
    	mode_jeu : Integer;
begin
    	while programme_ouvert loop
            	loop
                    	afficher_modes_jeu;
                    	Put("A quel mode de jeu souhaitez-vous jouer ?");
                    	Get(mode_jeu);
            	exit when mode_jeu = 0 or mode_jeu = 1 or mode_jeu = 2;
            	end loop;
            	case mode_jeu is
                    	when 0 => programme_ouvert := False;
                    	when 1 => Jeu_Devin_Exo1;
                    	when 2 => Jeu_Devin_Exo2;
                    	when others => null;  
            	end case;
    	end loop;
end Jeu_Devin_Exo3;


