const version = '1.1'

exports.handler = async (event) => {
    const response = {
        statusCode: 200,
        body: JSON.stringify('I\'m alive. Version: ' + version),
    }

    return response
}