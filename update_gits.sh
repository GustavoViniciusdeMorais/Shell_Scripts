#!/bin/bash
repos='UnixStudy Database_Studies Hacking_Studies PhpProjectSetup WebServices_Studies Docker_Study Shell_Scripts'
for repo in $repos; do 
    echo "Folder: ${repo}";
    cd /home/gustavo/Studies/$repo;
    echo "Branch: $(git branch --show-current)";
    git pull; echo "";
done
