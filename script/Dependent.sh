#!/usr/bin/env sh

# ------------------------------------------------------------------------------
# nanaeo 部署脚本
# @author Mlikiowa
# @since 2022/10/10
# ------------------------------------------------------------------------------

npm install
npm install hexo-cli -g
git clone https://github.com/MliKiowa/BlogFriend
cd BlogFriend          
mv test/friend.yml ../source/_data/friends.yml
cd ..
cat source/_data/friends.yml
rm -rf BlogFriend
npm run build
