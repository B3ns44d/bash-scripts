echo "checking system..."

echo "checking for NVM"
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

if [ -d ~/.nvm ]; then
    echo "NVM already installed"
    if [ "$(node -v)" = "$(nvm version node)" ]; then
        echo "nodejs is up to date"
    else
        echo "nodejs is not up to date"
        echo "updating nodejs"
        nvm install --lts
        nvm use --lts
    fi
    if [ "$(yarn -v)" = "$(yarn --version)" ]; then
        echo "yarn is up to date"
        if [ -d "./node_modules" ]; then
            echo "node_modules already installed"
            if [ "$(yarn check --integrity)" = "✔" ]; then
                echo "node_modules are up to date"
            else
                echo "node_modules are not up to date"
                echo "updating node_modules"
                yarn
            fi
        else
            echo "installing node_modules"
            yarn
        fi
        echo "😎 NOW YOUR GOOD TO GO!"
    else
        echo "yarn is not up to date"
        echo "updating yarn"
        npm install yarn@latest -g
    fi
else
    echo "NVM not installed"
    read -p "Do you want to install nvm? (Y/n) " answer
    if [ -z "$answer" ] || [ "$answer" = "Y" ] || [ "$answer" = "y" ]; then
        echo "installing nvm"
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
    else
        echo "please install nvm"
    fi

fi

