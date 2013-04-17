dotvim
======

我的 Vim 配置文件。

Install
-------

```
git clone git@github.com:imkeke/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
```

Add plugin
----------
`
cd ~/.vim
git submodule add git://github.com/xxx.git bundle/xxx
`

Update plugins
--------------

`
cd ~/.vim
git submodule foreach "git pull"
`
