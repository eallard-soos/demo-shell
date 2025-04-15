# *SOOS Demo Shell*
<img src="https://github.com/eallard-soos/demo-shell/blob/main/demo-shell-logo.webp?raw=true" alt="Demo Shell Logo" width="400"/>

Used for invoking SOOS scripts during app demos.

# **Sample Alias**

# add to your .bashrc/.zshrc
alias start-demo='docker run -it --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /absolute/path/on/host:/usr/src/app/exports \
  demo-shell'