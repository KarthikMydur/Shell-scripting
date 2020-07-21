#!/bin/bash

# This script generate random list of passwords

# A random number as a password
PASSWORD="${RANDOM}"
echo "${PASSWORD}"

# Three random numbers together
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "$PASSWORD"

# Use the current date/time as perfect base for the password
PASSWORD=$(date +%s)
echo "${PASSWORD}"

# Use nano seconds to the password
PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

# A better password
PASSWORD=$(date +%s%N | sha256sum | head -c32)
echo "${PASSWORD}"

# Even better passoword
PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c48)
echo "${PASSWORD}"

# Adding special character to the password
SPECIAL_CHARACTER=$(echo '!@#$%^&*()_-+=' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHARACTER}"
