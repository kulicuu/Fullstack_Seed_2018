






fs = require 'fs'

S3 = require('aws-sdk/clients/s3')




AWS = require 'aws-sdk'

# Config = require 'aws-sdk/config'

aws_config = new AWS.Config()
# aws_config = new Config()

aws_config.update region: 'us-east-1'

# AWS.config.loadFromPath path.resolve(__dirname, 'config.json')


# _.map (_.keys AWS), (v, idx) ->
#     c "#{color.blue "aws has:", on} #{color.red v, on}"



# iam = new AWS.IAM
#     apiVersion: '2010-05-08'

 # https://docs.aws.amazon.com/STS/latest/APIReference/Welcome.html

# https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/s3-example-bucket-policies.html

# NOTE RETRIEVING THE CURRENT BUCKET POLICY
# bucket_params =
#     Bucket: 'exampleimages'



# s3 = new S3({apiVersion: '2006-03-01'})
#
# s3.getBucketPolicy bucket_params, (err, data) ->
#     c 'something ?'
#     if err
#         c 'err', err
#     else
#         c 'data', data

# private function get_policy



# TODO EDIT THE CURRENT BUCKET POLICY

# TODO UPDATE THE BUCKET POLICY WITH THE EDITED ONE

# NOTE WE MAY ALSO WIND UP SETTING A POLICY ON THE ACCESSOR RATHER THAN THE ACCESSEE.  RESOURCE VS



# NOTE https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html
# NOTE as above the ec2 instance can handle the permissions in IAM ?



# s3.listObjects bucket_params, (err, data) ->
#     if err
#         c 'err', err
#     else
#         c 'data', data
#         stuff = data.Contents

        # Uncomment this to delete bucket contents:---------

        # payload_delete = _.reduce stuff, (acc, v, k) ->
        #     _.unionBy acc, [{Key: v.Key}]
        # , []
        # c 'payload_delete', payload_delete
        #
        # if payload_delete.length > 0
        #
        #     delete_params =
        #         Bucket: 'vinderproductimages'
        #         Delete:
        #             Objects: payload_delete
        #             Quiet: true
        #     s3.deleteObjects delete_params, (err2, data2) ->
        #         c 'err2', err2
        #         c 'data2', data2

        #---------------------------------------------------


        # body = fs.readFileSync('./spacewar_image.jpeg').toBase64()
        # body = new Buffer(fs.readFileSync((path.resolve __dirname , './spacewar_image.jpeg')), 'base64' )
        #
        # upload_params =
        #     Body: body
        #     Bucket: 'vinderproductimages'
        #     Key: "spacewar_image"
        # s3.putObject upload_params, (err4, data4) ->
        #     if err4
        #         c 'err4', err4
        #     else
        #         c 'data4', data4



check_whoami = Bluebird.promisify ({ stuff }, cb) ->
# the native clients should be saving lots of data to device unless/until signout happens.  this is still useful as a failsafe check.



do_some_action_on_some_photo = Bluebird.promisify (cb) ->

    # Do some stuff with S3
    cb null, "OK"





# ----API below,  private agents above --------

aa = {}






aa.request_product_photo_upload_auth = ({ payload, spark }) ->




aa.edit_profile = ({ payload, spark }) ->


aa.change_password = ({ payload, spark }) ->


aa.getWeatherNews = ({ payload, spark }) ->
    # tells this user everything they need to know


aa.greet_establish_status = ({ payload, spark }) ->
    # NOTE: the native clients 'know' who they are generally but the failsafe and to establish the nature of the relationship we can share a token stored client side and refreshed periodically.
    # this could be stored in nodejs state, it could also maybe be stored on the spark itself, another place in nodejs memory.  an alterative would just check the token before every other relevant, protected api key



exports.default = aa
