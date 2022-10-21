#! /bin/bash

solPath="solution/"
make -C ${solPath} -f makefile.mak clean
make -C ${solPath} -f makefile.mak all
dirList=$(ls -d */ |  cut -f1 -d'/' | grep -v '^solution$')
rm marks.csv
echo "GroupName" , "Grades" , "LargestIndex", "Pass">> marks.csv

for entry in $dirList
do
    # SETUP
    cd ${entry}
    rm log.txt
    cppFile=$(ls -1 | sed -e 's/\..*$//')
    cp ../${solPath}makefile.mak ./
    make -f makefile.mak all

    echo "Group: ${entry}"
    # Test Case 1
    echo "Test Case 1">>log.txt
    resultsIndex=()
    resultsValues=()
    score=0
    array=($(timeout 5 sh -c "echo 0 -1 | ./$cppFile"))
    # echo ${array[0]}
    if [[ $? = "124" ]]
    then
        echo "Test failed. because of infinite loop.">>log.txt
    else
        #THIS IS FOR INDEXES
        for index in ${!array[@]}; do
            if [[ $((index % 2)) == 0 ]]
            then
                resultsIndex+=(${array[index]})
                # echo (${array[index]})
            else
                resultsValues+=(${array[index]})
                # echo (${array[index]})
            fi
        # (( (index) % 2 )) && echo "(${array[index]})"
        done

        if [[ ${resultsValues[0]} == 0 ]]
        then
            ((score+=1))
            echo "Test passed.">>log.txt
        else
        echo "Test failed.">>log.txt
        echo ${resultsValues[@]}>>log.txt
        fi
        # echo ${resultsValues[@]}
    fi

    # Test Case 2
    echo "Test Case 2">>log.txt
    resultsIndex=()
    resultsValues=()
    array=($(timeout 5 sh -c "echo 1 -1 | ./$cppFile"))
    # echo ${array[@]}
    if [[ $? = "124" ]]
    then
        echo "Test failed. because of infinite loop.">>log.txt
    else
        for index in ${!array[@]}; do
            if [[ $((index % 2)) == 0 ]]
            then
                resultsIndex+=(${array[index]})
            else
                resultsValues+=(${array[index]})
            fi
        done

        if [[ ${resultsValues[0]} == 1 ]]
        then
            ((score+=1))
            echo "Test passed.">>log.txt
        else
            echo "Test failed.">>log.txt
            echo ${resultsValues[@]}>>log.txt
        fi
    fi


    # Test Case 3
    echo "Test Case 3">>log.txt
    resultsIndex=()
    resultsValues=()
    array=($(timeout 5 sh -c "echo 2 -1 | ./$cppFile"))
    # echo ${array[@]}
    if [[ $? = "124" ]]
    then
        echo "Test failed. because of infinite loop.">>log.txt
    else
        for index in ${!array[@]}; do
            if [[ $((index % 2)) == 0 ]]
            then
                resultsIndex+=(${array[index]})
            else
                resultsValues+=(${array[index]})
            fi
        done

        if [[ ${resultsValues[0]} == 1 ]]
        then
            ((score+=1))
            echo "Test passed.">>log.txt
        else
            echo "Test failed."
            echo ${resultsValues[@]}>>log.txt
        fi
    fi


    # Test Case 4
    echo "Test Case 4">>log.txt
    resultsIndex=()
    resultsValues=()
    array=($(timeout 5 sh -c "echo 0 1 2 -1 | ./$cppFile"))
    # echo ${array[@]}
    if [[ $? = "124" ]]
    then
        echo "Test failed. because of infinite loop.">>log.txt
    else
        for index in ${!array[@]}; do
            if [[ $((index % 2)) == 0 ]]
            then
                resultsIndex+=(${array[index]})
            else
                resultsValues+=(${array[index]})
            fi
        done
        if [[ ${resultsValues[0]} == 0 && ${resultsValues[1]} == 1 && ${resultsValues[2]} == 1 ]]
        then
            ((score+=2))
            echo "Test passed.">>log.txt
        else
            echo "Test failed.">>log.txt
            echo ${resultsValues[@]}>>log.txt
        fi
    fi

    # Test Case 5
    echo "Test Case 5">>log.txt
    resultsIndex=()
    resultsValues=()
    array=($(timeout 5 sh -c "echo 5 10 15 -1 | ./$cppFile"))
    # echo ${array[@]}
    if [[ $? = "124" ]]
    then
        echo "Test failed. because of infinite loop.">>log.txt
    else
        for index in ${!array[@]}; do
            if [[ $((index % 2)) == 0 ]]
            then
                resultsIndex+=(${array[index]})
            else
                resultsValues+=(${array[index]})
            fi
        done
        if [[ ${resultsValues[0]} == 5 && ${resultsValues[1]} == 55 && ${resultsValues[2]} == 610 ]]
        then
            ((score+=4))
            echo "Test passed.">>log.txt
        else
            echo "Test failed.">>log.txt
            echo ${resultsValues[@]}>>log.txt
        fi
    fi

    # Test Case 6
    echo "Test Case 6">>log.txt
    resultsIndex=()
    resultsValues=()
    array=($(timeout 5 sh -c "echo 150 151 -1 | ./$cppFile"))
    # echo ${array[@]}
    if [[ $? = "124" ]]
    then
        echo "Test failed. because of infinite loop.">>log.txt
    else
        for index in ${!array[@]}; do
            if [[ $((index % 2)) == 0 ]]
            then
                resultsIndex+=(${array[index]})
            else
                resultsValues+=(${array[index]})
            fi
        done
        if [[ ${resultsValues[0]} == 9969216677189303386214405760200 && ${resultsValues[1]} == 16130531424904581415797907386349 ]]
        then
            ((score+=4))
            echo "Test passed.">>log.txt
        else
            echo "Test failed.">>log.txt
            echo ${resultsValues[@]}>>log.txt
        fi
    fi
    
    # Test Case 7
    echo "Test Case 7">>log.txt
    resultsIndex=()
    resultsValues=()
    pass="False"
    array=($(timeout 5 sh -c "echo -1 | ./$cppFile"))
    # echo ${array[@]}
    if [[ $? = "124" ]]
    then
        echo "Test failed. because of infinite loop.">>log.txt
    else
        for index in ${!array[@]}; do
            if [[ $((index % 2)) == 0 ]]
            then
                resultsIndex+=(${array[index]})
            else
                resultsValues+=(${array[index]})
            fi
        done
        if [[ ${resultsIndex[-1]} < 15300 && ${resultsIndex[-1]} > 14450 ]]
        then
            ((score+=6))
            # echo ${resultsIndex[-1]}
            echo "Test passed.">>log.txt
            pass="True"
        else
            echo "Test failed.">>log.txt
            echo ${resultsIndex[@]}>>log.txt
        fi
    fi

    echo ${score}
    echo $entry , $score , ${resultsIndex[@]}, $pass >> ../marks.csv

    #CLEANUP
    make -f makefile.mak clean
    rm -f makefile.mak
    cd ../
    make -C ${solPath} -f makefile.mak clean
done