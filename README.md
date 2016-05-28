# Ack Bash Completion

Experimental tab completion for [ack](http://beyondgrep.com/), the CLI tool going beyond grep.

## Usage

This completion script, reads your `$HOME/.ackrc` files and offers tab completions for your custom types.

```
$ ack <tab>
--yourcustomtype
```

An example `ackrc` based on [my TIL](https://github.com/jonasbn/til/blob/master/ack/define_a_custom_search_filetype_scope.md)

```
--type-set=mojo=.css,.pl,.pm,.html,.js,.tt,.ep,.conf
--type-set=conf=.conf
```

Would work as follows:

```
$ ack <tab>
--mojo --conf
```

That is all this `bash` tab completion does for now.

## Installation

```bash
$ curl https://raw.githubusercontent.com/jonasbn/bash_completion_ack/master/ack > ack
```

Where your completions are located might vary:

Based on [an introduction](https://debian-administration.org/article/316/An_introduction_to_bash_completion_part_1) to `bash` completions on Debian.

```bash
$ sudo cp ack /etc/bash_completion.d/
```

This is not a part of [the completions](https://github.com/Homebrew/homebrew-completions) available under `brew` on OSX. But you can copy the `ack` file to the same directory:

```bash
$ cp ack /usr/local/etc/bash_completion.d/
```

And to activate right away:

```bash
$ . /usr/local/etc/bash_completion.d/ack
```

## Motivation

The programmatic capabilities discovered while implementing my first `bash` completions intriqued me. This is a highly experimental feature, which nevertheless was lots of fun to implement.

## See Also

A more elaborate piece of documentation on `bash` completions is available from **The Linux Documentation Project** in the [Advanced Bash-Scripting Guide](http://tldp.org/LDP/abs/html/tabexpansion.html).

Good two-part article, "An Introduction to Bash Completion": [Part 1](https://debian-administration.org/article/316/An_introduction_to_bash_completion_part_1) and [Part 2](https://debian-administration.org/article/317/An_introduction_to_bash_completion_part_2).

## License

This is made available under the MIT license, see separate license file.

## Copyright 

:copyright: jonasbn 2016
