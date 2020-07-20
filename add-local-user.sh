# Below script can be used to create a users


# Make sure the script is being executed with the superuser privileges.
USERID=$(id -u)
echo "${USERID}"

if [[ "${USERID}" -eq 0 ]]
then
	echo "your are root user you can proceed"
else
	echo "Your are not root user!!!"
	exit 0
fi

# Get the username
read -p 'enter the username: ' USER_NAME

# Get the fullname
read -p 'enter the fullname: ' FULL_NAME

# Get the password
read -p 'enter the password: ' PASSWORD


# Create a user with the password
useradd -c "${FULL_NAME}" -m ${USER_NAME}

# Check to see if the useradd command succeeded
if [[ "${?}" -ne 0 ]]
then
	echo "The account could not be created."
	exit 1
fi

# Set the password
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Check to see the passwd command succeeded
if [[ "${?}" -ne 0 ]]
then
	echo 'The password for the account could not be set'
	exit 1
fi


# Force the password change on first login
passwd -e ${USER_NAME}

# Display the username, password, and host where the user was created
echo
echo 'username'
echo "${USER_NAME}"
echo
echo 'password'
echo "${PASSWORD}"
echo
echo 'host'
echo "${HOSTNAME}"
exit 0



