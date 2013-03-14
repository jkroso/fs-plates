
# fs-plates

  a cli tool for rendering project boilerplate

## install

With node previously installed:

```bash
$ npm install -g fsplates
```

With node binary on OSX:

```bash
$ (cd /usr/local && \
   curl -L# http://nodejs.org/dist/v0.8.22/node-v0.8.22-darwin-x86.tar.gz \
   | tar -zx --strip 1) \
  && npm install -g fsplates \
  && printf "installed fsplates(1) %s\n" $(fsplates --version)
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

MIT

Copyright (c) 2013 Jake Rosoman &lt;jkroso@gmail.com&gt;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.