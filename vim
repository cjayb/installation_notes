# Vanilla vim (from mercurial) on Debian

To use anaconda python, we need the --with-python-config-dir set:

```
  hg clone https://vim.googlecode.com/hg/ vim
  cd vim
  ./configure --with-features=huge --enable-pythoninterp --with-python-config-dir=/usr/local/common/anaconda/lib/python2.7/config --prefix=/opt/local/vim74
  make
  sudo chown -R cjb /opt/local/vim74 # needed for whetever reason, otherwise make install fails!
  make install
  sudo chown -R root:root /opt/local/vim74
```

# MacVim on OS X (10.8, 9?)

Similarly to linux above, loosely following (https://github.com/b4winckler/macvim/wiki/Building):

```
  git clone git://github.com/b4winckler/macvim.git
  make distclean # VERY IMPORTANT!
  ./configure --with-features=huge --enable-pythoninterp --with-python-config-dir=/Users/cjb/anaconda/lib/python2.7/config --prefix=/opt/local
  
EDIT (24 Sep 2014): The above seems to work on Mavericks, but a -framework Python sneaks into the gcc link command if you run make!
FIX: find the line PYTHON_LIBS in src/auto/config.mk (after running the configure script!), and replace

  PYTHON_LIBS = -framework Python
  to
  PYTHON_LIBS = -L/Users/cjb/anaconda/lib/python2.7/config -lpython2.7

  make
  open MacVim/build/Release
```

Then move the .app into /Applications
