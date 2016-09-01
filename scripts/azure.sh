
azure login
azure config mode asm
azure account list
azure account set "Microsoft Partner Network"

mkdir $1
cd  $1
dotnet new -t web
dotnet restore
dotnet ef database update
azure site create --git --location "North Europe" $1
git add .
git commit -m "initial release of $1"
git push --set-upstream azure master
echo All Done!
git remote add azure https://$1.scm.azurewebsites.net/$1.git

echo http://$1.azurewebsites.net  
echo Remember to set your git credentials
echo to redeploy, cd to $1, and do a 'git push -f azure'



