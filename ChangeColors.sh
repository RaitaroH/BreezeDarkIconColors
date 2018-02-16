#!/bin/bash

create() {
name=$1
echo "The script will need your password to continue. Creating files in /usr/share/icons/"

echo "Copying files..."
echo
sudo mkdir /usr/share/icons/breeze-dark-$name/
sudo cp -R /usr/share/icons/breeze-dark/places /usr/share/icons/breeze-dark-$name/
sudo cp /usr/share/icons/breeze-dark/index.theme /usr/share/icons/breeze-dark-$name/

# Color variables
blue1=$2
blue2=$3
blue3=$4

	# Name
	echo "Making the custom theme inherit the rest of the icons from breeze-dark"
	echo
	
	cd /usr/share/icons/breeze-dark-$name/
 	sudo sed -i -- "s/=Breeze\ Dark/=Breeze\ Dark\ $name/g" index.theme
 	sudo sed -i -- "s/Inherits=/Inherits=breeze-dark,/g" index.theme


	# Svg change
	echo "Doing svg magic..."
	echo
	
	cd /usr/share/icons/breeze-dark-$name/places/64/
	sudo sed -i -- "s/3daee9/$blue1/g" *.svg
	sudo sed -i -- "s/6cc1ef/$blue2/g" *.svg
	sudo sed -i -- "s/147eb8/$blue3/g" *.svg
	sudo sed -i -- "s/1272a5/$blue3/g" *.svg
	sudo ln -fs stock_folder.svg inode-directory.svg
	
	cd /usr/share/icons/breeze-dark-$name/places/32/
	sudo sed -i -- "s/3daee9/$blue1/g" *.svg
	sudo sed -i -- "s/6cc1ef/$blue2/g" *.svg
	sudo sed -i -- "s/147eb8/$blue3/g" *.svg
	sudo sed -i -- "s/1272a5/$blue3/g" *.svg
	sudo ln -fs stock_folder.svg inode-directory.svg

return
}

# Adding options
params="$(getopt -o bcgmopryh  -l black,blue,brown,cyan,green,grey,magenta,orange,purple,red,yellow,help --name "$0" -- "$@")"

eval set -- "$params"

while true
do
	case "$1" in
	-b|--black)
		create Black 3e3e3e 494949 2d2d2d
		exit 1
	;;

	--blue)
		create Blue 4183d7 5b94df 245da8
		exit 1
	;;

	--brown)
		create Brown 8b6039 996e45 664629
		exit 1
	;;

	-c|--cyan)
		create Cyan 21bbd7 3dc8e1 167b8d
		exit 1
	;;

	-g|--green)
		create Green 3bad7e 45cc87 0f9b71
		exit 1
	;;

	--grey)
		create Grey a7afb4 bdc3c7 6e6e6e
		exit 1
	;;

	-m|--magenta)
		create Magenta b5006a c70073 87004f
		exit 1
	;;

	-o|--orange)
		create Orange f89406 faa938 a3660d
		exit 1
	;;

	-p|--purple)
		create Purple 8e44ad 9d52bd 6c3384
		exit 1
	;;

	-r|--red)
		create Red eb0a42 f62459 9d072c
		exit 1
	;;

	-y|--yellow)
		create Yellow f2cb40 f5d76e a97606
		exit 1
	;;

	-h|--help)
		echo "This is a script that will copy the places icons from the breeze icon set and change their colors to something else."
		echo
		echo "You have the following options: --black (b), --blue, --brown, --cyan (-c), green (-g), --grey, --magenta (-m), --orange (-o), --purple (-p), --red (-r), --yellow (-y), --help (-h)"
		exit 1
	;;

	esac
done
