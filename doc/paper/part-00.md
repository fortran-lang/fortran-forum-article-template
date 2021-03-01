---
issue: August 2020, \textbf{39}, 1
title: Whither Fortran Forum?
author:
  - Brad Richardson
  - Damian Rouson
...

# Motivation

As a newsletter dedicated to the world's oldest programming language, ACM SIGPLAN _Fortran Forum_ holds a unique place in the literature.
For nearly forty years, _Fortran Forum_ has chronicled the language that brings the world its weather and climate predictions [@skamarock2008description;@danabasoglu2020community] and supports the design of power plants [@geelhood2011fraptran] and vehicles that traverse land, air, and space [@cifuentes2012using;@biedron2019fun3d].
When _Fortran Forum_, n\'ee _ForTec Forum_, published its inaugural issue, FORTRAN was still spelled in upper case and was "the most widely used programming language" according to an article by founding Editor Loren Meissner [@meissner1982fortran].

_Fortran Forum_ has published a mix of research articles, columns, and news with the most highly cited research articles garnering nearly 1,000 citations since publication [@numrich1998co].

Lowering the barrier to entry for authors.
A more transparent review process.
Simplifying the publication procedure.

# The Template Format

We chose [markdown] as the format for the template, as an approachable, yet powerful format.

* Readable unprocessed
* Supported by multiple tools
* Convenient for version control

# The Template Repository

We chose to store the template in a GitHub repository for the following reasons:

* Publicly available and easy to get a copy
* Easy for users to submit feedback
* Automated checking with CI

# How the Template Works

Click the "Use This Template" button in the [article template repository] to create your own copy.
You write your article in the provided template file (this file), using markdown format.
You can also add additional references to the included `bibliography.bib` file in bibtex format,
and then cite those references as demonstrated below.
All of this editing can be done in a web browser via GitHub,
but if you're familiar with git can be done in whatever method is most convenient for you.

For every commit made to your repository, the provided CI script (`.github/workflows/CI.yml`) will convert your article to a pdf
that can be downloaded from the "Actions" tab of your repository on GitHub
by clicking on the most recent run and looking for the "Artifacts" section.
If you are working on your own machine and have `pandoc` and \LaTeX installed,
you can generate the same preview locally using the command found in the "Render Paper" section of the CI script.

## Some Additional Features

In addition to most of the usual features of markdown, such as headings, bulleted and numbered lists, and hyperlinks,
this template supports some features also required for producing quality articles.

### Citations

Invariably, any article will need to cite prior work.
This is done by including an entry for the reference you would like to cite in the `bibliography.bib` file.
Then, within the text of the article, citations are made using [rMarkdown] syntax,
as illustrated below for quick reference.

- `@cifuentes2012using`  ->  @cifuentes2012using
- `[@berna1997frapcon]` -> [@berna1997frapcon]
- `[@biedron2019fun3d; @danabasoglu2020community]` -> [@biedron2019fun3d; @danabasoglu2020community]

### Figures With Captions and References

Quite frequently it is desirable to include a figure within an article, and refer to it within the text.
This can be done similarly to regular markdown, but with some additional syntax as shown below.
The results of this can then be seen in \autoref{fig:example}, with the reference to it generated with the syntax `\autoref{fig:example}`.

```
![The Fortran logo from fortran-lang.org\label{fig:example}](Fortran-logo.png){ width=20% }
```

![The Fortran logo from fortran-lang.org\label{fig:example}](Fortran-logo.png){ width=20% }

### Equations

Another aspect quite frequently used in articles is mathematics.
One can use single dollar signs (`$`) to delimit inline mathematics.
For example, `$e = m c^2$` will be rendered as $e = m c^2$.

Double dollar signs can be used to make self-standing equations,
as illustrated by the syntax bellow being rendered into the equation that follows.

```
$$
\frac{\partial u}{\partial t}
+ \left( u \cdot \nabla \right) u
- \nu \nabla^2 u
= \nabla w + g
$$
```

$$
\frac{\partial u}{\partial t}
+ \left( u \cdot \nabla \right) u
- \nu \nabla^2 u
= \nabla w + g
$$

You can also use plain \LaTeX for equations, as illustrated by the syntax below,
and rendered into \autoref{eq:boltzmann}, referred to by the sytanx `\autoref{eq:boltzmann}`.

```
\begin{equation}\label{eq:boltzmann}
\left( \frac{\partial}{\partial t}
+ \overrightarrow{v_1} \cdot \nabla_{\overrightarrow{r}}
+ \frac{\overrightarrow{K}}{m} \cdot \nabla_{\overrightarrow{v_1}} \right) f_1
= \int d\Omega \int d\overrightarrow{v_2} \sigma\left(\Omega\right)
\left| \overrightarrow{v_1} - \overrightarrow{v_2} \right|
\left( f_1'f_2' - f_1f_2 \right)
\end{equation}
```

\begin{equation}\label{eq:boltzmann}
\left( \frac{\partial}{\partial t}
+ \overrightarrow{v_1} \cdot \nabla_{\overrightarrow{r}}
+ \frac{\overrightarrow{K}}{m} \cdot \nabla_{\overrightarrow{v_1}} \right) f_1
= \int d\Omega \int d\overrightarrow{v_2} \sigma\left(\Omega\right)
\left| \overrightarrow{v_1} - \overrightarrow{v_2} \right|
\left( f_1'f_2' - f_1f_2 \right)
\end{equation}

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

[markdown]: https://guides.github.com/features/mastering-markdown/
[article template repository]: https://github.com/fortran-lang/fortran-forum-article-template
[rMarkdown]: http://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html
