---
issue: April 2020, \textbf{39}, 1
title: A New Template For Submissions to ACM Fortran Forum
author:
  - Brad Richardson
  - Damian Rouson
...

# Motivation

A key factor in the success of a publication is attracting a steady stream of authors to submit articles.
One impediment to this can be the difficulty of the process of writing and preparing an article for submission.
It is the hope that by using a simpler format for article content,
making use of practices and tools familiar to most programmers,
and automating a significant portion of the authoring process - namely spell checking and formatting -
we can lower the barrier to entry for authors.

Another possible obstacle to authors can be the review process.
ACM Fortran Forum has traditionally not been a peer reviewed journal,
but the editor is exploring the possibility of having a peer reviewed option.
The editor would prefer that the review process be open (public)
as a way of encouraging reviewers and authors to be on good behavior.
This also allows prospective new authors to see how the process works
and not be turned off by fear of the unknown.

Finally, by having much of the process automated and encouraging authors to utilize the template,
it can alleviate some of the burden on the editors for producing new issues of the journal.
This can help ensure a regular publication schedule, without which new authors might not be attracted.
It can also ensure that the publication adheres to a consistent style and has a quality format,
also something beneficial for attracting prospective authors.

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
You can also add additional references to the included `references.bib` file in bibtex format,
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
This is done by including an entry for the reference you would like to cite in the `references.bib` file.
Then, within the text of the article, citations are made using [rMarkdown] syntax,
as illustrated below for quick reference.

- `@author:2001`  ->  @author:2001
- `[@author:2001]` -> [@author:2001]
- `[@author1:2001; @author2:2001]` -> [@author1:2001; @author2:2001]

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

The process of writing and submitting an article can now become much simpler.
No longer will you need to battle with word processor template or fight with the difficulties of \LaTeX.
Formatting is not something the author must worry about.
Just write the content.

To submit an article for publication, follow the instructions described in the previous section to write your article.
Once your article is ready to review, contact the editors of the Journal at ???,
and make sure that they have access to view the repository with your article.
If you elect to have your article peer reviewed prior to publication, you will also need to grant access to the reviewers.
Any review comments will be submitted as GitHub Issues.
Once all review comments have been satisfactorily addressed, the editors will be able to include your article in the next issue of the journal.

# Automated Checks

The repository that this template is stored in comes with some automated checks.

* Compiles the paper, generating a pdf that you can download
* Runs a spell checker on the paper
* Attempts to compile any source code files included

These checks are automated via the CI script found in the `.github/workflows/CI.yml` file.

[markdown]: https://guides.github.com/features/mastering-markdown/
[article template repository]: https://github.com/fortran-lang/fortran-forum-article-template
[rMarkdown]: http://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html
