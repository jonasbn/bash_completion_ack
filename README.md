# Ack Bash Completion

<!-- markdownlint-disable MD014 -->

Experimental tab completion for [ack](http://beyondgrep.com/), the CLI tool going beyond grep.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Usage

This completion script, reads your `$HOME/.ackrc` files and offers tab completions for your custom types.

```bash
$ ack -<tab>
--yourcustomtype
```

An example `ackrc` based on [my TIL](https://github.com/jonasbn/til/blob/master/ack/define_a_custom_search_filetype_scope.md)

```ini
--type-set=mojo=.css,.pl,.pm,.html,.js,.tt,.ep,.conf
--type-set=conf=.conf
```

Would work as follows:

```bash
$ ack -<tab>
--mojo --conf
```

```bash
$ ack <tab>
.editorconfig                          CONTRIBUTING.md                        bash_completion_ack.code-workspace
.git/                                  LICENSE                                bash_completion_ack.sublime-project
.gitattributes                         README.md                              bash_completion_ack.sublime-workspace
.gitignore                             ack
```

List contents of directory as default for `bash`.

If you _tab_ after your completion has been made the contents of the current directory is displayed:

```bash
$ ack -<tab>
--mojo --conf
$ ack --mojo <tab>
.editorconfig                          CONTRIBUTING.md                        bash_completion_ack.code-workspace
.git/                                  LICENSE                                bash_completion_ack.sublime-project
.gitattributes                         README.md                              bash_completion_ack.sublime-workspace
.gitignore                             ack
```

That is all this `bash` tab completion does for now :-)

## Download

```bash
curl https://raw.githubusercontent.com/jonasbn/bash_completion_ack/master/ack > ack
```

## Installation

When downloaded you have to install the completion implementation. Where your completions are located might vary.

### Personal

If you want to install them for your personal use, do the following.

Create the file: `~/.bash_completion`, containing the code below:

```bash
for bcfile in ~/.bash_completion.d/* ; do
  . $bcfile
done
```

Ref: [ServerFault.com: _Standard place for user defined bash_completion.d scripts?_](https://serverfault.com/questions/506612/standard-place-for-user-defined-bash-completion-d-scripts)

Create a directiory for your completions:

```bash
mkdir ~/.bash_completion.d
```

Copy your completions into the newly created directory:

```bash
cp ack ~/.bash_completion.d/
```

Start a new shell and you should be good to go.

### System-wide example from Debian

Based on [an introduction](https://debian-administration.org/article/316/An_introduction_to_bash_completion_part_1) to `bash` completions on Debian.

```bash
sudo cp ack /etc/bash_completion.d/
```

### System-wide example from OSX

This assumes you are using **Homebrew**

Do note that paths vary based on whether you are using `bash` 3 or 4

#### `bash` 3 (Formula: `bash-completions`)

```bash
cp ack /usr/local/etc/bash_completion.d/
```

And to activate right away:

```bash
source  /usr/local/etc/bash_completion.d/ack
```

#### `bash` 4 (Formula: `bash-completions2`)

```bash
cp ack /usr/local/share/bash-completion/completions/
```

And to activate right away:

```bash
source /usr/local/share/bash-completion/completions/ack
```

## Motivation

The programmatic capabilities discovered while implementing my first `bash` completions intriqued me. This is a highly experimental feature, which nevertheless was lots of fun to implement.

## History

- 2.1.0
  - Minor adjustment to behaviour, post completions, the contents of the current directory is listed

- 2.0.0
  - Initial version working with `bash` version 4.
  - Change to behaviour, `-` have to be entered for detected options to be listed

- 1.0.0
  - Initial version working with `bash` version 3.

## See Also

A more elaborate piece of documentation on `bash` completions is available from **The Linux Documentation Project** in the [Advanced Bash-Scripting Guide](http://tldp.org/LDP/abs/html/tabexpansion.html).

From the [GNU Documentation](https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion.html).

Please note that this experimental implementation has only been tested with `bash` version 3 (see version 1.0.0).

Versions after version 1.0.0 have been tested with `bash` version 4.

The most comprehensive collection of `bash` completions I have come across is [the one](https://github.com/scop/bash-completion) from the **Debian Linux distribution**. It is also the one offered for OSX via **Homebrew**.

## License

This is made available under the MIT license, see separate license file.

## Copyright

:copyright: jonasbn 2016-2022
