open Belt.Option
open ApiGateway
open NameMessage

let handler = (event: awsAPIGatewayEvent): Js.Promise.t<awsAPIGatewayResponse> => {
  Js.log2("body", isNone(event.body))
  // Convert body to a UTF-8 string if base64-encoded
  let body =
    event.body
    ->map(body =>
      event.isBase64Encoded
        ? body->Buffer.from(~encoding=#base64)->Buffer.toString(~encoding=#utf8)
        : body
    )
    ->flatMap(body => body != "" ? Some(body) : None)

  // Parse the event body string using JSON.parse
  let message = map(body, parseNameMessage)

  // Extract the name field
  let name = flatMap(message, message => message.name)

  // Construct the response body
  let responseBody = {
    message: `Hello, ${getWithDefault(name, "there")}!`,
  }
  let response = {
    statusCode: 200,
    headers: Js.Dict.fromArray([("content-type", "application/json")]),
    body: stringifyResponse(responseBody),
  }
  Js.Promise.resolve(response)
}
