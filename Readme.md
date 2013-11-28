
# fs-plates

  a cli tool for rendering project boilerplate

## Installation

With [node](http://nodejs.org/download) installed:

```sh
$ npm install --global fs-plates
```

## Usage

To create a new component project run:

```sh
fsplate component my_project
cd myproject
```

This will create the directory `my_project` if it doesn't already exist and render the [component](//github.com/jkroso/fs-plates/tree/master/templates/component) template in it.

It can also render singular files which is handy for adding things like licenses to your projects:

```sh
fsplate License
```

## Templates

Templates are just normal files and directories. By default fsplates searches within `~/.fsplates` for a the template you call. It will then walk through each file in the template (if its a directory) and replace variables with values. variables are denoted by double mustaches `{{var here}}`. values are looked up within `~/.fsplates/.config.json`. Any values not found will be prompted for. The resulting Files are written to the working directory though you can specify a target. Don't worry about files being overwritten, fsplates, will prompt before doing anything dangerous. File paths can also contain mustaches. Check out the `./dots` directory for example templates.

## prior art

- [visionmedia/ngen](https://github.com/visionmedia/ngen)
- [bit101/STProjectMaker](https://github.com/bit101/STProjectMaker)

## License

[MIT](License)
