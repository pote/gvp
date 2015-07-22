## Go Versioning Packager [![Build Status](https://travis-ci.org/pote/gvp.png?branch=master)](https://travis-ci.org/pote/gvp) [![Support via Gratipay](https://cdn.rawgit.com/gratipay/gratipay-badge/2.3.0/dist/gratipay.svg)](https://gratipay.com/pote/)

gvp stands for Go Versioning Packager and is based on [gst][gst] a similar tool that provides dependency isolation for Ruby gems.

The tool modifies your `GOPATH` to point to a local `.godeps/` directory so that you can keep the dependencies of your project isolated there, it also modifies `GOBIN` and `PATH` to include the new `GOPATH/bin` directory.

gvp is a companion tool to [gpm][gpm] but both tools can be used independently from each other.

#### Example usage: Go Dependency Management and Vendoring with [gpm][gpm] + gvp:

![gpm + gvp usage](https://raw.github.com/pote/gpm/master/gpm_install.gif)

### Installation

#### Install in *nix (preferred method)

```bash
$ git clone https://github.com/pote/gvp.git && cd gvp
$ git checkout v0.2.1 # You can ignore this part if you want to install HEAD.
$ ./configure
$ make install
```

#### Install via Homebrew

```bash
$ brew install gvp
```


### Usage

Since `gvp` is a script and runs in a child environment of your shell, the latter will not take the env changes unless you `source` them.

First,
```shell
$ source gvp
```

After `gvp` has been sourced, these commands are available:
```shell
usage: gvp [COMMAND]

[...]

COMMANDS
    source gvp      Modifies GOPATH and GOBIN to use the .godeps directory.
    gvp version     Outputs version information.
    gvp help        Prints this message.
    gvp in          The function that is called when executing "source gvp"
    gvp out         Return the prompt to normal
```

### Using with [autoenv][autoenv]

Simply run:
```
cd /path/to/project
touch .env
echo "source /path/to/gvp" > .env
```

### Plugins

As of [v0.1.0][v0.1.0] gvp includes a plugin system very much similar to [the one in gpm][gpm-plugins].

The way gvp plugin work is simple: whenever an unknown command is passed into gvp it will look for an executable in your $PATH called gvp-<command> and if it exists it will run it while passing all extra arguments to it, simple yet powerful.

This brings a lot to the table: plugins can be written in anything, they can be Go binaries, bash scripts, Ruby gems, Python packages, you name it. gvp wants to make it easy for you to extend it. :)

If you happen to write a plugin for gvp: please open [an issue][issues] so we can compile a list of useful plugins as well as add them to the [gpm homebrew tap](https://github.com/pote/homebrew-gpm_plugins) so users can install them easily.

### Why?

Dependencies of multiple Go projects are by far easier to handle in isolation, using plain [gpm][gpm]
to handle your dependencies means that you are forced to run it again every time you work on a new project, this can get old
quickly.

Using `gvp` can greatly simplify your workflow, by isolating your Go project dependencies you only need to run `source gvp`
in order to be back in the work environment of your application, this means that there will never be Go packages installed in
your system which will conflict in versioning across your different projects.

If for some reason you need to ship your repository with its dependencies included this is also of help, but including a
`Godeps` file to use with gpm will probably be your best option.

[autoenv]: https://github.com/kennethreitz/autoenv
[v0.1.0]: https://github.com/pote/gvp/releases/tag/v0.1.0
[gpm]: https://github.com/pote/gpm
[gpm-plugins]: https://github.com/pote/gpm#plugins
[gst]: https://github.com/tonchis/gst
[issues]: https://github.com/pote/gvp/issues
