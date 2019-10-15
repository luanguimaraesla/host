====================
NEOVIM CONFIGURATION
====================

To install my vim environment you must have :code:`nvim` and :code:`vim-plug` installed.

Mac OS
======

.. code-block:: bash
  curl -sL install-node.now.sh | sh
  brew install neovim/neovim/neovim
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ln -s ~/Warzone/Git/host/vim/init.vim ~/.config/nvim/init.vim 
