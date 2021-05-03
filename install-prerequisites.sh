#!/bin/sh

set -e # exit on error

if command -v stack 1> /dev/null 2>&1 ; then
  echo "Found stack"
else
  echo "Haskell stack not found."
  echo "Installing Haskell stack"
  curl -sSL https://get.haskellstack.org/ | sh
  if command -v stack 1> /dev/null 2>&1 ; then
    echo "Haskell stack installation successful."
  else
    echo "ERROR: Haskell stack installation unsuccessful."
    exit 1
  fi
fi

if command -v pandoc 1> /dev/null 2>&1 ; then
  echo "Found pandoc"
else
  echo "pandoc not found."
  echo "Installing pandoc"
  stack install pandoc
  if command -v pandoc 1> /dev/null 2>&1 ; then
    echo "pandoc installation successful."
  else
    echo "ERROR: pandoc installation unsuccessful."
    exit 1
  fi
fi

if command -v pandoc-include-code 1> /dev/null 2>&1 ; then
  echo "Found pandoc-include-code"
else
  echo "pandoc-include-code not found."
  echo "Installing pandoc-include-code"
  stack install pandoc-include-code
  if command -v pandoc-include-code 1> /dev/null 2>&1 ; then
    echo "pandoc-include-code installation successful."
  else
    echo "ERROR: pandoc-include-code installation unsuccessful."
    exit 1
  fi
fi

if command -v make 1> /dev/null 2>&1 ; then
  echo "Found make"
else
  echo "make not found."
  echo "Installing make"
  if command -v apt 1> /dev/null 2>&1 ; then
    sudo apt install make
  elif command -v yum 1> /dev/null 2>&1 ; then
    sudo yum install make
  elif command -v dnf 1> /dev/null 2>&1 ; then
    sudo dnf install make
  elif command -v pacman 1> /dev/null 2>&1 ; then
    sudo pacman -S make
  elif command -v brew 1> /dev/null 2>&1 ; then
    brew install make
  fi
  if command -v make 1> /dev/null 2>&1 ; then
    echo "make installation successful."
  else
    echo "ERROR: make installation unsuccessful."
    exit 1
  fi
fi

if command -v codespell 1> /dev/null 2>&1 ; then
  echo "Found codespell"
else
  echo "codespell not found."
  echo "Installing codespell"
  if command -v pip 1> /dev/null 2>&1 ;  then
    pip install --user codespell
  elif command -v apt 1> /dev/null 2>&1 ; then
    sudo apt install codespell
  elif command -v yum 1> /dev/null 2>&1 ; then
    sudo yum install codespell
  elif command -v dnf 1> /dev/null 2>&1 ; then
    sudo dnf install codespell
  elif command -v pacman 1> /dev/null 2>&1 ; then
    sudo pacman -S codespell
  elif command -v brew 1> /dev/null 2>&1 ; then
    brew install codespell
  fi
  if command -v codespell 1> /dev/null 2>&1 ; then
    echo "codespell installation successful."
  else
    echo "ERROR: codespell installation unsuccessful."
    exit 1
  fi
fi

if command -v pdflatex 1> /dev/null 2>&1 ; then
  echo "Found LaTeX"
else
  echo "LaTeX not found."
  echo "Installing LaTeX"
  if command -v apt 1> /dev/null 2>&1 ; then
    sudo apt install texlive-latex-recommended texlive-latex-extra texlive-science
  elif command -v yum 1> /dev/null 2>&1 ; then
    sudo yum install texlive-latex-recommended texlive-latex-extra texlive-science
  elif command -v dnf 1> /dev/null 2>&1 ; then
    sudo dnf install texlive-latex-recommended texlive-latex-extra texlive-science
  elif command -v pacman 1> /dev/null 2>&1 ; then
    sudo pacman -S texlive-latex-recommended texlive-latex-extra texlive-science
  elif command -v brew 1> /dev/null 2>&1 ; then
    brew install texlive-latex-recommended texlive-latex-extra texlive-science
  fi
  if command -v pdflatex 1> /dev/null 2>&1 ; then
    echo "LaTeX installation successful."
  else
    echo "ERROR: LaTeX installation unsuccessful."
    exit 1
  fi
fi

if command -v fpm 1> /dev/null 2>&1 ; then
  echo "Found fpm"
else
  echo "fpm not found."
  echo "Installing fpm"
  wget https://github.com/fortran-lang/fpm/archive/refs/tags/v0.2.0.tar.gz
  tar -xf v0.2.0.tar.gz
  cd v0.2.0
  ./install.sh
fi
