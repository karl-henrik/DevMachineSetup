# Adapted from https://learn.microsoft.com/en-us/windows/terminal/tutorials/custom-prompt-setup


echo "Checking if homebrew is installed..."

which brew
if [ $? -eq 1 ] ; then
    echo "Could not find homebrew, installing homebrew."
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/karl-henrik/.profile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    brew install gcc
else
    echo "Found homebrew, updating homebrew."
    brew update
fi

which oh-my-posh
if [ $? -eq 1 ] ; then
    echo "Could not find oh-my-posh, installing."
    brew install jandedobbeleer/oh-my-posh/oh-my-posh
else
    echo "Found oh-my-posh, updating."
    brew update && brew upgrade oh-my-posh
fi

oh-my-posh font install