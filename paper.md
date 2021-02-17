---
issue: April 2020, \textbf{39}, 1
title: A New Template For Submissions to ACM Fortran Forum
authors:
  - name: Brad Richardson
    orcid:
    affiliation: 1
  - name: Damian Rouson
    orcid:
    affiliation: 1
affiliations:
 - name: Sourcery Institute
   index: 1
...

# Motivation

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

These checks are automated via the CI script found in the `.github/workflows/CI.yml` file.
