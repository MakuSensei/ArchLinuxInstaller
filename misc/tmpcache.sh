ln -sf /tmp $HOME/.cache
chown -h root $HOME/.cache

ln -sf /tmp $HOME/.thumbnails
chown -h root $HOME/.thumbnails

mkdir -p $HOME/.local/share
ln -sf /tmp $HOME/.local/share/gvfs-metadata
chown -h root $HOME/.local/share/gvfs-metadata