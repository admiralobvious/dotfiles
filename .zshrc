export ZSH="/Users/alf/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git kubectl)

source $ZSH/oh-my-zsh.sh

# User configuration
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alf/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/alf/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alf/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/alf/google-cloud-sdk/completion.zsh.inc'; fi

alias mtr="PATH=/usr/local/sbin:$PATH sudo mtr'

