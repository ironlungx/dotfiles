import os
import requests
import sys
from datetime import datetime, timedelta

sunrise_icon = ''
sunset_icon = ''

def unix_to_hm(unix_time: int) -> str:
    dt = datetime.fromtimestamp(unix_time)
    return dt.strftime("%I:%M")

wmo_weather_codes = {
    0: ("", ""),
    1: ("", ""),
    2: ("", ""),
    3: ("", ""),
    45: ("", ""),
    48: ("", ""),
    51: ("", ""),
    53: ("", ""),
    55: ("", ""),
    61: ("", ""),
    63: ("", ""),
    65: ("", ""),
    71: ("", ""),
    73: ("", ""),
    75: ("", ""),
    77: ("", ""),
    80: ("", ""),
    81: ("", ""),
    82: ("", ""),
    85: ("", ""),
    86: ("", ""),
    95: ("", ""),
    96: ("", ""),
    99: ("", ""),
}


def get_weather( latitude: str, longitude: str, font_index: int, color_day: str, color_night: str,) -> str:
    url = f"https://api.open-meteo.com/v1/forecast?latitude={latitude}&longitude={longitude}&current=temperature_2m,weather_code,is_day&forecast_days=1&daily=sunrise,sunset&timezone=GMT&timeformat=unixtime"
    data = requests.get(url).json()

    temperature = data["current"]["temperature_2m"]

    icon = ""

    if data["current"]["is_day"]:
        weather_code: int = data["current"]["weather_code"]
        icon = wmo_weather_codes[weather_code][0]
        return f"%{{F{color_day}}}%{{T{font_index}}}{icon} %{{T-}}%{{F-}} {temperature}{data['current_units']['temperature_2m']}"
    else:
        weather_code: int = data["current"]["weather_code"]
        icon = wmo_weather_codes[weather_code][1]

        return f"%{{F{color_night}}}%{{T{font_index}}}{icon} %{{T-}}%{{F-}} {temperature}{data['current_units']['temperature_2m']}"


def sun_time(latitude: str, longitude: str, color: str) -> str:
    url = f"https://api.open-meteo.com/v1/forecast?latitude={latitude}&longitude={longitude}&current=temperature_2m,weather_code,is_day&forecast_days=1&daily=sunrise,sunset&timezone=GMT&timeformat=unixtime"

    data = requests.get(url).json()
    sunrise = unix_to_hm(data['daily']['sunrise'][0])
    sunset = unix_to_hm(data['daily']['sunset'][0])
    

    return f"\033[0;33m{sunrise_icon}\033[0m {sunrise}   \033[0;34m{sunset_icon}\033[0m {sunset}"


with open(os.path.expanduser("~/location"), "r") as f:
    ls = f.read().split()

if len(sys.argv) < 3:
    print(f"Usage {sys.argv[0]} colorDay colorNight fontIndex")
    print("\t -d Run in daemon mode, print sunset, sunrise; all in a loop")
    exit()

if "-d" in sys.argv:
    print(sun_time(ls[0], ls[1], sys.argv[1]))
    try:
        while True:
            pass
    except KeyboardInterrupt:
        exit()


x = get_weather(ls[0], ls[1], int(sys.argv[3]), sys.argv[1], sys.argv[2])
print(x)
