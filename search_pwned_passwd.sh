#!/bin/bash

echo "enter the password you want to search for:"
read pwd
hash=$(printf "$pwd" | openssl sha1 | tr '[:lower:]' '[:upper:]' | cut -c 10-)
#echo $hash
final_thirty_five=$(echo $hash | cut -c 6-)
#echo $first_five
first_five=$(echo $hash | rev | cut -c36- | rev)
#echo $final_thirty_five
# This takes forever, opting to use the API, which uses k-Anonymity and seems to be reasonable
#awk '/$hash/' pwned-passwords-ordered-2.0.txt
result=$(curl -sX GET https://api.pwnedpasswords.com/range/$first_five | grep $final_thirty_five)

if [[ -z "$result" ]]; then
    echo "Password is safe!"
    exit 0
else
    num_leaks=${result#*:}
    echo "Warning: The number of times password \"$pwd\" has been leaked:"
    echo $num_leaks
    exit 0
fi

