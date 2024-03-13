exports.handler = async (event) => {
    const response = {
        statusCode: 200,
        body: JSON.stringify('I\'m alive.'),
    }

    return response
}