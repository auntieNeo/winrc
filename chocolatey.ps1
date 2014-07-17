# install chocolatey if we can't find it
If(-Not (Get-Command chocolatey).count -gt 0) {
  iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
}
If(-Not (Get-Command chocolatey).count -gt 0) {
  # TODO: output an error
  exit
}

# install software with chocolatey
filter InstallSoftware{&chocolatey @("install", $_)}
$cygwinSoftware = @(
    "vim",
    "tmux"
)
$software = @(
    "autohotkey",
    "cmake",
    @("cyg-get", $cygwinSoftware),
    "Firefox",
    "git",
    "GoogleChrome",
    "mingw",
    "mpc-hc",
    "putty",
    "sysinternals",
    "vagrant",
    "vim",
    "virtualbox",
#    @("VisualStudio2013Professional", "-InstallArguments", "/Features:'WebTools Win8SDK'"),
    "VisualStudio2013Professional",
    "vlc"
)
$software | InstallSoftware
