# build for all platforms

#define home
HOME=$(pwd)

echo "Running build for: MacOSX, Linux, Windows. Stored in ./bin/CIDE"

echo "Building for MacOSX"
# install using alias cide
GOOS=darwin GOARCH=amd64 go build -o ../bin/CIDE/CIDE-darwin-amd64 ../cide.go
echo "Building for Linux"
GOOS=linux GOARCH=amd64 go build -o ../bin/CIDE/CIDE-linux-amd64 ../cide.go
echo "Building for Windows"
GOOS=windows GOARCH=amd64 go build -o ../bin/CIDE/CIDE-windows-amd64.exe ../cide.go
echo "Build done"

runningOs = os.Getenv("GOOS")
echo "Running build for: $runningOs"

# check if os is windows
if [runningOs == "darwin"] {
  cp ../bin/CIDE/CIDE-darwin-amd64 ../bin/CIDE
  # make the binary executable by: chmod 755 ${HOME}/bin/binary
  chmod 755 ${HOME}/bin/CIDE/CIDE-darwin-amd64
  #open .bashrc and add the following line: alias cide="${HOME}/bin/CIDE/CIDE-darwin-amd64"
  echo "alias cide=\"${HOME}/bin/CIDE/CIDE-darwin-amd64\"" >> ~/.bashrc
  # add:  export PATH="${HOME}/bin:${PATH}" to .bashrc
  echo "export PATH=\"${HOME}/bin:${PATH}\"" >> ~/.bashrc
  # the same for .zshrc
  echo "alias cide=\"${HOME}/bin/CIDE/CIDE-darwin-amd64\"" >> ~/.zshrc
  echo "export PATH=\"${HOME}/bin:${PATH}\"" >> ~/.zshrc
  # restart terminal
  echo "Restarting terminal"
  os.Exit(0)
  command -v cide
}
if [runningOs == "linux"] {
  cp ../bin/CIDE/CIDE-linux-amd64 ../bin/CIDE
  chmod 755 ${HOME}/bin/CIDE/CIDE-linux-amd64
  echo "alias cide=\"${HOME}/bin/CIDE/CIDE-linux-amd64\"" >> ~/.bashrc
  echo "export PATH=\"${HOME}/bin:${PATH}\"" >> ~/.bashrc
  echo "alias cide=\"${HOME}/bin/CIDE/CIDE-linux-amd64\"" >> ~/.zshrc
  echo "export PATH=\"${HOME}/bin:${PATH}\"" >> ~/.zshrc
  echo "Restarting terminal"
  os.Exit(0)
  command -v cide
}
if [runningOs == "windows"] {
  # mkdir C:\bin
  mkdir C:\bin
  cp ../bin/CIDE/CIDE-windows-amd64.exe C:\bin\CIDE.exe
  #  setx PATH "C:\bin;%PATH%"
  setx PATH "C:\bin;%PATH%"
  echo "Restarting terminal"
  os.Exit(0)
}