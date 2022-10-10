cd public
git config --global init.defaultBranch main
git init
GITHUB_URL=https://oauth:${GITHUB_TOKEN}@github.com/Mlikiowa/Mlikiowa.github.io.git
git remote add origin ${GITHUB_URL}
git branch -M main
git config --global user.name "Mlikiowa"
git config --global user.email "nineto0@163.com"
git add .
git commit -m "Automatic generation"
git push --set-upstream origin main -f 
