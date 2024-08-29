#!/bin/bash

cp /trackmania_config/dedicated_cfg.txt /trackmania/TMServer/GameData/Config/dedicated_cfg.txt
./TrackmaniaServer /game_settings=MatchSettings/Nations/NationsBlue.txt /dedicated_cfg=dedicated_cfg.txt

if [ -d "/trackmania/xaseco" ]; then
    cp /trackmania_config/*.xml /trackmania/xaseco/
    cp /trackmania_config/*.php /trackmania/xaseco/plugins

    cd /trackmania/xaseco
    php aseco.php
fi

tail -f /dev/null
