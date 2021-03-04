ACM SIGPLAN Fortran Forum Article Template

This repository provides a template for 

1. Building _ACM SIGPLAN Fortran Forum_ articles.
2. Building and testing any accompanying code. 

Prerequisites
-------------

### Working on GitHub

No prerequisites are required for writing and building your paper and source code on GitHub.  If no errors occur, the paper will be deployed to the web and the results of the continuous integration (CI) tests will be reported on GitHub.

### Working on your own platform

We recommend using the latest versions of the prerequisite packages.  Where a minimum version is known, we note it below.

1. Fortran Package Manager ([fpm](https://github.com/fortran-lang/fpm))
2. GNU [make](https://www.gnu.org/software/make/)
3. [pandoc](https://pandoc.org) 2.11 document format converter.
4. [pandoc-include-code](https://github.com/owickstrom/pandoc-include-code) for embedding Fortran in LaTeX.
5. [LaTeX](https://www.latex-project.org) document preparation software.
6. [codespell](https://github.com/codespell-project/codespell) spell-checker.

We recommend installing `fpm` from a released executable file. If possible, install the remaining packages using a package manager.


Building the paper
------------------

### Automated build and deployment to the web

The article uses GitHub-flavored Markdown with embedded LaTeX commands for equations and figures and BibTeX citations for generating a bibliography.
This repository employs a CI script to automatically generate a Portable Document Format (PDF) file from the all Markdown files matching the `doc/paper/part-*.md` glob expression.
The CI script [.github/workflows/CI.yml](.github/workflows/CI.yml) deploys the resulting PDF file to a **public** GitHub Pages web site with a URL of the form `https://username.github.io/project-name`.
To support this feature, a user must enable GitHub Pages for their fork of this repository.
Users who prefer to prevent the public deployment of the PDF may do so by removing the `Prepare for Deployment` and `Deploy to GitHub Pages` blocks of code in the aforementioned CI script.
We encourage those who are so inclined to make their PDF public to support open access to your work.

### Building on yor own platform

In a command-line shell on Linux, macOS, or Windows Subsystem for Linux, compile the PDF of the paper as follows:
```
git clone git@github.com:fortran-lang/fortran-forum-article-template
cd fortran-forum-article-template
make
```
If this creates `paper.pdf`, write your paper in `doc/paper/part-*.md` files.

Building and testing the code
-----------------------------

### Automated building and testing

This repository's CI script builds the example [./app/main.f90] program and links it to a static library built from the code in [./src].  The CI script runs the resulting main program and builds and runs the [Vegetables] unit tests in [./tests].

### Building on yor own platform

Build and test the example code as follows:
```
fpm test
```
If the test(s) pass(es), replace the Fortran source in `./src` with your code. 

Writing your article
--------------------

The `paper.pdf` file generated from the initial version of this repository explains several Markdown and LaTeX features that you can use in writing your paper.  To write your paper, edit or replace the [./doc/paper/part-00.md] file and add any additional `part-*.md` files in the same subdirectory.

[Vegetables]: https://gitlab.com/everythingfunctional/vegetables
