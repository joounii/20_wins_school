# create a new user
jq --arg name "$name" '.users += [{"name": $name, "pve_random": [{"win": 0, "lose": 0}]}]' ./data/user_statistics.json > ./data/temp.json && mv ./data/temp.json ./data/user_statistics.json

# read/get values from a user (in this sample we get the amount of wins the current user has against the pve_random bot)
win=$(jq --arg name "$name" '.users[] | select(.name == $name) | .pve_random[].win' ./data/user_statistics.json)

# update a value (in this example we increase the wins teh current user has against the pve_random bot by 1)
jq --arg name "$name" '.users[] | select(.name == $name) | .pve_random[].win += 1' ./data/user_statistics.json > ./data/temp.json && mv ./data/temp.json ./data/user_statistics.json

# delete a user
jq --arg name "$name" 'del(.users[] | select(.name == $name))' ./data/user_statistics.json > ./data/temp.json && mv ./data/temp.json ./data/user_statistics.json
