# See https://www.reddit.com/r/MacOS/comments/vytkja/how_to_share_magic_keyboard_between_two_macs/

function re_pair_all() {
  re_pair_keyboard
  re_pair_trackpad
}

function re_pair_keyboard() {
  id=`blueutil --paired | grep "Magic Keyboard" | grep -Eo '[a-z0-9]{2}(-[a-z0-9]{2}){5}'`
  name=`blueutil --paired | grep "Magic Keyboard" | grep -Eo 'name: "\S+"'`
  echo "unpairing with BT device $id, $name"
  blueutil --unpair "$id"
  echo "unpaired, waiting a few seconds for trackpad to go to pairable state"
  sleep 3
  echo "pairing with BT device $id, $name"
  blueutil --pair "$id" "0000"
  echo "paired"
  blueutil --connect "$id"
  echo "connected"
}

function re_pair_trackpad() {
  id=`blueutil --paired | grep "Magic Trackpad" | grep -Eo '[a-z0-9]{2}(-[a-z0-9]{2}){5}'`
  name=`blueutil --paired | grep "Magic Trackpad" | grep -Eo 'name: "\S+"'`
  echo "unpairing with BT device $id, $name"
  blueutil --unpair "$id"
  echo "unpaired, waiting a few seconds for trackpad to go to pairable state"
  sleep 3
  echo "pairing with BT device $id, $name"
  blueutil --pair "$id" "0000"
  echo "paired"
  blueutil --connect "$id"
  echo "connected"
}
