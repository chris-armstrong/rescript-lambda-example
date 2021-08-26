/*
 * An API Gateway Lambda Event.
 *
 * (with a simplified interface with just what
 * we need for this example)
 */
type awsAPIGatewayEvent = {
  body: option<string>,
  isBase64Encoded: bool,
}

/**
 * An APIGateway response type. In this we
 * seralise the response body and specify the
 * status code (with any headers, if necessary)
 */
type awsAPIGatewayResponse = {
  body: string,
  headers: Js.Dict.t<string>,
  statusCode: int,
}
