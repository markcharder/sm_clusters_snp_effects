#!/usr/bin/env bash

LOWINPUTS=($(ls /home/mark/Rdrive/CCDM_Prog_10_Share-HANE0J-SE00128/Sclerotinia/pan_genome/outputs/Local_02-17/snpEff_results/general/*LOW.txt))
MODINPUTS=($(ls /home/mark/Rdrive/CCDM_Prog_10_Share-HANE0J-SE00128/Sclerotinia/pan_genome/outputs/Local_02-17/snpEff_results/general/*MODERATE.txt))
HIGHINPUTS=($(ls /home/mark/Rdrive/CCDM_Prog_10_Share-HANE0J-SE00128/Sclerotinia/pan_genome/outputs/Local_02-17/snpEff_results/general/*HIGH.txt))
OUTPUTDIR=$2

if [ ! -d $OUTPUTDIR ]; then 
	mkdir $OUTPUTDIR
fi

for file in ${LOWINPUTS[@]}; do
	
	stub=$file
	stub=${stub##*/}
	stub=${stub%.*}

	awk '{print $2}' $1 | tr ' ' '\n' | fgrep -f - $file > $OUTPUTDIR/$stub.sms.txt

done

for file in ${MODINPUTS[@]}; do
	
	stub=$file
	stub=${stub##*/}
	stub=${stub%.*}

	awk '{print $2}' $1 | tr ' ' '\n' | fgrep -f - $file > $OUTPUTDIR/$stub.sms.txt

done

for file in ${HIGHINPUTS[@]}; do
	
	stub=$file
	stub=${stub##*/}
	stub=${stub%.*}

	awk '{print $2}' $1 | tr ' ' '\n' | fgrep -f - $file > $OUTPUTDIR/$stub.sms.txt

done
