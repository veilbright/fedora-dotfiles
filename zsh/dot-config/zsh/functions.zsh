mdpreview() {
  local css="${XDG_CONFIG_HOME:-$HOME/.config}/zsh/style.css"
  local file=$(mktemp)
  {
    echo "<html><head><style>"
    cat "$css"
    echo "</style></head><body><div class=markdown-body>"
    kramdown "$1"
    echo "</div></body></html>"
  } > "$file" && firefox "$file"
}
