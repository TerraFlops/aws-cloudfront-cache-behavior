variable "allowed_methods" {
  description = "The HTTP methods that CloudFront will process and forward (one of 'get_head', 'get_head_options', or 'all'). Defaults to 'all'"
  type = string
  default = "all"
}

variable "cached_methods" {
  description = "The HTTP methods that CloudFront will cache (either 'get_head' or 'get_head_options'). Defaults to 'get_head_options'"
  type = string
  default = "get_head_options"
}

variable "compress" {
  description = "Boolean flag, if true CloudFront will automatically compress files for this cache behavior. Defaults to true"
  type = bool
  default = true
}

variable "default_ttl" {
  description = "The default amount of time (in seconds) that objects should stay in the cache. Defaults to 300 seconds"
  type = number
  default = 300
}

variable "field_level_encryption_id" {
  description = "The unique identifier of the field-level encryption configuration that you want CloudFront to use for encrypting specific fields of data for this behavior"
  type = string
  default = ""
}

variable "forward_cookies" {
  description = "Specify whether you want CloudFront to forward cookies to the origin (one of 'all', 'none' or 'whitelist'). Defaults to 'none'"
  type = string
  default = "none"
}

variable "forward_cookies_whitelist" {
  description = "If cookies are forwarded using a whitelist, this is the set of cookies to be forwarded to the origin"
  type = set(string)
  default = []
}

variable "forward_headers" {
  description = "Optional set of headers that you want CloudFront to vary upon from this cache behavior"
  type = set(string)
  default = []
}

variable "forward_query_string" {
  description = "Boolean flag indicating whether CloudFront should forward query strings to the origin. Defaults to true"
  type = bool
  default = true
}

variable "forward_query_string_whitelist" {
  description = "If forwarding query string, this defines a whitelist of keys to be forwarded. If not supplied all query string keys are forwarded"
  type = set(string)
  default = null
}

variable "lambda_origin_response" {
  description = "Optional Lambda function to associate with origin response event"
  type = object({
    lambda_arn = string
    include_body = bool
  })
  default = null
}

variable "lambda_origin_request" {
  description = "Optional Lambda function to associate with origin request event"
  type = object({
    lambda_arn = string
    include_body = bool
  })
  default = null
}

variable "lambda_viewer_response" {
  description = "Optional Lambda function to associate with viewer response event"
  type = object({
    lambda_arn = string
    include_body = bool
  })
  default = null
}

variable "lambda_viewer_request" {
  description = "Optional Lambda function to associate with viewer request event"
  type = object({
    lambda_arn = string
    include_body = bool
  })
  default = null
}

variable "max_ttl" {
  description = "The maximum amount of time (in seconds) that an object is cached. Defaults to 300 seconds"
  type = number
  default = 300
}

variable "min_ttl" {
  description = "The minimum amount of time (in seconds) that an object is cached. Defaults to 0 seconds"
  type = number
  default = 0
}

variable "path_pattern" {
  description = "The path pattern that specifies the requests this behavior applies to. Omit this for default cache behavior"
  type = string
  default = null
}

variable "smooth_streaming" {
  description = "Boolean flag indicating whether media files should be distributed in Microsoft Smooth streaming format. Defaults to false"
  type = bool
  default = false
}

variable "target_origin_id" {
  description = "The identity of the origin that requests matching this path will be forwarded to"
  type = string
}

variable "trusted_signers" {
  description = "Set of AWS account IDs that you want to allow to create signed URLs for private content"
  type = set(string)
  default = null
}

variable "viewer_protocol_policy" {
  description = "The protocol that users can use to access files in the origin, one of 'allow-all', 'https-only' or 'redirect-to-https'. Defaults to 'redirect-to-https'"
  type = string
  default = "redirect-to-https"
}