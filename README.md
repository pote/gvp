GST
===

TL;DR
-----
`gst` is a gemset manager inspired by [gs](http://github.com/soveran/gs).
The difference is that it stays in the same shell and just modifies gem env variables.
To be compatible with `gs`, it uses a `.gs` directory and sets the `GS_NAME` variable.

USAGE
-----
Since `gst` is a script and runs in a child environment of your shell, the latter will not take the env changes unless you `source` them.

```shell
$ gst init
$ source gst in
$ source gst out
```

COMMANDS
--------

```shell
init    Creates the .gs directory
in      Modifies GEM_HOME, GEM_PATH and PATH to use the .gs directory and sets the GS_NAME variable.
out     Restores the previous GEM_HOME, GEM_PATH and PATH. Also unsets GS_NAME.
```

WHY?
----

As I was using `gs` I noticed it wouldn't play well with `chruby`. The issue was collision between the way `gs` works, by modifying the `gem` env variables and firing up a new shell with them, and the fact that `chruby` also sets those variables when using the `autoload` script or the `chruby` command. The last one being in my `.zshrc` script, it was stepping over `gs`'s work.

Thus I decided to write my own gemset manager that doesn't run a new shell, but uses the current one.

