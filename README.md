## gvp - Go Versioning Packager

gvp stands for Go Vendoring Packager and is based on [gst](http://github.com/tonchis/gst), a similar tool that provides vendoring functionality for Ruby gems.

The tool modifies your GOPATH to point to a local `.godeps/` directory so that you can keep the dependencies of your project isolated there, it also modifies `GOBIN` and `PATH` to include the new `GOPATH/bin` directory.

gvp is a companion tool to [gpm](http://github.com/pote/gpm) the Go Package Manager.

### Usage

Since `gvp` is a script and runs in a child environment of your shell, the latter will not take the env changes unless you `source` them.

```shell
$ gvp init
$ source gvp in
$ source gvp out
```

### Commands

```shell
init    Creates the .godeps directory
in      Modifies GOPATH, GOBIN and PATH to use the .godeps
out     Restores the previous GOPATH, GOBIN and PATH.
version   outputs version information.
help      prints this message.
```

### Why?

Dependencies of multiple Go projects are by far easier to handle in isolation, using plain [gpm](http://github.com/pote/gpm)
to handle your dependencies means that you are forced to run it again every time you work on a new project, this can get old
quickly.

Using `gvp` can greatly simplify your workflow, by isolating your Go project dependencies you only need to run `source gvp in`
in order to be back in the work environment of your application, this means that there will never be Go packages installed in
your system which will conflict in versioning across your different projects.

If for some reason you need to ship your repository with its dependencies included this is also of help, but including a
`Godeps` file to use with gpm will probably be your best option.
