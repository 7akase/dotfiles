set prompt='%{\e[32m%}%n %#%{\e[00m%} '
set rprompt='%{\e[00m%}[%c3]'

setenv PATH /usr/local/bin:/usr/local/sbin:${PATH}:/opt/local/bin:/opt/local/sbin:${HOME}/.local/bin
setenv AGDA_DIR ${HOME}/.agda
setenv PYENV_ROOT "${HOME}/.pyenv"
setenv PATH "${PYENV_ROOT}/bin:${PATH}"
setenv cdw ~/work

setenv LD_LIBRARY_PATH /opt/openblas/lib

alias ls 'ls -GF --color=auto'
alias g  'git'
alias gst 'git status'
alias ga  'git add'
alias cdw 'cd ~/work/'
alias cdp 'cd ~/work/proj/'

alias sbcl 'rlwrap sbcl'
