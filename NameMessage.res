/**
 * The type of the incoming body
 */
type nameMessage = {name: option<string>}

/**
 * The type of the response body
 */
type nameResponse = {message: string}

/**
 * Decode a JSON-encoded string using JSON.parse()
 * and assume it is the nameMessage type
 */
@scope("JSON") @val external parseMessage: string => nameMessage = "parse"

/*
 * Stringify the name response message
 */
@scope("JSON") @val external stringifyResponse: nameResponse => string = "stringify"
