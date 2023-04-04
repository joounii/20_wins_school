#!/bin/bash

install_utilities () {

    # List of required tools
    tools=("jq")

    # Check if each tool is installed, and install it if not
    for tool in "${tools[@]}"
    do
        if ! command -v "$tool" &> /dev/null
        then
            echo "$tool is not installed, installing..."
            if command -v "apt-get" &> /dev/null
            then
                sudo apt-get install -y "$tool"
            elif command -v "yum" &> /dev/null
            then
                sudo yum install -y "$tool"
            elif command -v "brew" &> /dev/null
            then
                brew install "$tool"
            elif command -v "choco" &> /dev/null
            then
                echo "Could not install $tool automatically. Please install it manually in a CMD with administrator rights and then run the script again. You can try this command to install it: choco install $tool "
            else
                echo "Could not install $tool automatically. Please install it manually."
            fi
        else
            echo "$tool is already installed."
        fi
    done
}