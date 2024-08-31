#!/bin/bash

cp /trackmania_config/dedicated_cfg.txt /trackmania/TMServer/GameData/Config/dedicated_cfg.txt
cp /trackmania_config/kg.txt /trackmania/TMServer/GameData/Tracks/MatchSettings/Nations/kg.txt

./TrackmaniaServer /game_settings=MatchSettings/Nations/kg.txt /dedicated_cfg=dedicated_cfg.txt /verbose_rpc_full 

if [ -d "/trackmania/xaseco" ]; then
    cp /trackmania_config/*.xml /trackmania/xaseco/
    cp /trackmania_config/*.php /trackmania/xaseco/plugins

    cd /trackmania/xaseco
    php aseco.php
fi

tail -f /dev/null
