function startWindows10() {
  wmctrl -s 9
  virsh start win10
  virt-viewer -f -w -a win10 &
}

function stopWindows10() {
  virsh destroy win10
  killall virt-viewer
}
