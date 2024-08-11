import { styled, run } from "uebersicht";

import * as Theme from "./theme";

const NAMED_SPACES = {
  1: "1",
  2: "2",
  3: "3",
  4: "4",
  5: "5",
  6: "6",
  7: "7",
  8: "8",
  M: "M",
};

const AEROSPACE_COMMAND = "/opt/homebrew/bin/aerospace";

const queryAerospace = (command) => run(`${AEROSPACE_COMMAND} ${command}`);

export async function getScreensAndSpaces() {
  const currentBarMonitorIndex =
    (await run(`system_profiler SPDisplaysDataType -json`)
      .then(JSON.parse)
      .then((result) =>
        result.SPDisplaysDataType[0].spdisplays_ndrvs.findIndex((display) => {
          const [width, height] = display._spdisplays_resolution
            .split(" @ ")
            .at(0)
            .split(" x ");

          return (
            +width === window.screen.width && +height === window.screen.height
          );
        }),
      )) + 1;

  const monitorFocusedResult = await queryAerospace("list-monitors --focused");
  const monitorFocusedId = +monitorFocusedResult
    .split("\n")
    .at(0)
    .trim()
    .split(" | ")
    .at(0);

  const focusedSpaceResult = await queryAerospace("list-workspaces --focused");
  const focusedSpaceId = focusedSpaceResult.split("\n").at(0).trim();

  const spacesResult = await queryAerospace(
    `list-workspaces --monitor ${currentBarMonitorIndex}`,
  );
  const spaces = spacesResult
    .trim()
    .split("\n")
    .map((line, index) => {
      const id = line.trim();
      return {
        id,
        index: index + 1,
        name: NAMED_SPACES[index],
        hasFocus: id === focusedSpaceId,
      };
    });

  return {
    index: currentBarMonitorIndex,
    hasFocus: currentBarMonitorIndex === monitorFocusedId,
    spaces,
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
  function goToSpace() {
    queryAerospace(`workspace ${space.id.toString()}`);
  }

  return (
    <SpaceLabel
      hasFocus={space.hasFocus}
      isVisible={space.isVisible}
      onClick={goToSpace}
    >
      {NAMED_SPACES[space.id]}
    </SpaceLabel>
  );
}

export function SpacesWidget({ screen }) {
  return (
    <Root>
      {screen.spaces.map((space, index) => (
        <SpaceContainer key={space.index}>
          <Space space={space} />
          {index !== screen.spaces.length - 1 && <Separator>|</Separator>}
        </SpaceContainer>
      ))}
    </Root>
  );
}
