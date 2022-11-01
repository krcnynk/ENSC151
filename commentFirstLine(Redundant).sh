#! /bin/bash
dirList=$(ls -d */ |  cut -f1 -d'/' | grep -v '^solution$')

for entry in $dirList
do
	cd ${entry}
	cppFile=$(ls -1 | egrep '\.cpp$')
	# echo $cppFile
	sed -i '0,/cout/s//\/\/cout/' ${cppFile}
	sed -i '0,/<</s//\/\//' ${cppFile}
	sed -i '0,/"Do not/s//\/\/"Do not/' ${cppFile}
	sed -i '0,/<</s//\/\/<</' ${cppFile}
	sed -i '0,/endl/s//\/\/endl/' ${cppFile}
	cd "../"
done

