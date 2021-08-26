/* The NodeJS Buffer type */
type t

/*
 * stringEncoding options for Buffer type
 */
type stringEncoding = [#utf8 | #base64]

/*
 * A binding to NodeJS Buffer.from (so that we can handle base64 encoded event body)
 */
@scope("Buffer") @val external from: (string, ~encoding: stringEncoding) => t = "from"

/**
 * A binding to NodeJS Buffer.prototype.toString (to reconstitute as a UTF8 string)
 */
@send external toString: (t, ~encoding: stringEncoding) => string = "toString"
