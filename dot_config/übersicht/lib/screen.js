import { styled, run } from "uebersicht";

import * as Theme from "./theme";

const NAMED_SPACES = [
  "Work",
  "Browse",
  "Music",
  "Misc",
  "Helper 1",
  "Helper 2",
  "Helper 3",
  "Helper 4",
];

const YABAI_COMMAND = "/opt/homebrew/bin/yabai";

const messageYabai = (command) =>
  run(`${YABAI_COMMAND} -m ${command}`).then(JSON.parse);
const queryYabai = (command) =>
  run(`${YABAI_COMMAND} -m query ${command}`).then(JSON.parse);

function getSpaces(displayIndex) {
  return queryYabai(`--spaces --display ${displayIndex}`).then((result) => {
    return result.filter((space) => {
      return space["is-native-fullscreen"] === false;
    });
  });
}

export async function getScreensAndSpaces() {
  const result = await queryYabai(`--displays`);
  const currentScreenWidth = window.screen.width;
  const currentScreenHeight = window.screen.height;

  const screen = result.find((yabaiDisplay) => {
    return (
      yabaiDisplay.frame.w === currentScreenWidth &&
      yabaiDisplay.frame.h === currentScreenHeight
    );
  });

  const spaces = await getSpaces(screen.index);

  return {
    index: screen.index,
    hasFocus: screen["has-focus"] ?? null,
    spaces: spaces.map((space) => {
      return {
        index: space.index,
        isVisible: space["is-visible"],
        hasFocus: space["has-focus"],
      };
    }),
  };
}

const Root = styled("div")`
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  gap: 4px;
`;

const Separator = styled("span")``;

const SpaceContainer = styled("div")`
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  gap: 4px;
`;

const SpaceLabel = styled("p")`
  color: ${({ hasFocus, isVisible }) =>
    hasFocus
      ? "white"
      : isVisible
        ? Theme.FOREGROUND_COLOR
        : Theme.FOREGROUND_2_COLOR};
  font-weight: ${({ hasFocus }) => (hasFocus ? "bold" : "normal")};
  font-size: ${Theme.FONT_SIZE};
  padding: 4px 8px !important;
  border-radius: 4px;
  background-color: ${({ isVisible }) =>
    isVisible ? Theme.ACCENT_COLOR : "transparent"};
  cursor: pointer;
`;

function Space({ space }) {
  const goToSpace = () => {
    messageYabai(`space --focus ${space.index}`);
  };

  return (
    <SpaceLabel
      hasFocus={space.hasFocus}
      isVisible={space.isVisible}
      onClick={goToSpace}
    >
      {NAMED_SPACES[space.index - 1]}
    </SpaceLabel>
  );
}

export function SpacesWidget({ screen }) {
  const spaces = screen.spaces.slice(0, 4);

  return (
    <Root>
      {spaces.map((space, index) => (
        <SpaceContainer key={space.index}>
          <Space space={space} />
          {index !== spaces.length - 1 && <Separator>|</Separator>}
        </SpaceContainer>
      ))}
    </Root>
  );
}
