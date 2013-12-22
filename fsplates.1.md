fsplates(1) -- easy file system templates
=========================================

## Synopsis

`fsplates [-fhV] <template> [destination=$PWD]`

## Options

    -f, --force    write over any existing files
    -h, --help     show this help message
    -V, --version  print version number

## Examples

simple one file

`$ fsplate Makefile`

use a file that is within a template

`$ fsplate component/Makefile`

control target directory

`$ fsplate component ./target`

## About

Templates are just normal files and directories. By default fsplates searches within `~/.fsplates` for a the template you call. It will then walk through each file in the template (if its a directory) and replace variables with values. variables are denoted by double mustaches `{{var here}}`. values are looked up within `~/.fsplates/.config.json`. Any values not found will be prompted for. The resulting Files are written to the working directory unless you specify a `destination`. Don't worry about files being overwritten, fsplates, will prompt before doing anything dangerous. File paths can also contain mustaches. Check out the projects [templates](templates) directory for example templates.

## see also

- [visionmedia/ngen](https://github.com/visionmedia/ngen)
- [bit101/STProjectMaker](https://github.com/bit101/STProjectMaker)