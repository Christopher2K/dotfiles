import { run } from "uebersicht";

export function isStreamerModeEnabled() {
  return run(
    'if [ -f "$HOME/.stream_mode" ]; then echo "true"; else echo "false"; fi',
  ).then((result) => {
    return result.trim() === "true";
  });
}
