// Copy this file to your project folder
// Replace "##xxx##" with your own configurations
const path = require('path');
const webpack = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');

function resolve(filePath) {
  return path.join(__dirname, filePath)
}

module.exports = {
  entry: {
    sof_console: resolve('##your-fsharp-web-project.fsproj##'),
  },
  output: {
    filename: '[name].bundle.js',
    path: resolve('pages')
  },
  devtool: "inline-source-map",
  module: {
    rules: [
      {
        test: /\.css$/,
        use: ['style-loader', 'css-loader']
      },
      { test: /\.(eot|svg|ttf|woff|woff2)\w*/, 
        loader: "url-loader?limit=10000&mimetype=application/font-woff" 
      },
      {
        test: /\.fs(x|proj)?$/,
        use: "fable-loader"
      }
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({
      title: "##Your Page Title##"
    }),
    new webpack.NamedModulesPlugin(),
    new webpack.HotModuleReplacementPlugin()
  ]
};