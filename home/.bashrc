set -o vi
bind -m vi-insert "\C-l":clear-screen
HOSTNAME=`hostname`

GIT_PS1_SHOWUPSTREAM="auto"
UNAME=`uname`
if [ $UNAME = "Darwin" ] ; then
# Darwin specific
  source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh

  export GOPATH=$HOME/Development/go
  export ANDROID_HOME=/Users/brbuller/Development/android/android-sdk-macosx
  export GRADLE_HOME=/Users/brbuller/Development/gradle/gradle-1.11
  export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$GRADLE_HOME/bin:$GOPATH/bin

  ##
  # Your previous /Users/brbuller/.bash_profile file was backed up as /Users/brbuller/.bash_profile.macports-saved_2013-10-07_at_12:13:48
  ##

  # MacPorts Installer addition on 2013-10-07_at_12:13:48: adding an appropriate PATH variable for use with MacPorts.
  export PATH=/opt/local/bin:/opt/local/sbin:$PATH
  # Finished adapting your PATH environment variable for use with MacPorts.
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
elif [ $UNAME = "Linux" ]; then
  PATH=/usr/local/sbin:$PATH
  JAVA_HOME=/usr/local/etc/jdk1.8.0_25
  source /usr/local/sbin/git-prompt.sh
fi


__br0xen_ps1() {
  g_branch=$(git branch &>/dev/null;\
    if [ $? -eq 0 ]; then
      echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1;
        if [ "$?" -eq "0" ]; then
          # @4 - Clean repository - nothing to commit
          echo "\[\033[0;32m\]"$(__git_ps1 "(%s o)");
        else
          # @5 - Changes to working tree
          echo "\[\033[0;91m\]"$(__git_ps1 "{%s x}");
        fi)"
  fi)

  export PS1="\[\033[1;34m\]\!\[\033[0m\] \[\033[0;93m\]\w\[\033[0m\] $g_branch\$ \[\033[0m\]" 
}

PROMPT_COMMAND='__br0xen_ps1'


source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"