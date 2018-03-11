## Forkしたリポジトリを最新版に更新
```
git remote add upstream https://（追跡したいリポジトリのURL）.git
git fetch upstream
git merge upstream/master
```

次はこれでやってみるか。
```
git remote add upstream git://github.com/ORIGINAL-DEV-USERNAME/REPO-YOU-FORKED-FROM.git
git fetch upstream
git pull upstream master
```
