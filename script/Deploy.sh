cd public
git init
GITHUB_URL=https://oauth:${GITHUB_TOKEN}@github.com/Mlikiowa/Mlikiowa.github.io.git
git remote add origin ${GITHUB_URL}
git add .
git commit -m "Automatic generation"
git push -f 
