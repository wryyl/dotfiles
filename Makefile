.PHONY: desktop
desktop:
	stow -d desktop/ -t /home/ben \
		-R nvim \
		-R stow \
		-R tmux \
		-R zsh \
		-R delve \
		-R git \
		-R bin \
		-R cmus \
		-R alacritty \
		-R desktop-entries \
		-R rofi \
		-R mpv \
		-R yt-dlp \
		-R fish \
		-R feh \
		2> >(grep -v 'BUG in find_stowed_path? Absolute/relative mismatch' 1>&2)

.PHONY: laptop
laptop:
	stow -d laptop/ -t /home/ben \
		-R nvim \
		-R stow \
		-R tmux \
		-R delve \
		-R git \
		-R bin \
		-R cmus \
		-R alacritty \
		-R desktop-entries \
		-R rofi \
		-R mpv \
		-R yt-dlp \
		-R fish \
		-R feh \
		2> >(grep -v 'BUG in find_stowed_path? Absolute/relative mismatch' 1>&2)

desktop-installed-packages:
	pacman -Qe > desktop/do-not-stow/installed-packages
	git add desktop/do-not-stow/installed-packages
	git commit -m "Update desktop installed packages"

laptop-installed-packages:
	pacman -Qe > laptop/do-not-stow/installed-packages
	git add laptop/do-not-stow/installed-packages
	git commit -m "Update laptop installed packages"
