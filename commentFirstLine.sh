#! /bin/bash
dirList=$(ls -d */ |  cut -f1 -d'/' | grep -v '^solution$')

for entry in $dirList
do
	cd ${entry}
	cppFile=$(ls -1 | sed -e 's/\..*$//')
	# echo $cppFile
	oldText="Do not change this line.  Enter a sequence of increasing Fibonacci indicies and -1 to stop input."
	newText=""
	sed -i 's/\"Do not change this line.  Enter a sequence of increasing Fibonacci indicies and -1 to stop input.\"/\"\"/g' ${cppFile}.cpp
	cd "../"
done

