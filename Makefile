# Ce makefile permet de gérer plus facilement l'execution d'un jeu réalisé avec Löve2D
# Usage : 
# 		make compile (Compile le jeu, ici une archive est réalisée) 
# 		make clean (Retire l'archive)
# 		make run (Compile le jeu puis l'execute)
# 		make all (Execute clean puis compile)
# 		make play(Execute compile, run)	

#
love_cmd ="love"

ifndef game_name
	game_name = FlappyTux
endif


all: 	clean compile


compile:
	# Pour créer le fichier .love avec Löve il faut lancer une commande d'archivage
	@echo "Compression maximale !"
	zip -9 -r $(game_name).love .

run:	compile
	# Pour l'executer il suffit ensuite de lancer la commande love en utilisant le nom de cette archive
	@echo "Plein d'amour tout partout !"
	$(love_cmd) $(game_name).love

play: 	run

clean:	
	# Lorsque l'on appelle le clean ce que l'on souhaite c'est retirer la dernière archive de jeu
	@echo "Retrait de la dernière archive !"
	rm *.love
