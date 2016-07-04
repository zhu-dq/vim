
### 前提0：安装vim依赖环境
>   sudo apt-get build-dep vim   

### 前提1：源码编译最新版vim
>    vim.org/sources.php<br>
>   cd vim74/<br>
>   ./configure --with-features=huge --enable-rubyinterp --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config/ --enable-perlinterp --enable-gui=gtk2 --enable-cscope --prefix=/usr --enable-luainterp<br> 
sudo make VIMRUNTIMEDIR=/usr/share/vim/vim74 <br>sudo make install


### 前提2：源码编译clang
>下载最新clang llvm源码：http://llvm.org/releases/download.html<br>
    在源码根目录执行以下命令：<br>
    ./configure --enable-optimized CC=gcc CXX=g++<br>
    sudo make<br>
    sudo make install<br>



###  第一步
> clone vim-pathogen 和 vundle 到bundle文件夹下。



###  第二步
> 把 .vimrc copy到～目录下



###  第三步
> 打开vim编辑器 执行:BundleInstall或在终端执行:    vim +BundleInstall +qall


###  第四步  编译YCM
> 我试了以下  ubuntu 32位和64位编译不一样<br>
*    ubuntu 64:<br>
>    cd ~/.vim/bundle/YouCompleteMe<br>
    git submodule update --init --recursive<br>
    ./install.sh --clang-completer <br>
*    ubuntu 32:<br>
>    ./install.sh --clang-complete --system-libclang<br>



### 第五步  markdown 生效的前提条件（下面命令需要翻墙）
>sudo gem install pygments.rb<br>
  sudo  gem install redcarpet<br>
  sudo  npm -g install instant-markdown-d



### PS
>  把colors文件夹放到和bundle文件夹平行的位置，即把放到.vim下面




