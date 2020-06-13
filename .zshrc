if [[ -z "$DISPLAY" ]] && [[ $XDG_VTNR -eq 1 ]]; then
	exec startx
else
	# start tmux if not already started
	if [[ -z "$DISPLAY" ]] && [[ -z "$TMUX" ]]; then
		tmux -2 new-session -t tmux-vconsole
	elif [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
		# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/dotfiles/zsh/.zshrc.
		# Initialization code that may require console input (password prompts, [y/n]
		# confirmations, etc.) must go above this block; everything else may go below.
		  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
	fi

	local dotfiles_root=~/dotfiles

	HISTFILE=~/.zsh-hist-eternal
	HISTSIZE=999999
	SAVEHIST=999999

	unsetopt autocd

	source "${HOME}/.aliases"

	# Set default editor
	export VISUAL=nvim

	# Turn off bell
	unsetopt BEEP

	#### Oh My Zsh ###
	export ZSH="${dotfiles_root}/zsh/oh-my-zsh"
	export ZSH_CUSTOM="${dotfiles_root}/zsh/custom"

	ZSH_THEME="powerlevel10k/powerlevel10k"

	plugins=(git)

	source "${ZSH}/oh-my-zsh.sh"

	# To customize prompt, run `p10k configure` or edit ~/dotfiles/zsh/.p10k.zsh.
	[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

	# Use vi mode
	bindkey -v

	# fzf
	source /usr/share/fzf/key-bindings.zsh
	source /usr/share/fzf/completion.zsh

	# nnn
	export NNN_OPENER="${HOME}/.config/nnn/plugins/nuke"
	export NNN_PLUG="c:fzcd;o:fzopen"

	# gpg
	export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
	gpgconf --launch gpg-agent
fi

