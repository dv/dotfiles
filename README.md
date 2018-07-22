# David does dotfiles, too

Forked from "holman does dotfiles", these are my personal dotfiles.

## Changes from "holman does dotfiles"

* Move `script/` files into root directory, a place I feel is better suited for the metaness of these scripts
* `script/bootstrap` also symlinks files starting with "." into $HOME as well as files ending with ".symlink".
  This way I can keep the original name of the files, enabling proper syntax highlighting.

# Highlights

## Rails

### `rg model user`

Rails generator which opens all generated files in Sublime.

## Tmux

### `run_in_all_naked_panes command`

Runs the command in all panes in Tmux, that are not currently running a process (except for a shell).

### `tclear`

Clears all panes in Tmux except for the ones running a process (except for a shell)

## Ansible

Ansible's default directory structure is too verbose to my liking. I built a custom homebrew formula to integrate the patch sourced from [here](https://groups.google.com/forum/#!searchin/ansible-devel/directory%2420structure%7Csort:date/ansible-devel/BfHRSzsq9d0/cfXi5oxHAQAJ) to allow files with the directory-name instead.

Before:

```
roles/dnsmasq/
├── defaults
│   └── main.yml
├── handlers
│   └── main.yml
├── meta
│   └── main.yml
├── tasks
│   └── main.yml
└── templates
    ├── dns.conf.j2
    ├── logrotate.j2
    └── supervisord.j2
```

After:
```
roles/dnsmasq/
├── defaults.yml
├── handlers.yml
├── meta.yml
├── tasks.yml
└── templates
    ├── dns.conf.j2
    ├── logrotate.j2
    └── supervisord.j2
```

## Install

Run this:

```sh
git clone https://github.com/dv/dotfiles.git ~/poetry/dotfiles
cd ~/poetry/dotfiles
./bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets sane OS X
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## Topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything that starts with a dot, or has an extension
of `.symlink` will get symlinked without extension into `$HOME` when you run
`script/bootstrap`.

## Components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.
