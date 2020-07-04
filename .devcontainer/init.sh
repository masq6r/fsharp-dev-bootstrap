cd /home/fsharp && dotnet new tool-manifest && dotnet tool install paket
mv /home/fsharp/paket.dependencies /home/fsharp/ws
mv /home/fsharp/package.json /home/fsharp/ws
mv /home/fsharp/webpack.config.web-dev.js /home/fsharp/ws
mv /home/fsharp/webpack.config.web.js /home/fsharp/ws

yarn config set registry https://registry.npm.taobao.org/
yarn config set electron_mirror https://npm.taobao.org/mirrors/electron/

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo 'export PATH="$PATH:$(yarn global bin)"' >> /home/fsharp/.zshrc