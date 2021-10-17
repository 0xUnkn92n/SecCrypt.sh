#! /bin/bash
echo "======================================================"
echo "Select any of the option below"
echo "          1.create account "
echo "          2.know your keys"
echo "          3.Generate your public_key"
echo "          4.Delete your keys"
echo "          5.Encrypt or Decrypt file"
echo "======================================================"
echo "Author : https://twitter.com/unkn92n "
echo
function format(){
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Select the Encryption format"
echo
echo "          1.ANCII"
echo
echo "          2.Gibberish"
echo
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
}
function options(){
echo "--------------------------------------------------------"
echo "Select any of the option below"
echo "          1.Encrypt"
echo "          2.Decrypt"
echo "--------------------------------------------------------"
}


function fetch(){
read -p "Enter the file name you want Enc/Dec: " file
if [ -f $file ]
then
        echo
        echo "$file File selected"
        echo
else
        echo
        echo "File not found"
        echo
        kill -INT $$
fi

read -p "Enter the preferred output name : " out
read -p "Enter the recipient name : " recipient
}



read -p "Enter your option : " option
if [[ $option -eq '1' ]]
then
gpg2 --full-gen-key


elif [[ $option -eq '2' ]]
then
gpg2 --list-keys

elif [[ $option -eq '3' ]]
then
read -p "Enter the output PUBLIC_KEY file name : " public_key
format
read -p "Enter the encryption format : " form
read -p "Enter recipient name : " recipient
if [[ $form -eq '1' ]]
then
gpg2 -a -o $public_key --export -r $recipient
echo
echo "Task Completed"
elif [[ $form -eq '2' ]]
then
gpg2 -o $public_key --export -r $recipient
echo
echo "Task Completed"
else
echo
echo "Invalid option"
fi


elif [[ $option -eq '4' ]]
then
gpg2 --list-keys
read -p "Enter key id : " keyid
gpg2 --delete-secret-key $keyid
gpg2 --delete-keys $keyid



elif [[ $option -eq '5' ]]
then
options
read -p "Encrypt / Decrypt : " encdec
if [[ $encdec -eq '1' ]]
then
format
read -p "Enter your option : " for_mat
if [[ $for_mat == 1 ]]
then
fetch
gpg2 -a -o $out -e -r $recipient $file
echo
echo "Encrypted Successfully"
elif [[ $for_mat == 2 ]]
then
fetch
gpg2 -o $out -e -r $recipient $file
echo
echo "Encrypted successfull"
else
echo "Invalid Command"
fi
elif [[ $encdec -eq '2' ]]
then
fetch
gpg2 --batch -o $out -d -r $recipient $file
echo
echo "Decrypted Successfully"
else
echo "Invalid option"
fi
fi