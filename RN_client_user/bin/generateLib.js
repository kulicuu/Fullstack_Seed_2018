
const Primus = require('primus')
const fs = require('fs')
const path = require('path')

let primus = Primus.createServer(function connection (spark) {}, { port: 9000, transformer: 'websockets' })
const library = primus.library()
fs.writeFileSync(path.join(__dirname, '..', 'dist', 'client_libs' ,'primus.js'), library)

process.exit(0)
