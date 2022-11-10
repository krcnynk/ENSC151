#! /bin/bash

solPath="solution/"
make -C ${solPath} -f makefile.mak clean
make -C ${solPath} -f makefile.mak all
dirList=$(ls -d */ |  cut -f1 -d'/' | grep -v '^solution$')
rm -f marks.csv
rm -f compilationList.csv

echo "GroupName", "Test1_Grade","Test1_Comments", \
"Test2_Grade","Test2_Comments","Test3_Grade","Test3_Comments", \
"Test4_Grade","Test4_Comments","Test5_Grade","Test5_Comments", \
"Test6_Grade","Test6_Comments","Test7_Grade","Test7_Comments","Test8_Grade","Test8_Comments", "MaxIndex", \
"TotalGrade","LateScore">>marks.csv

echo "GroupName", "Compiled" >> compilationList.csv

set -f              # turn off globbing
IFS='
'  
for entry in $dirList
do
# SETUP
    cd ${entry}
    cp ../${solPath}makefile.mak ./
    make -f makefile.mak clean
    makefileWorked="No"
    if make -f makefile.mak all; then
        makefileWorked="Yes"
    fi
    echo $entry ,$makefileWorked >> ../compilationList.csv
    cd ../
done

for entry in $dirList
do
    cd ${entry}
    cppName=$(ls -1 | egrep '\.cpp$')
    programName=${cppName::-4}

    LateScore="0"
    if ls LATE.txt 2>/dev/null; then
        LateScore="5"
    fi

    # Test Case 1
    resultsIndex=()
    resultsValues=()
    score1="0"
    log1=""
    log1="$log1 Input 0;"
    array=($(timeout 5 sh -c "echo 0 -1 | ./$programName"))
    retVal=$?
    array=("${array[@]:1}") #Remove first element "Do not remove ..."
    if [[ $retVal == 124 ]]
    then
        log1="$log1 Test failed because of infinite loop.;"
    elif [[ $retVal -ne 0 ]]
    then
        log1="$log1 Test failed fatal error. RetVal = $retVal;"
    else
        for index in ${!array[@]}; do
            if [[ $((index % 2)) == 0 ]]
            then
                resultsIndex+=(${array[index]})
            else
                resultsValues+=(${array[index]})
            fi
        done

        if [[ ${resultsValues[0]} == 0 ]]
        then
            score1="5"
            log1="$log1 Test passed;"
        else
            log1="$log1 Test failed;"
        fi
        printf -v joined '%s ' "${resultsValues[@]}"
        log1="$log1 Results: ${joined};"
        log1="$log1 Expected: 0;"
    fi

    # Test Case 2
    resultsIndex=()
    resultsValues=()
    score2="0"
    log2=""
    log2="$log2 Input 1;"
    array=($(timeout 5 sh -c "echo 1 -1 | ./$programName"))
    retVal=$?
    array=("${array[@]:1}") #Remove first element "Do not remove ..."
    if [[ $retVal == 124 ]]
    then
        log2="$log2 Test failed because of infinite loop.;"
    elif [[ $retVal -ne 0 ]]
    then
        log2="$log2 Test failed fatal error. RetVal = $retVal;"
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
            score2="5"
            log2="$log2 Test passed;"
        else
            log2="$log2 Test failed;"
        fi
        printf -v joined '%s ' "${resultsValues[@]}"
        log2="$log2 Results: ${joined};"
        log2="$log2 Expected: 1;"
    fi


    # Test Case 3
    resultsIndex=()
    resultsValues=()
    score3="0"
    log3=""
    log3="$log3 Input 2;"
    array=($(timeout 5 sh -c "echo 2 -1 | ./$programName"))
    retVal=$?
    array=("${array[@]:1}") #Remove first element "Do not remove ..."
    if [[ $retVal == 124 ]]
    then
        log3="$log3 Test failed because of infinite loop.;"
    elif [[ $retVal -ne 0 ]]
    then
        log3="$log3 Test failed fatal error. RetVal = $retVal;"
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
            score3="5"
            log3="$log3 Test passed;"
        else
            log3="$log3 Test failed;"
        fi
        printf -v joined '%s ' "${resultsValues[@]}"
        log3="$log3 Results: ${joined};"
        log3="$log3 Expected: 1;"
    fi


    # Test Case 4
    resultsIndex=()
    resultsValues=()
    score4="0"
    log4=""
    log4="$log4 Input 0 1 2 -1;"
    array=($(timeout 5 sh -c "echo 0 1 2 -1 | ./$programName"))
    retVal=$?
    array=("${array[@]:1}") #Remove first element "Do not remove ..."
    if [[ $retVal == 124 ]]
    then
        log4="$log4 Test failed because of infinite loop.;"
    elif [[ $retVal -ne 0 ]]
    then
        log4="$log4 Test failed fatal error. RetVal = $retVal;"
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
            score4="5"
            log4="$log4 Test passed;"
        else
            log4="$log4 Test failed;"
        fi
        printf -v joined '%s ' "${resultsValues[@]}"
        log4="$log4 Results: ${joined};"
        log4="$log4 Expected: 0 1 1;"
    fi

    # Test Case 5
    resultsIndex=()
    resultsValues=()
    score5="0"
    log5=""
    log5="$log5 Input 5 10 15 20;"
    array=($(timeout 5 sh -c "echo 5 10 15 20 -1 | ./$programName"))
    retVal=$?
    array=("${array[@]:1}") #Remove first element "Do not remove ..."
    if [[ $retVal == 124 ]]
    then
        log5="$log5 Test failed because of infinite loop.;"
    elif [[ $retVal -ne 0 ]]
    then
        log5="$log5 Test failed fatal error. RetVal = $retVal;"
    else
        for index in ${!array[@]}; do
            if [[ $((index % 2)) == 0 ]]
            then
                resultsIndex+=(${array[index]})
            else
                resultsValues+=(${array[index]})
            fi
        done
        if [[ ${resultsValues[0]} == 5 && ${resultsValues[1]} == 55 && ${resultsValues[2]} == 610 && ${resultsValues[3]} == 6765 ]]
        then
            score5="15"
            log5="$log5 Test passed;"
        else
            log5="$log5 Test failed;"
        fi
        printf -v joined '%s ' "${resultsValues[@]}"
        log5="$log5 Results: ${joined};"
        log5="$log5 Expected: 5 55 610 6765;"
    fi



    # Test Case 6
    resultsIndex=()
    resultsValues=()
    score6="0"
    log6=""
    log6="$log6 Input 90 110;"
    array=($(timeout 5 sh -c "echo 90 110 -1 | ./$programName"))
    retVal=$?
    array=("${array[@]:1}") #Remove first element "Do not remove ..."
    if [[ $retVal == 124 ]]
    then
        log6="$log6 Test failed because of infinite loop.;"
    elif [[ $retVal -ne 0 ]]
    then
        log6="$log6 Test failed fatal error. RetVal = $retVal;"
    else
        for index in ${!array[@]}; do
            if [[ $((index % 2)) == 0 ]]
            then
                resultsIndex+=(${array[index]})
            else
                resultsValues+=(${array[index]})
            fi
        done
        if [[ ${resultsValues[0]} == 2880067194370816120 && ${resultsValues[1]} == 43566776258854844738105 ]]
        then
            score6="15"
            log6="$log6 Test passed;"
        else
            log6="$log6 Test failed;"
        fi
        printf -v joined '%s ' "${resultsValues[@]}"
        log6="$log6 Results: ${joined};"
        log6="$log6 Expected: 2880067194370816120 43566776258854844738105;"
    fi


    # Test Case 7
    resultsIndex=()
    resultsValues=()
    score7="0"
    log7=""
    log7="$log7 Input 150 151 152;"
    array=($(timeout 5 sh -c "echo 150 151 152 -1 | ./$programName"))
    retVal=$?
    array=("${array[@]:1}") #Remove first element "Do not remove ..."
    if [[ $retVal == 124 ]]
    then
        log7="$log7 Test failed because of infinite loop.;"
    elif [[ $retVal -ne 0 ]]
    then
        log7="$log7 Test failed fatal error. RetVal = $retVal;"
    else
        for index in ${!array[@]}; do
            if [[ $((index % 2)) == 0 ]]
            then
                resultsIndex+=(${array[index]})
            else
                resultsValues+=(${array[index]})
            fi
        done
        if [[ ${resultsValues[0]} == 9969216677189303386214405760200 && ${resultsValues[1]} == 16130531424904581415797907386349 && ${resultsValues[2]} == 26099748102093884802012313146549 ]]
        then
            score7="15"
            log7="$log7 Test passed;"
        else
            log7="$log7 Test failed;"
        fi
        printf -v joined '%s ' "${resultsValues[@]}"
        log7="$log7 Results: ${joined};"
        log7="$log7 Expected: 9969216677189303386214405760200 16130531424904581415797907386349 26099748102093884802012313146549;"
    fi

    # Test Case 8
    resultsIndex=()
    resultsValues=()
    pass="False"
    score8="0"
    log8=""
    log8="$log8 Input -1;"
    runs=3
    max="0"
    repeatedArray=()
    for (( i=0; i < $runs; ++i ))
    do
        array=($(timeout 5 sh -c "echo -1 | ./$programName"))
        retVal=$?
        repeatedArray+=(${array[-1]})
    done
    max=${repeatedArray[0]}
    for n in "${repeatedArray[@]}" ; do
        ((n > max)) && max=$n
    done
    if [[ $retVal == 124 ]]
    then
        log8="$log8 Test failed because of infinite loop.;"
    elif [[ $retVal -ne 0 ]]
    then
        log8="$log Test failed fatal error. RetVal = $retVal;"
    else
        if [[ $max < 19064 && $max > 18808 ]]
        then
            log8="$log8 Test passed $max;"
            pass="True"
        else
            log8="$log8 Test passed but slow timing $max;"
        fi
    fi

    scoreTotal=$((${score1}+${score2}+${score3}+${score4}+${score5}+${score6}+${score7}+${score8}))
    #5,5,5,5,15,15,15,15
    # scoreTotal=0

    echo $entry , $score1 ,$log1,$score2 ,$log2, \
    $score3 ,$log3,$score4,$log4 ,$score5 ,$log5,$score6 ,$log6,$score7,\
    $log7,$score8 ,$log8, $max,\
    $scoreTotal, $LateScore >> ../marks.csv

    #CLEANUP
    # make -f makefile.mak clean
    # rm -f makefile.mak
    cd ../
done