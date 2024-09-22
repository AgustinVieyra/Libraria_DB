#!/bin/bash
#To execute this script just run the line bellow in terminal, editing the value of "table_name" accordingly:
#table_name="reviews"; sh insert.sh ${table_name}.csv > ${table_name}.tmp; cat ${table_name}.tmp | sed 's/~/,/g' > ${table_name}_insert.sql; rm ${table_name}.tmp; echo ""; cat ${table_name}_insert.sql
#Options for table name: books, booktranslations, users, transactions, transactiondetails, reviews

file=$1
num_columns=$2
num_lines=`wc -l $file | cut -d ' ' -f 1`
#cat $file
#Asigning variables
if [ $file = "books.csv" ]; then
	column_names="Books (ISBN,Title,Author,Edition,Genre,Description,Original_language_ID,Price)"
	num_columns=8
elif [ $file = "booktranslations.csv" ]; then
	column_names="BookTranslations (ISBN,Translated_title,Translated_genre,Translated_description,Language_ID)"
	num_columns=5
elif [ $file = "users.csv" ]; then
	column_names="Users (User_ID,Email,User_name,Address,City,Zip_code,Country)"
	num_columns=7
elif [ $file = "transactions.csv" ]; then
	column_names="Transactions (Sale_ID,Transaction_date,User_ID)"
	num_columns=3
elif [ $file = "transactiondetails.csv" ]; then
	column_names="TransactionDetails (Sale_detail_ID,Sale_ID,ISBN,Number_of_items)"
	num_columns=4
elif [ $file = "reviews.csv" ]; then
	column_names="Reviews (ISBN,User_ID,Five_star_score,Review)"
	num_columns=4
fi

#Replacing apostrophe symbols:
sed 's/\x27/’/g' $file > $file_1.tmp #\x27 is the symbol ' 
#Replacing the scaped comma for tilde:
sed 's/\\,/~/g' $file_1.tmp > $file.tmp
rm $file_1.tmp

#Adding a new line
#echo ""
#Making a counter of lines
i_th_line=1

printf "INSERT INTO $column_names VALUES\n"

while read line
do
	i=1
	#Printing the first value in the list that doesn't need a comma at the start
	value=`echo $line | cut -d , -f $i`
	printf "('$value'"

	i=2
	#Getting the rest of the values
	while [ $i -le $num_columns ]
	do
		value=`echo $line | cut -d , -f $i`
		printf ,\'%s\' "$value"
		#Adding one to the index
		i=`expr $i + 1`
	done

	#Printing either coma or semicolon at the end the line
	if [ $i_th_line -lt $num_lines ]
	then
		printf "),\n"
		#Adding one to the counter
		i_th_line=`expr $i_th_line + 1`
	else
		printf ");\n"
	fi
done < $file.tmp

#Removing the temporary file with tildes
rm $file.tmp