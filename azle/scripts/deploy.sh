#!/bin/bash
# export  PATH="$HOME/bin:$PATH"

# Call the script with deploy.sh {network}
if [[ $# -lt 1 ]]; then
    echo "Number of arguments supplied not correct. Call this script: \
    ./deploy.sh {env} \
    env should be one of the networks configured in dfx.json."
    exit 1
fi

ENV=$1


if [[ $ENV == "local" ]]; then

    # Check DFX version
    version=$(dfx -V | sed 's/dfx\ //g' | sed 's/-.*$//g')
    if [[ "$version" < "0.15.0" ]]; then
        echo "dfx 0.15.0 or above required. Please do: dfx upgrade"
        exit 1
    fi

fi

# Deploy exchange_rate and exchange_rate_assets
dfx deploy --network "$ENV"

dfx generate
