cv()
{
  cdargs "$1" && cd "$(cat "$HOME/.cdargsresult")"
}
