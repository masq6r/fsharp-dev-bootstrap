mv /home/fsharp/.paket /home/fsharp/ws/
mv /home/fsharp/paket.dependencies /home/fsharp/ws
mv /home/fsharp/package.json /home/fsharp/ws
mv /home/fsharp/webpack.config.web-dev.js /home/fsharp/ws
mv /home/fsharp/webpack.config.web.js /home/fsharp/ws

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended