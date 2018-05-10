




port = 8999
Primus = require 'primus'

require('./globals.coffee')()
.then ->
    c color.cyan 'Brujo API Server'
    primus_handle = require('./brujo_primus_handle.coffee').default
    http_primus = Primus.createServer { port }
    primus_handle http_primus
    c 'primus handled', port
    http_primus.save(path.resolve(__dirname, '..', 'client_libs', 'http_brujo_primus.js'))












    # HTTPS stuff:



    # NOTE: https://stackoverflow.com/questions/2642777/trusting-all-certificates-using-httpclient-over-https/6378872#6378872
    # for information about setting up https with certificate trusting correctly.  For week-one we'll just do the http servers


    # https_pass = require '../../../certificates_creation/pass_mod.coffee'

    # https_primus_handle = require('./https_primus_handle').default

    # https_primus = Primus.createServer
    #     port: 7084
    #     root: '../../../certificates_creation'
    #     cert: 'server.crt'
    #     key: 'server.key'
    #     passphrase: https_pass
    #     requestCert: false
    #     rejectUnauthorized: false
    #
    # https_primus_handle https_primus



    # https_primus.save(path.resolve(__dirname, '..', 'client_libs', 'https_primus.js'))
