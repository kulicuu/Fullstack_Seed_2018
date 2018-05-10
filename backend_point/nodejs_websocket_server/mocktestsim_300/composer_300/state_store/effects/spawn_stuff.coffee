aa = {}



{ spawn } = require 'child_process'









aa.spawn_stuff = ({ effect, state, dispatch }) ->


    c 'spawn stuf33333f'


    spawn_arc = _.reduce [ 0 ... 3 ], (acc, num, idx) ->

        cmd_str = 'coffee'
        cmd_args = ['index.coffee']

        bot_process_env = fp.assign process.env,
            some_arb_val: 64

        spawn_opts =
            cwd: ( path.resolve __dirname, '..', '..', '..', 'bot_300')
            env: bot_process_env
            stdio: [ 'pipe', 'pipe', 'pipe', 'ipc']


        bot = spawn cmd_str, cmd_args, spawn_opts


        # TODO make dispatch for these
        bot.on 'error', (err) ->
            c (color.green "bot:", on), err.toString()

            dispatch
                type: 'bot_error'
                payload: bot.pid

        bot.stderr.on 'data', (err) ->
            c (color.red "bot-err:", on), err.toString()
            dispatch
                type: 'bot_std_err'
                payload: bot.pid

        bot.stdout.on 'data', (data) ->
            c (color.green "bot:", on), data.toString()


        bot.on 'message', (message) ->
            c message, 'bot massage'
            c (color.green "bot-cyan:", on), message.toString()


        acc["somekey:#{num}"] = bot

        acc
    , {}

    dispatch
        type: 'res_spawn_stuff'
        payload: { spawn_arc } # keep references to the bots on state.



exports.default = aa
