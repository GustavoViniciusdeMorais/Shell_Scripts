#!/bin/bash
repos='LinuxAdmin Database_Studies Hacking_Studies PhpProjectSetup WebServices_Studies Docker_Study Shell_Scripts Python_Studies Git_Basic_Commands'
for repo in $repos; do 
    echo "Folder: ${repo}";
    git config --global --add safe.directory /home/gustavo/Studies/$repo;
    cd /home/gustavo/Studies/$repo;
    echo "Branch: $(git branch --show-current)";
    git pull; echo "";
done
