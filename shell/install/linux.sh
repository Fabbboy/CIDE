# install ../CIDE/CIDE-linux-amd64 to .bashrc and .zshrc
export PATH="${HOME}/bin:${PATH}"
echo "export PATH=\"${HOME}/bin:${PATH}\"" >> ~/.bashrc
echo "export PATH=\"${HOME}/bin:${PATH}\"" >> ~/.zshrc
echo "Restarting terminal"
os.Exit(0)
command -v cide