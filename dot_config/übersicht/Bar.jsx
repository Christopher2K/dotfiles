import { styled, run } from "uebersicht";
import { format } from "date-fns";
import { fr } from "date-fns/locale";

import * as Battery from "./lib/battery";
import * as Screen from "./lib/screen";
import * as Theme from "./lib/theme";
import * as Stream from "./lib/stream";

const Root = styled("div")`
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: ${({ isStreamerMode }) =>
    isStreamerMode ? "flex-start" : "center"};
  background-color: ${Theme.BACKGROUND_COLOR};
  height: ${({ isStreamerMode }) =>
    isStreamerMode ? "70px" : Theme.BAR_HEIGHT};
  opacity: ${({ isFocused }) => (isFocused ? "1" : "0.5")};
  width: ${({ isStreamerMode }) => (isStreamerMode ? "1895px" : "100%")};
`;

const Content = styled("div")`
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  height: fit-content;
  padding: ${({ isStreamerMode }) => (isStreamerMode ? "12px 40px" : "0 20px")};
  flex: 1;
`;

const Label = styled("p")`
  display: flex;
  flex-direction: row;
  justify-content: start;
  align-items: center;
  gap: 4px;
  padding: 4px 6px;
  font-weight: bold;
  color: ${Theme.FOREGROUND_COLOR};
  border-radius: 5px;
  font-size: ${Theme.FONT_SIZE};
  background-color: ${({ color }) => color ?? "transparent"};
`;

const FontIcon = styled("span")`
  font-size: ${Theme.FONT_SIZE};
  line-height: 22px;
  color: ${Theme.FOREGROUND_2_COLOR};
`;

const WidgetRightContainer = styled("div")`
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: 4px;
`;

const WidgetLeftContainer = styled("div")`
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: 20px;
`;

// DATA

// COMMAND EXPORTS
export const refreshFrequency = 1000;

export const initialState = {
  date: format(new Date(), "PPPP"),
  time: format(new Date(), "p", { locale: fr }),
  batteryPercentage: 0,
  charging: false,
  screen: null,
  streamerMode: false,
};

export const updateState = (event, previousState) => {
  switch (event.type) {
    case "UPDATE_DATE":
    case "UPDATE_BATTERY":
    case "UPDATE_SCREEN":
    case "UPDATE_STREAMER_MODE":
      return { ...previousState, ...event.payload };
    default:
      return previousState;
  }
};

export const command = (dispatch) => {
  const date = new Date();

  Screen.getScreensAndSpaces().then((result) => {
    dispatch({
      type: "UPDATE_SCREEN",
      payload: { screen: result },
    });
  });

  Stream.isStreamerModeEnabled().then((result) => {
    dispatch({
      type: "UPDATE_STREAMER_MODE",
      payload: { streamerMode: result },
    });
  });

  dispatch({
    type: "UPDATE_DATE",
    payload: {
      date: format(date, "PPPP"),
      time: format(date, "p", { locale: fr }),
    },
  });

  run(`pmset -g batt | grep -Eo "\\d+%" | cut -d% -f1`)
    .then((result) => {
      dispatch({
        type: "UPDATE_BATTERY",
        payload: {
          batteryPercentage: +result,
        },
      });
    })
    .catch(console.error);

  run("pmset -g batt | grep 'AC Power'")
    .then((result) => {
      dispatch({
        type: "UPDATE_BATTERY",
        payload: {
          charging: result !== "",
        },
      });
    })
    .catch(console.error);
};

export const className = `
  box-sizing: border-box;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  font-family: 'FantasqueSansM Nerd Font';
  width: 100%;
  border-radius: 0px;
  font-size: ${Theme.FONT_SIZE};
  box-sizing: border-box;

  padding: 0;
  margin: 0;
  left: 0;
  bottom: 0;

  p { margin: 0; padding: 0; }
`;

export const render = ({
  time,
  date,
  batteryPercentage,
  charging,
  screen,
  streamerMode,
}) => {
  const isStreamerMode = streamerMode && screen?.index === 1;

  return (
    <Root isFocused={screen?.hasFocus} isStreamerMode={isStreamerMode}>
      <Content isStreamerMode={isStreamerMode}>
        <WidgetLeftContainer>
          {screen && <Screen.SpacesWidget screen={screen} />}
        </WidgetLeftContainer>
        <WidgetRightContainer>
          <Label color="">
            <FontIcon>
              {Battery.renderBattery({ batteryPercentage, charging })}
            </FontIcon>
            <span>{batteryPercentage}%</span>
          </Label>
          |<Label>{date}</Label>|<Label color="">{time}</Label>
        </WidgetRightContainer>
      </Content>
    </Root>
  );
};
