# K9s config

The K9s config contains settings that should be committed to Git and infos about (the current) clusters. This is not nice and there are a lot of open issues that complain this: https://github.com/derailed/k9s/search?q=config&type=issues

Because it might not be fixed at all, future changes to the k9s config file are ignored.

See https://stackoverflow.com/questions/4348590/how-can-i-make-git-ignore-future-revisions-to-a-file

```console
git update-index --skip-worktree k9s/config.yml
git update-index --no-skip-worktree k9s/config.yml
```
