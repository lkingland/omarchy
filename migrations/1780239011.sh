echo "Wire hugr @hugr_state per-window glyph into tmux status; retire hugr-notify clear-on-focus hooks"

# Hugr/13 (https://github.com/lkingland/hugr — Issue #13): the agent-state
# indicator moved off the pane-keyed file store and onto a per-window tmux
# option (@hugr_state) pushed live by the notifier. Inject the option into
# both window-status formats so the glyph renders, and drop the now-unused
# clear-on-focus hooks.

if [[ -f ~/.config/tmux/tmux.conf ]]; then
  TMUX_CONF=~/.config/tmux/tmux.conf

  # Inject #{?#{@hugr_state}, #{@hugr_state},} after #W in both formats,
  # idempotently (skip if @hugr_state already referenced).
  if ! grep -q '@hugr_state' "$TMUX_CONF"; then
    sed -i \
      -e '/^set -g window-status-format/ s|#I #W |#I #W#{?#{@hugr_state}, #{@hugr_state},} |' \
      -e '/^set -g window-status-current-format/ s|#I #W#{?window_zoomed_flag|#I #W#{?#{@hugr_state}, #{@hugr_state},}#{?window_zoomed_flag|' \
      "$TMUX_CONF"
  fi

  # Remove the auto-clear set-hook lines (live state self-prunes; nothing
  # to clear). Match both indented and bare forms.
  sed -i \
    -e '/^# Auto-clear notifications when focusing a pane$/d' \
    -e "/^set-hook -g client-session-changed .*hugr-notify clear/d" \
    -e "/^set-hook -g session-window-changed .*hugr-notify clear/d" \
    "$TMUX_CONF"

  # Unset the hooks on the running server too (sed only edits the file).
  if command -v tmux >/dev/null && tmux info >/dev/null 2>&1; then
    tmux set-hook -gu client-session-changed 2>/dev/null || true
    tmux set-hook -gu session-window-changed 2>/dev/null || true
    tmux source-file "$TMUX_CONF" 2>/dev/null || true
  fi
fi
