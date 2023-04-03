function tmux_kill_all_unname_session
	set --local CURRENT_DIR (pwd)
	cd /tmp/
	tmux ls | awk '{print $1}' | grep -o '[0-9]\+' >/tmp/killAllUnnameTmuxSessionOutput.sh
	sed -i 's/^/tmux kill-session -t /' killAllUnnameTmuxSessionOutput.sh
	chmod +x killAllUnnameTmuxSessionOutput.sh
	./killAllUnnameTmuxSessionOutput.sh
	cd $CURRENT_DIR
end
