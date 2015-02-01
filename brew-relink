#!/bin/bash
FORMULAS=(`brew list`);
for FORMULA in "${FORMULAS[@]}"
do 
    echo "brew unlink $FORMULA" && echo "brew link $FORMULA";
    OUTPUT=`brew unlink $FORMULA`;
    echo $OUTPUT;
    OUTPUT=`brew link $FORMULA`;
    echo $OUTPUT;
done
