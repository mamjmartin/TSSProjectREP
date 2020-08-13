
qteWordsTable = array_create(5)

if(difficultyTier < 3){
	for(var i = 0; i<5; i++){
		qteWordsTable[i] = global.vocabTable[# irandom_range(0,0), i]
	}
}else if (difficultyTier == 7){
	for(var i = 0; i<5; i++){
		qteWordsTable[i] = global.vocabTable[# irandom_range(1,1), i]
	}
}else{
	for(var i = 0; i<5; i++){
		qteWordsTable[i] = global.vocabTable[# irandom_range(0,0), i]
	}
}


for(var i = 0; i<5; i++){
	password_entered[i] = array_create(array_length_1d(qteWordsTable[i]), 0);
}

currentDigit = 0
passwordWrong = array_create(5)
currentDigit = array_create(5)
