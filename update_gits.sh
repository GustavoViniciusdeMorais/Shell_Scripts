#!/bin/bash
repos='LinuxAdmin Database_Studies Hacking_Studies PhpProjectSetup WebServices_Studies Docker_Study Shell_Scripts Python_Studies Git_Basic_Commands'
for repo in $repos; do 
    echo "Folder: ${repo}";
    git config --global --add safe.directory /home/gustavo/Studies/$repo;
    cd /home/gustavo/Studies/$repo;
    echo "Branch: $(git branch --show-current)";
    git pull; echo "";
done

echo "\n Copying PhpSkeleton \n";
rm -rf /home/gustavo/Studies/PhpSkeleton/*
cd /home/gustavo/Studies/PhpProjectSetup;
git restore .
git checkout skeleton
git pull
cp -R ./* /home/gustavo/Studies/PhpSkeleton
cd /home/gustavo/Studies
echo "\n PhpSkeleton is Done! \n";

echo "\n Copying PhpGeoBash \n";
rm -rf /home/gustavo/Studies/PhpGeoBash/*
cd /home/gustavo/Studies/PhpProjectSetup;
git restore .
git checkout geobash
git pull
cp -R ./* /home/gustavo/Studies/PhpGeoBash
cd /home/gustavo/Studies
echo "\n PhpGeoBash is Done! \n";
