#!/usr/bin/env python3

import requests
import base64
import time
import configparser
import datetime
import os

api_key_location = "~/.wakatime.cfg"
api_url = "https://wakatime.com/api/v1"
msg_format = "%Hh %Mm"
delay = 5

api_key_location = os.path.abspath(
    os.path.expanduser(
        os.path.expandvars(
            api_key_location
        )
    )
)

config = configparser.ConfigParser()
assert len(config.read(api_key_location)) == 1
raw_api_key = config["settings"]["api_key"]

authorization = "Basic " + base64.b64encode(
    raw_api_key.encode("ascii")).decode("ascii")

while True:
    try:
        # Not using status bar because this one updates faster
        r = requests.get(
            f"{api_url}/users/current/summaries?range=Today",
            headers={"Authorization": authorization},
        )

        if r.status_code != 200:
            raise "Invalid status code"

        body = r.json()

        total_seconds = body["cumulative_total"]["seconds"]
        total_minutes = total_seconds / 60
        total_hours = total_minutes / 60

        print(
            datetime.time(
                int(total_hours),
                int(total_minutes) % 60,
                int(total_seconds) % 60,
            ).strftime(msg_format).strip(),
            flush=True
        )
    except:
        print("no data", flush=True)

    time.sleep(delay)
