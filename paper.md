---
issue: August 2020, \textbf{39}, 1
title: Whither Fortran Forum?
author:
  - Brad Richardson
  - Damian Rouson
...

# Motivation

As a newsletter dedicated to the world's oldest programming language, ACM SIGPLAN _Fortran Forum_ holds a unique place in the literature.
For nearly forty years, _Fortran Forum_ has chronicled the language that brings the world its weather and climate predictions [@skamarock2008description,@danabasoglu2020community] and supports the design of power plants [@geelhood2011fraptran] and vehicles that traverse land, air, and space [@cifuentes2012using,@biedron2019fun3d].
When _Fortran Forum_, n\'ee _ForTec Forum_, published its inaugural issue, FORTRAN was still spelled in upper case and was "the most widely used programming language" according to an article by founding Editor Loren Meissner [meissner1982fortran].

_Fortran Forum_ has published a mix of research articles, columns, and news with the most highly cited research articles garnering nearly 1,000 citations since publication [@numrich1998co].

Lowering the barrier to entry for authors.
A more transparent review process.
Simplifying the publication procedure.

# The Template Format

We chose markdown as the format for the template, as an approachable, yet powerful format.

* Readable unprocessed
* Supported by multiple tools
* Convenient for version control

# The Template Repository

We chose to store the template in a GitHub repository for the following reasons:

* Publicly available and easy to get a copy
* Easy for users to submit feedback
* Automated checking with CI

# How the Template Works

* Markdown format
* Use `pandoc` to convert to a nicely rendered pdf
* Can include citations
* figures
* equations
* tables

# Submitting an Article

* Fork the repository
* Edit the existing files to write your article, using git to save your work
* Contact us and give us access to your repository
* Any review comments will be submitted as GitHub Issues
* Once accepted, we can incorporate your article into the next issue

# Automated Checks

The repository that this template is stored in comes with some automated checks.

* Compiles the paper, generating a pdf that you can download
* Runs a spell checker on the paper
* Attempts to compile any source code files included
