import { styled, run } from "uebersicht";
import format from "date-fns/format";
import fr from "date-fns/locale/fr";

import * as Helpers from "./src/helpers";

// THEME VARIABLES
const BACKGROUND_COLOR = "#1e1e2e";
const HEIGHT = "48px";

const Root = styled("div")`
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
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
  color: ${BACKGROUND_COLOR};
  border-radius: 5px;
  background-color: ${({ color }) => color ?? "transparent"};
`;

const FontIcon = styled("span")`
  font-size: 22px;
  line-height: 22px;
  color: ${BACKGROUND_COLOR};
`;

const WidgetContainer = styled("div")`
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: 20px;
`;

const Text = styled("p")`
  font-weight: bold;
  color: #ffffff;
  font-size: 22px;
`;

// DATA

// COMMAND EXPORTS
export const refreshFrequency = 1000;

export const initialState = {
  date: format(new Date(), "PPPP"),
  time: format(new Date(), "p", { locale: fr }),
  music: "",
  batteryPercentage: 0,
  charging: false,
};

export const updateState = (event, previousState) => {
  switch (event.type) {
    case "UPDATE_MUSIC":
    case "UPDATE_DATE":
    case "UPDATE_BATTERY":
      return { ...previousState, ...event.payload };
    default:
      return previousState;
  }
};

export const command = (dispatch) => {
  const date = new Date();

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

  run(
    `osascript -e 'tell application "Music" to if it is running then get {name, artist} of current track'`
  ).then((result) => {
    dispatch({
      type: "UPDATE_MUSIC",
      payload: {
        music: result,
      },
    });
  });
};

export const className = `
  box-sizing: border-box;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  font-family: 'Hack Nerd Font';
  width: calc(100% - 24px);
  height: ${HEIGHT};
  padding: 0 20px;
  border-radius: 8px;

  left: 12px;
  bottom: 12px;
  background-color: ${BACKGROUND_COLOR};
`;

export const render = ({ time, date, batteryPercentage, charging, music }) => {
  return (
    <Root>
      <div>{music.length > 0 && <Text> : {music}</Text>}</div>

      <WidgetContainer>
        <Label color="#FFF">{date}</Label>
        <Label color="#FFF">{time}</Label>
        <Label color="#FFF">
          <FontIcon>
            {Helpers.renderBattery({ batteryPercentage, charging })}
          </FontIcon>
          <span>{batteryPercentage}%</span>
        </Label>
      </WidgetContainer>
    </Root>
  );
};
