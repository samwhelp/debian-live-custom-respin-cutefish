#!/usr/bin/env bash


################################################################################
## Environment
################################################################################

set -e						# exit on error
set -o pipefail				# exit on pipeline error
set -u						# treat unset variable as error


################################################################################
## Base Path
################################################################################

BASE_DIR_PATH="$(dirname "$(realpath "${0}")")"


################################################################################
## Init
################################################################################



################################################################################
## Option
################################################################################




################################################################################
## Util
################################################################################




################################################################################
## Module
################################################################################

function mod_apt_sources_list_for_cutefish_install () {

	## via curl
	#apt install curl
	#curl -fsSLo /etc/apt/keyrings/cutefish.asc https://download.cutefish.org/debian/cutefish.asc


	## via wget
	#apt install wget
	rm -f "/etc/apt/keyrings/cutefish.asc"
	mkdir -p "/etc/apt/keyrings"
	wget -c "https://download.cutefish.org/debian/cutefish.asc" -O "/etc/apt/keyrings/cutefish.asc"


	gpg --show-keys /etc/apt/keyrings/cutefish.asc


	mkdir -p "/etc/apt/sources.list.d"
	echo "deb [signed-by=/etc/apt/keyrings/cutefish.asc] https://download.cutefish.org/debian trixie-nightly main" | tee "/etc/apt/sources.list.d/cutefish.list"

}

function mod_desktop_cutefish_install () {

	##
	## ## https://download.cutefish.org/
	##




	##
	## ## install cutefish-desktop
	##

	echo
	echo "apt update"
	echo
	apt update


	echo
	echo "apt install cutefish-desktop"
	echo
	apt install cutefish-desktop




	return 0

}


################################################################################
## Model
################################################################################

function model_do_desktop_cutefish_install () {

	mod_apt_sources_list_for_cutefish_install

	mod_desktop_cutefish_install

}


################################################################################
## Portal
################################################################################

function portal_do_desktop_cutefish_install () {

	model_do_desktop_cutefish_install

}


################################################################################
## Main
################################################################################

echo "################################################################################"
echo "## [Sub] run: ${0} "
echo "################################################################################"

echo "==== args:" ${@} "===="

function __main__ () {

	portal_do_desktop_cutefish_install "${@}"

}

__main__ "${@}"


################################################################################
## Test
################################################################################

function __test__ () {

	echo "__test__"

}

##__test__
