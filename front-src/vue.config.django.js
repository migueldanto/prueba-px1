const path = require("path");

const webpack = require('webpack');
const fs = require('fs');
const packageJson = fs.readFileSync('./package.json');
const version = JSON.parse(packageJson).version || 0;
const now = new Date();

module.exports = {
    outputDir: path.resolve(__dirname,"../web/templates/web"),
    assetsDir: "../../static/web-assets",
    configureWebpack: {
        plugins: [
            new webpack.DefinePlugin({
                'process.env': {
                    PACKAGE_VERSION: `"${version}"`,
                    DATE_DEPLOY: `"${now.toLocaleString('es-MX', { timeZone: 'America/Mexico_City' })}"`,
                    ENV_DEPLOY: `"${process.env.NODE_ENV}"`,
                    VUE_BACKEND_URL: `"${process.env.VUE_BACKEND_URL}"`
                },
            }),
        ],
    },
}
