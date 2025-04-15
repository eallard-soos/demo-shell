# *SOOS Demo Shell*
<img src="https://github.com/eallard-soos/demo-shell/blob/main/demo-shell-logo.webp?raw=true" alt="Demo Shell Logo" width="400"/>

Used for launching a container with all SOOS apps installed.

The latest version of each app will be pulled, and a tag of the previous version will be made on your host, so if there are issues you have a working version you can roll back to.

For convenience, add the following to your .bashrc/.zshrc
``` bash
alias start-demo='docker run -it --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /absolute/path/on/host:/usr/src/app/exports \
  demo-shell'