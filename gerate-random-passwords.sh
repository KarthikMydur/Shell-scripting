#!/bin/bash

#This script generates a random password for each user specified on command line

#Display what user types on command line.
echo "You executed this command ${0}"

# Display the path and file name of the script.
echo "You used $(dirname ${0}) as path to the $(basename ${0}) script"

# Tell user how many arguments are passed
NUMBER_OF_PARAMETERS="${#}"
echo "You suppied ${NUMBER_OF_PARAMETERS} to the command line."

# Make sure they atleast supply one argument.
if [[ "${NUMBER_OF_PARAMETERS}" -lt 1 ]]
then
        echo "Usage: ${0} USER_NAME [USER_NAME]...."
        exit 1
fi

# Generate and display a password for each user
for USER_NAME in "${@}"
do
        PASSWORD=$(date +%s%N | sha256sum | head -c48)
        echo "${USER_NAME}: ${PASSWORD}"
done

