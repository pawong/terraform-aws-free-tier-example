const version = '1.0'

exports.handler = async (event) => {
    const response = {
        statusCode: 200,
        body: JSON.stringify('I\'m alive. Version: ' + version),
    }

    return response
}