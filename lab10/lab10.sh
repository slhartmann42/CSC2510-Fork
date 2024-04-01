#!/bin/bash

if [[ $# -eq 0 ]]; then
	file="phonebook.dat"
else
	file="$1"
fi

HI='\033[32m'
NORMAL='\033[0m'

echo -e "${HI}1. starts or ends with Jose${NORMAL}"
grep -E --color=ALWAYS '^Jose' "$file"
grep -E --color=ALWAYS 'Jose$' "$file"
echo -e "${HI}2. contains a sequence of at least 27 upper or lower-case characters a-z${NORMAL}"
grep -E --color=always '[[:alpha:]]{27,}' "$file"
echo -e "${HI}3. consists of more than 18 characters${NORMAL}"
grep -E --color=always '.{19,}' "$file"
echo -e "${HI}4. contains exactly 10 characters${NORMAL}"
grep -E --color=always '^.{10}' "$file"
echo -e "${HI}5. contains a sequence of between 6 and 8 charcters delimmetted by spaces${NORMAL}"
grep -E --color=always '\s[[:alpha:]]{6,8}\s' "$file"
echo -e "${HI}6. contains a local phone number${NORMAL}"
grep -E --color=always '\ [0-9]{3}-[0-9]{4}' "$file"
echo -e "${HI}7. contains a valid url on a line by itself${NORMAL}"
