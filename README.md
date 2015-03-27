dotvim
======

Init
-------
```bash
git clone git@github.com:imkeke/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
```

Add plugin
----------
```bash
cd ~/.vim
git submodule add git://github.com/xxx.git bundle/xxx
```

Update plugins
--------------
```bash
cd ~/.vim
git submodule foreach "git pull"
```
