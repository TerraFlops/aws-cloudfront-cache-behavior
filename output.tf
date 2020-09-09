locals {
  allowed_methods = {
    http_get = ["HTTP", "GET"]
    http_get_options = ["HTTP", "GET", "OPTIONS"],
    all = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
  }

  cached_methods = {
    get_head = ["GET", "HEAD"]
    get_head_options = ["GET", "HEAD", "OPTIONS"]
  }

  cache_behavior = {
    allowed_methods = toset(local.allowed_methods[var.allowed_methods])
    cached_methods = toset(local.cached_methods[var.cached_methods])
    compress = tobool(var.compress)
    default_ttl = tonumber(var.default_ttl)
    field_level_encryption_id = tostring(var.field_level_encryption_id)
    forwarded_values = {
      cookies = {
        forward = var.forward_cookies
        whitelisted_names = var.forward_cookies == true ? var.forward_cookies_whitelist : []
      }
      headers = toset(var.forward_headers)
      query_string = var.forward_query_string
      query_string_cache_keys = var.forward_query_string == true ? var.forward_query_string_whitelist : []
    }
    lambda_function_associations = concat([
      var.lambda_origin_response == null ? null : {
        event_type = "origin-response"
        include_body = var.lambda_origin_response.include_body 
        lambda_arn = var.lambda_origin_response.lambda_arn        
      },
      var.lambda_origin_request == null ? null : {
        event_type = "origin-request"
        include_body = var.lambda_origin_request.include_body 
        lambda_arn = var.lambda_origin_request.lambda_arn        
      },
      var.lambda_viewer_response == null ? null : {
        event_type = "viewer-response"
        include_body = var.lambda_viewer_response.include_body 
        lambda_arn = var.lambda_viewer_response.lambda_arn        
      },
      var.lambda_viewer_request == null ? null : {
        event_type = "viewer-request"
        include_body = var.lambda_viewer_request.include_body 
        lambda_arn = var.lambda_viewer_request.lambda_arn        
      }
    ])
    max_ttl = var.max_ttl
    min_ttl = var.min_ttl
    path_pattern = var.path_pattern
    smooth_streaming = var.smooth_streaming
    target_origin_id = var.target_origin_id
    trusted_signers = var.trusted_signers
    viewer_protocol_policy = var.viewer_protocol_policy
  }
}

output "cache_behavior" {
  description = "The complete cache behavior in format compatible with distribution module"
  value = local.cache_behavior
}
