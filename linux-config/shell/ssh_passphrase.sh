ssh_key_path="$HOME/.ssh/id_ed25519"
if command -v keychain > /dev/null && [ -f "$ssh_key_path" ]; then
  eval "$(keychain --eval --agents ssh "$ssh_key_path")"
fi 
