#Notes#

In general:

-  make sure your public key is added to github
-  In the host's repo-root run `vagrant ssh-config` and compare to host's `~/.ssh/config`.
   If needed append by `vagrant ssh-config >> ~/.ssh/config`

OSX specific:

-  run `ssh-add -L` to see if your private key is added. If not, run `ssh-add -K ~/.ssh/id_rsa`
