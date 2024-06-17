#!/usr/bin/bash

# création du volume sae103
docker volume create sae103

# lancement d’un conteneur clock en mode détaché, en lui donnant le nom sae103-forever et en lui montant le volume sae103
docker container run -d --name sae103-forever -v sae103:/work clock

# copie des fichiers .c dans le volume sae103 en utilisant sae103-forever comme conteneur cible
files=$(ls *.c)
for file in $files
do 
    docker container cp $file sae103-forever:/work
done

# copie des fichiers nécessaires au script
docker container cp doc.md sae103-forever:/work
docker container cp styleuser.css sae103-forever:/work
docker container cp styletech.css sae103-forever:/work
docker container cp gendoc-tech.php sae103-forever:/work
docker container cp gendoc-user.php sae103-forever:/work
docker container cp config sae103-forever:/work

# pull php
if [ $# = 1 ]
then
docker container run --rm -v sae103:/work sae103-php sh -c "php gendoc-tech.php $1"
docker container run --rm -v sae103:/work sae103-php sh -c "php gendoc-user.php"
else
docker container run --rm -v sae103:/work sae103-php sh -c "php gendoc-tech.php"
docker container run --rm -v sae103:/work sae103-php sh -c "php gendoc-user.php"
fi

# récupération version + nom client
docker container cp sae103-forever:/work/config .

version=$(egrep VERSION < config | colrm 1 8)
client=$(egrep CLIENT < config | colrm 1 7 | tr [A-Z] [a-z] | tr ' ' _)

# pull html2pdf
docker container run --rm -v sae103:/work sae103-html2pdf "html2pdf doc-tech-$version.html doc-tech-$version.pdf"
docker container run --rm -v sae103:/work sae103-html2pdf "html2pdf doc-user-$version.html doc-user-$version.pdf"

# archive finale .tar.gz
mkdir sae103.finale

files=$(ls *.c)
for file in $files
do 
    cp $file ./sae103.finale/
done
docker container cp sae103-forever:/work/doc-tech-$version.html ./sae103.finale
docker container cp sae103-forever:/work/doc-tech-$version.pdf ./sae103.finale
docker container cp sae103-forever:/work/doc-user-$version.html ./sae103.finale
docker container cp sae103-forever:/work/doc-user-$version.pdf ./sae103.finale

tar czvf $client-$version.tar.gz sae103.finale

rm -r sae103.finale

# arrêt du conteneur sae103-forever
docker container stop sae103-forever 
echo y | docker container prune 

# suppression du volume sae103
docker volume rm sae103
