# Build ACM SIGPLAN Fortran Forum paper PDF file from Markdown file with embedded LaTeX statements

DOC_DIR := doc # Directory for paper source
DOC_DIR := $(strip $(DOC_DIR))

RESOURCE_PATH := $(DOC_DIR)/resources
BIBLIOGRAPHY := bibliography.bib
BIBLIOGRAPHY_PATH := $(RESOURCE_PATH)/$(BIBLIOGRAPHY)
IMAGES ?= $(wildcard $(RESOURCE_PATH)/*.png) $(wildcard $(RESOURCE_PATH)/*.jpg)

# Turn on table of contents
PANDOC_FLAGS += --toc --resource-path=$(RESOURCE_PATH)

# Paper input files:
TP_SRCS = $(wildcard $(DOC_DIR)/paper/part-*.md) \
          $(wildcard $(DOC_DIR)/paper/references.md)

# Add flags to pandoc if a bibliography and/or template is to be used
ifneq ($(strip $(BIBLIOGRAPHY)), )
  PANDOC_FLAGS += -C --bibliography=$(BIBLIOGRAPHY)
endif

# Command to run pandoc
BUILDER ?= pandoc

# Default targets to build
all: paper.pdf

.PHONY: all clean list-srcs fix-spelling check-spelling

list-srcs:
	@echo $(TP_SRCS)

paper.docx paper.pdf: $(TP_SRCS) $(BIBLIOGRAPHY_PATH) $(IMAGES)
	$(BUILDER) $(PANDOC_FLAGS) -o $@ $(TP_SRCS)

clean:
	rm -rf *.pdf

# Spell checking, requires codespell. Install with pip3 or homebrew
fix-spelling:
	codespell --ignore-words our-dictionary.txt --write-changes --interactive 3 --skip .gitignore,bibliography.bib --check-hidden .

check-spelling:
	codespell --ignore-words our-dictionary.txt --skip .gitignore,bibliography.bib --check-hidden --count .

aspell-check:
	for f in $(TP_SRCS) ; do \
	  aspell --mode=markdown --run-together --run-together-limit=2 --camel-case check $$f ; \
	done
