#cp ../bin/CIDE/CIDE-darwin-amd64 ../bin/CIDE
 #  # make the binary executable by: chmod 755 ${HOME}/bin/binary
 #  chmod 755 ${HOME}/bin/CIDE/CIDE-darwin-amd64
 #  #open .bashrc and add the following line: alias cide="${HOME}/bin/CIDE/CIDE-darwin-amd64"
 #  echo "alias cide=\"${HOME}/bin/CIDE/CIDE-darwin-amd64\"" >> ~/.bashrc
 #  # add:  export PATH="${HOME}/bin:${PATH}" to .bashrc
 #  echo "export PATH=\"${HOME}/bin:${PATH}\"" >> ~/.bashrc
 #  # the same for .zshrc
 #  echo "alias cide=\"${HOME}/bin/CIDE/CIDE-darwin-amd64\"" >> ~/.zshrc
 #  echo "export PATH=\"${HOME}/bin:${PATH}\"" >> ~/.zshrc
 #  # restart terminal
 #  echo "Restarting terminal"
 #  os.Exit(0)
 #  command -v cide



var1=50
var2=60

if [ $var1 == $var2 ]
then
    echo "YES"
else
    echo "NO"
fi