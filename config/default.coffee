#
# 配置文件
#

module.exports =

  clientId: null

  http:
    port: process.env.PORT or 3000
    baseUrl: ''

  logPath: __dirname + '/../log'

  mongo:
    uri: null
    mongos: false
    host: 'localhost'
    port: 27017
    database: 'example'
    user: null
    password: null
