#echo 'import random br arr eq random.choice op ob 1,2,3 cb cp br print arr ' | ./ms | python
sed \
 -e 's/\([^a-zA-Z]\)br\([^a-zA-Z]\)/\1\n/g;' \
 -e 's/\([^a-zA-Z]\)op\([^a-zA-Z]\)/\1(\2/g;' \
 -e 's/\([^a-zA-Z]\)opop\([^a-zA-Z]\)/\1((\2/g;' \
 -e 's/\([^a-zA-Z]\)cp\([^a-zA-Z]\)/\1)\2/g;' \
 -e 's/\([^a-zA-Z]\)cpcp\([^a-zA-Z]\)/\1))\2/g;' \
 -e 's/\([^a-zA-Z]\)cb\([^a-zA-Z]\)/\1\]\2/g;' \
 -e 's/\([^a-zA-Z]\)ob\([^a-zA-Z]\)/\1\[\2/g;' \
 -e 's/\([^a-zA-Z]\)eq\([^a-zA-Z]\)/\1\=\2/g;' \
 -e 's/\([^a-zA-Z]\)eqeq\([^a-zA-Z]\)/\1\==\2/g;' \
 -e 's/\([^a-zA-Z]\)as\([^a-zA-Z]\)/\1\*\2/g;' \
 -e 's/\([^a-zA-Z]\)\(asas\|tothe\)\([^a-zA-Z]\)/\1\**\3/g;' \
 -e 's/\([^a-zA-Z]\)mi\([^a-zA-Z]\)/\1\-\2/g;' \
 -e 's/\([^a-zA-Z]\)pl\([^a-zA-Z]\)/\1\+\2/g;' \
 -e 's/\([^a-zA-Z]\)di\([^a-zA-Z]\)/\1\/\2/g;' \
 -e 's/\([^a-zA-Z]\)lt\([^a-zA-Z]\)/\1\<\2/g;' \
 -e 's/\([^a-zA-Z]\)gt\([^a-zA-Z]\)/\1\>\2/g;' \
 -e 's/\([^a-zA-Z]\)do\([^a-zA-Z]\)/\1\$\2/g;' \
 -e 's/\([^a-zA-Z]\)pe\([^a-zA-Z]\)/\1\%\2/g;' \
 -e 's/\([^a-zA-Z]\)co\([^a-zA-Z]\)/\1\:\2/g;'
 
  
