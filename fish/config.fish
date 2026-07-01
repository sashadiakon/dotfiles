source /usr/share/cachyos-fish-config/cachyos-config.fish

function fish_user_key_bindings
    bind \e\[A history-prefix-search-backward
    bind \e\[B history-prefix-search-forward
    bind \eOA history-prefix-search-backward
    bind \eOB history-prefix-search-forward
end
