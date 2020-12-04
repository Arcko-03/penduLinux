

#!/bin/sh

clear
echo -e "\E[34m----------LE JEU DU PENDU----------\E[0m
"
i=0
rdm=$((1 + RANDOM % 835)) #Chiffre aléatoire
word=$(head -n $rdm dico.txt | tail -n 1) #mot aléatoire

for L in $(seq 1 ${#word}); do #récup des lettres du mot dans tableau
    i=$i+1
    letter=$(echo $word | cut -c$L)
    tabL[$i]=$letter
    #echo ${letter[@]}
done

j=${#word}
z=0

while [ $j != $z ]; do
        tabEnigme[$j]="_ "
	let j--
done
#echo $word
echo "Mot de ${#word} lettres: "
echo -e "\033[1m${tabEnigme[@]}\033[0m"
echo " "
echo -e "\n \n \n \n \n \n \n \n \n \n \n \n"
echo "Entrez une lettre: "

scorePlayer=0
scoreMachine=0
pendu=5
compt=0
LU=0

while [ $scorePlayer != ${#word} ] && [ $scoreMachine != $pendu ]; do
	compt=0
	read l
	clear
	echo -e "\E[34m----------LE JEU DU PENDU----------\E[0m
	"
	echo "Mot de ${#word} lettres: "
	trouve=false;
	tabLU[$LU]=$l
	let LU++
	for L in $(seq 1 ${#word}); do #récup des lettres du mot dans tableau
		let compt++
	    letter=$(echo $word | cut -c$L)
	    if [ $l == $letter ]; then
	    	tabEnigme[$compt]=$l #On remplace la lettre caché
	    	let scorePlayer++
	    	trouve=true
	    fi
	done
	echo -e "\033[1m${tabEnigme[@]}\033[0m"
	echo " "
	if [ $trouve == false ]; then #si la lettre n'a pas été trouvé
	    let scoreMachine++
	fi
	a=0
	b=1
	c=2
	d=3
	e=4
	f=5
	if [ $scoreMachine ==  $a ]; then
		echo -e "\n \n \n \n \n \n \n \n \n \n \n \n"
	elif [ $scoreMachine == $b ]; then
		echo '   
           
           
           
           
          
   
  
 
============'
	elif [ $scoreMachine == $c ]; then
		echo '   
   ||         
   ||         
   ||         
   ||        
   ||        
   ||
   ||
   ||
============'
	elif [ $scoreMachine == $d ]; then
		echo '   ,==========Y===
   ||        
   ||        
   ||        
   ||        
   ||        
   ||
   ||
   ||
============'
	elif [ $scoreMachine == $e ]; then
		echo '   ,==========Y===
   ||  /      
   || /       
   ||/        
   ||        
   ||        
   ||
  /||
 //||
============'
	elif [ $scoreMachine == $f ]; then
		echo '   ,==========Y===
   ||  /      |
   || /       |
   ||/        O
   ||        /|\
   ||        /|
   ||                   T es mort mec!
  /||                                  O
 //||                                 /|\
============                          / \  '
	fi
	echo " "
	echo -e "\E[9m${tabLU[@]}\E[0m"
	echo " "
	echo Entrez une lettre:
	#echo ${tabEnigme[@]}

done

if [ $scorePlayer == ${#word} ]; then
	echo -e "\n\E[32mGAGNÉ ! :)\E[0m\n"
else
	echo -e "\n\E[31mPERDU :(\E[0m\n"
	echo -e "Le mot était: ${word}\n"
fi