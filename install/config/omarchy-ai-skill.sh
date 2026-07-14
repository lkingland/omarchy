# Place in each assistant's global skills directory so the Omarchy skill is available on first install
mkdir -p ~/.agents/skills ~/.claude/skills ~/.codex/skills ~/.pi/agent/skills
ln -sfn "$OMARCHY_PATH/default/omarchy-skill" ~/.agents/skills/omarchy
# ~/.claude/ deliberately omitted (Hamr fork): the Hamr-owned "dotfiles" skill
# supersedes the upstream omarchy skill for Claude — see Hamr #332. Restore this
# line to re-enable the upstream skill for Claude.
ln -sfn "$OMARCHY_PATH/default/omarchy-skill" ~/.codex/skills/omarchy
ln -sfn "$OMARCHY_PATH/default/omarchy-skill" ~/.pi/agent/skills/omarchy
