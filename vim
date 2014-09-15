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
  ./configure --with-features=huge --enable-pythoninterp --with-python-config-dir=/Users/cjb/anaconda/lib/python2.7/config --prefix=/opt/local
  make
  
EDIT (15 Sep 2014): the make seems to work now (on Mavericks), so below not needed!

However, the make fails since it tries to link to -framework Python. Copy-paste the failing command, and replace the last two words with:
  ... -L${PYTHON_CONFDIR} -lpython2.7
  make
  open MacVim/build/Release
```

Then move the .app into /Applications
