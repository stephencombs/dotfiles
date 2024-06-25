#!/bin/bash

# Install (one or multiple) selected application(s)
# using "brew search" as source input
# mnemonic [B]rew [I]nstall [P]ackage
bip() {
	local search_args
	search_args=("$@")
	if [[ -z "${search_args[*]}" ]]; then
		printf "No arguments supplied.\nUsage: bip [package names]\n"
		return 1
	fi

	local package
	package=$(brew search "${search_args[@]}" | fzf -m)

	if [[ $package ]]; then
		for prog in $package; do brew install "$prog"; done
	fi
}

# Update (one or multiple) selected application(s)
# mnemonic [B]rew [U]pdate [P]ackage
bup() {
	local upd
	upd=$(brew leaves | fzf -m)

	if [[ $upd ]]; then
		for prog in $upd; do brew upgrade "$prog"; done
	fi
}

# Delete (one or multiple) selected application(s)
# mnemonic [B]rew [C]lean [P]ackage (e.g. uninstall)
bcp() {
	local uninst
	uninst=$(brew leaves | fzf -m)

	if [[ $uninst ]]; then
		for prog in $uninst; do brew uninstall "$prog"; done
	fi
}
