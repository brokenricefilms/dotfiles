function goToNote() {
	cd ~/sync/note/
	nvim -c "NumberLineOff" README.md
}
alias gn='goToNote'
