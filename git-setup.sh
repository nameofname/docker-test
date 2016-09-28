ssh-keygen -t rsa -b 4096 -C "nameofemail@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
echo "ok now go on and add your ssh key to github. I'll wait..."
cat ~/.ssh/id_rsa.pub


echo "done? reply 'y' to continue [y/n]"
read done
if [ "$done" == "n" ]
	then exit 1
fi

cd ~/projects
git clone git@github.com:nameofname/dot-files.git
cd ~/projects/dot-files/
./setup.sh 
