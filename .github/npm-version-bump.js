const fs = require('fs/promises')

const pageageFile = {
  "name": "@mlikiowa/nanaeo",
  "description": "Volantis nanaeo",
  "version": `1.0.${Date.now()}`,
  "license": "MIT",
  "repository": {
    "type": "git",
    "url": "git+https://github.com/MliKiowa/nanaeo.git"
  },
  "author": "Volantis Community",
  "keywords": ["Volantis", "Community", "static"],
  "main": "LICENSE"
}

const pageageFileStr = JSON.stringify(pageageFile)
fs.writeFile('./public/package.json', pageageFileStr, 'utf8', (err) => {
  if (err) throw err
})
