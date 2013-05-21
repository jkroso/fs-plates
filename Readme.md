
# fs-plates

  a cli tool for rendering project boilerplate

## install

With node previously installed:

```bash
$ npm install -g jkroso/fs-plates
```

With node binary on OSX:

```bash
$ (cd /usr/local && \
   curl -L# http://nodejs.org/dist/v0.8.22/node-v0.8.22-darwin-x86.tar.gz \
   | tar -zx --strip 1) \
  && npm install -g jkroso/fs-plates \
  && printf "installed fsplates(1) %s\n" $(fsplate --version)
```

NOTE: tested with node 0.8.x

## usage

```
Usage: fsplate template [target directory]

Options:

  -h, --help           output usage information
  -V, --version        output the version number
  -r, --rename         prompt for name before writing files
  -s, --source [path]  where to look for templates [$HOME/.fsplates]
  -c, --config [path]  data [$HOME/.fsplates/.config.json]


Note: you will be prompted for any values not in `config`
and no files will be overwritten without your confirmation

Examples: 

  # simple one file
  $ fsplate Makefile

  # rename
  $ fsplate -r Readme.md
  Readme.md is available. prefered name: $

  # target a sub-directory
  $ fsplate component my-component
```

## template language

templates are just normal files and directories. By default fsplates searches within `~/.fsplates` for a the template you call. It will then walk through each file in the template (if its a directory) and replace variables with values. variables are denoted by double mustaches `{{var here}}`. values are looked up within `~/.fsplates/.config.json`. Any values not found will be prompted for. The resulting Files are written to the working directory though you can specify a target. Don't worry about files being overwritten, fsplates, will prompt before doing anything dangerous. File paths can also contain mustaches so you can literally put them anywhere! Check out the `./dots` directory for example templates. 

## prior art

- [visionmedia/ngen](https://github.com/visionmedia/ngen)
- [bit101/STProjectMaker](https://github.com/bit101/STProjectMaker)

## License 

[MIT](License)
