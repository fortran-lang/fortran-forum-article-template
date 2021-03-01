# Build ACM SIGPLAN Fortran Forum paper PDF file from Markdown file with embedded LaTeX statements

DOC_DIR := doc # Directory for paper source
DOC_DIR := $(strip $(DOC_DIR))

RESOURCE_PATH := $(DOC_DIR)/resources
BIBLIOGRAPHY := bibliography.bib
BIBLIOGRAPHY_PATH := $(RESOURCE_PATH)/$(BIBLIOGRAPHY)
TEMPLATE := template.tex
TEMPLATE_PATH := $(RESOURCE_PATH)/$(TEMPLATE)
IMAGES ?= $(wildcard $(RESOURCE_PATH)/*.png) $(wildcard $(RESOURCE_PATH)/*.jpg)

# Find figures and bibliography
PANDOC_FLAGS += --resource-path=$(RESOURCE_PATH)

# Use pandoc filter for including source code
PANDOC_FLAGS += --filter pandoc-include-code

# Paper input files:
PAPER_SRCS = $(wildcard $(DOC_DIR)/paper/part-*.md) \
             $(wildcard $(DOC_DIR)/paper/references.md)

# Add flags to pandoc it template is to be used
ifneq ($(strip $(TEMPLATE)), )
  PANDOC_FLAGS += --template=$(TEMPLATE)
endif

# Add flags to pandoc if a bibliography is to be used
ifneq ($(strip $(BIBLIOGRAPHY)), )
  PANDOC_FLAGS += -C --bibliography=$(BIBLIOGRAPHY)
endif

# Command to run pandoc
BUILDER ?= pandoc

# Default targets to build
all: paper.pdf

.PHONY: all clean list-srcs fix-spelling check-spelling

list-srcs:
	@echo $(PAPER_SRCS)

paper.docx paper.pdf: $(PAPER_SRCS) $(TEMPLATE_PATH) $(BIBLIOGRAPHY_PATH) $(IMAGES)
	$(BUILDER) $(PANDOC_FLAGS) -o $@ $(PAPER_SRCS)

clean:
	rm -rf *.pdf

# Spell checking, requires codespell. Install with pip3 or homebrew
fix-spelling:
	codespell --ignore-words our-dictionary.txt --write-changes --interactive 3 doc/paper

check-spelling:
	codespell --ignore-words our-dictionary.txt --count doc/paper

aspell-check:
	for f in $(PAPER_SRCS) ; do \
	  aspell --mode=markdown --run-together --run-together-limit=2 --camel-case check $$f ; \
	done
