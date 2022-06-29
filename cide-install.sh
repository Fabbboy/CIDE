echo "Thanks for installing CIDE :)"

# define variable were os name is stored
os_name=$(uname -s)

# if os is darwin
if [ "$os_name" == "Darwin" ]
then
    GOOS=darwin GOARCH=amd64 go build -o ../bin/CIDE/CIDE-darwin-amd64 ../cide.go
    # add to .bashrc and .zshrc
    echo "alias cide=\"${HOME}/bin/CIDE/CIDE-darwin-amd64\"" >> ~/.bashrc
    echo "export PATH=\"${HOME}/bin:${PATH}\"" >> ~/.bashrc
    echo "alias cide=\"${HOME}/bin/CIDE/CIDE-darwin-amd64\"" >> ~/.zshrc
    echo "export PATH=\"${HOME}/bin:${PATH}\"" >> ~/.zshrc
    echo "Restarting terminal"
    os.Exit(0)
elif ["$os_name" == "Linux"]
then
   GOOS=linux GOARCH=amd64 go build -o ../bin/CIDE/CIDE-linux-amd64 ../cide.go
    # add to .bashrc and .zshrc
    echo "alias cide=\"${HOME}/bin/CIDE/CIDE-linux-amd64\"" >> ~/.bashrc
    echo "export PATH=\"${HOME}/bin:${PATH}\"" >> ~/.bashrc
    echo "alias cide=\"${HOME}/bin/CIDE/CIDE-linux-amd64\"" >> ~/.zshrc
    echo "export PATH=\"${HOME}/bin:${PATH}\"" >> ~/.zshrc
    echo "Restarting terminal"
    os.Exit(0)
elif ["$os_name" == "Windows"]
then
  GOOS=windows GOARCH=amd64 go build -o ../bin/CIDE/CIDE-windows-amd64.exe ../cide.go
  # add to c:\bin
  mkdir C:\bin
  cp ../bin/CIDE/CIDE-windows-amd64.exe C:\bin\CIDE.exe
  # setx PATH "C:\bin;%PATH%"
  setx PATH "C:\bin;%PATH%"
  echo "Restarting terminal"
  os.Exit(0)
else
  echo "Sorry, your OS is not supported yet."
  os.Exit(1)
fi

