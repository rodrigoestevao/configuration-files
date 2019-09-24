# Git #

Configuration files for Git. The `.gitignore` files were built with the espetacutar tool [gitignore.io](https://www.gitignore.io/).

## Installation ##

* Copy the desired `.gitignore-[something]` to your project directory, in the same level as .git folder;
* Rename it to `.gitignore`
* Copy the `.gitconfig` file to your %USERPROFILE% or $HOME (on Unix likes OS) [__`Optional`__]

## Additional Notes ##

To configure the merge tool when you're running git under WSL on Windows 10 (version 1903+) you can follow the steps below:

1. Download and install the [p4merge](https://www.perforce.com/downloads/visual-merge-tool);  
2. Consideting that it was installed on default path, execute the commands below:  
    ~~~
    git config --global difftool.p4merge.cmd '/mnt/c/Program\ Files/Perforce/p4merge.exe "$(wslpath -aw $LOCAL)" "$(wslpath -aw $REMOTE)"'
    git config --global difftool.prompt false
    git config --global merge.tool p4merge
    git config --global mergetool.p4merge.cmd '/mnt/c/Program\ Files/Perforce/p4merge.exe "$(wslpath -aw $BASE)" "$(wslpath -aw $LOCAL)" "$(wslpath -aw $REMOTE)" "$(wslpath -aw $MERGED)"'
    git config --global mergetool.prompt false
    git config --global mergetool.p4merge.trustexitcode false
    ~~~
3. Ensure that configuration is up there:  
    ~~~
    git config --global --list
    ~~~
4. For further information, please refer to [this](https://stackoverflow.com/questions/45681601/how-to-use-difftool-and-mergetool-on-windows-10-ubuntu-bash) article at StackOverflow
