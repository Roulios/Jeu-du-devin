with Text_Io;          	use Text_Io;
with Ada.Integer_Text_Io;  use Ada.Integer_Text_Io;
with Alea;

-- Auteur : Baptiste RAJAONAH
--
-- TODO: à compléter...
procedure Jeu_Devin_Exo1 is

    	function choix_nombre_aleatoire return Integer with
            	Post => choix_nombre_aleatoire'Result <= 999 and choix_nombre_aleatoire'Result >= 1
            	--le nombre aleatoire est entre 1 et 999
    	is
            	package Mon_Alea is new Alea(1, 999);
            	use Mon_Alea;
            	Nombre_Aleatoire: Integer;
    	begin
            	Get_Random_Number(Nombre_Aleatoire);
            	return Nombre_Aleatoire;
    	end choix_nombre_aleatoire;

    	--procedure de test de la fonction choix_nombre_aleatoire
    	procedure Tester_choix_nombre_aleatoire is
   	 
            	test_nombre_aleatoire: Integer;
    	begin
            	test_nombre_aleatoire := choix_nombre_aleatoire;
            	pragma Assert(test_nombre_aleatoire <= 999 and test_nombre_aleatoire >= 1);
    	end Tester_choix_nombre_aleatoire;
   	 
    	--fonction de comparaison entre nombre proposé et nombre aléatoire
    	procedure comparer_nombre(nombre_ordi: in Integer; nombre_hum: in Integer) is
            	begin
                    	if nombre_hum > nombre_ordi then
                            	Put("Le nombre est trop grand.");
                    	elsif nombre_hum < nombre_ordi then
                            	Put("Le nombre est trop petit.");
                    	else
                            	Put("Bravo! Vous avez trouvé!");
                    	end if;
            	end comparer_nombre;


    	--declaration variables globales
    	nombre_essais : Integer := 0;
    	nombre_humain : Integer;
    	nombre_aleatoire : Integer;

begin
    	nombre_aleatoire := choix_nombre_aleatoire;
    	loop
            	nombre_essais := nombre_essais + 1;
            	New_Line;
            	Put("Choisissez un nombre entre 1 et 999: ");
            	Get(nombre_humain);
            	comparer_nombre(nombre_aleatoire, nombre_humain);
    	exit when nombre_aleatoire = nombre_humain;
    	end loop;

end Jeu_Devin_Exo1;


