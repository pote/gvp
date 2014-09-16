## Go Versioning Packager [![Build Status](https://travis-ci.org/pote/gvp.png?branch=master)](https://travis-ci.org/pote/gvp)

gvp stands for Go Versioning Packager and is based on [gst](http://github.com/tonchis/gst), a similar tool that provides dependency isolation for Ruby gems.

The tool modifies your `GOPATH` to point to a local `.godeps/` directory so that you can keep the dependencies of your project isolated there, it also modifies `GOBIN` and `PATH` to include the new `GOPATH/bin` directory.

gvp is a companion tool to [gpm](http://github.com/pote/gpm) but both tools can be used independently from each other.

#### Example usage: Go Dependency Management and Vendoring with [gpm](https://github.com/pote/gpm) + gvp:

![gpm + gvp usage](https://raw.github.com/pote/gpm/master/gpm_install.gif)


### Install via Homebrew

```bash
$ brew install gvp
```

### Install in *nix

```bash
$ git clone https://github.com/pote/gvp.git && cd gvp
$ git checkout v0.1.0 # You can ignore this part if you want to install HEAD.
$ ./configure
$ make install
```

### Usage

Since `gvp` is a script and runs in a child environment of your shell, the latter will not take the env changes unless you `source` them.

```shell
$ source gvp
```

### Commands

```shell
source gvp    Modifies GOPATH, GOBIN and PATH to use the .godeps directory.
gvp version   Outputs version information.
gvp help      Prints this message.
```

### PLugins

As of [v0.1.0](https://github.com/pote/gvp/releases/tag/v0.1.0) gvp includes a plugin system very much similar to [the one in gpm](https://github.com/pote/gpm#plugins).

The way gvp plugin work is simple: whenever an unknown command is passed into gvp it will look for an executable in your $PATH called gvp-<command> and if it exists it will run it while passing all extra arguments to it, simple yet powerful.

This brings a lot to the table: plugins can be written in anything, they can be Go binaries, bash scripts, Ruby gems, Python packages, you name it. gvp wants to make it easy for you to extend it. :)

If you happen to write a plugin for gvp: please open [an issue](https://github.com/pote/gvp) so we can compile a list of useful plugins as well as add them to the [gpm homebrew tap](https://github.com/pote/homebrew-gpm_plugins) so users can install them easily.

### Why?

Dependencies of multiple Go projects are by far easier to handle in isolation, using plain [gpm](http://github.com/pote/gpm)
to handle your dependencies means that you are forced to run it again every time you work on a new project, this can get old
quickly.

Using `gvp` can greatly simplify your workflow, by isolating your Go project dependencies you only need to run `source gvp in`
in order to be back in the work environment of your application, this means that there will never be Go packages installed in
your system which will conflict in versioning across your different projects.

If for some reason you need to ship your repository with its dependencies included this is also of help, but including a
`Godeps` file to use with gpm will probably be your best option.
