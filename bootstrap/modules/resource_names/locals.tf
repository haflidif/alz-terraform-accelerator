# Resource Name Setup
locals {
  formatted_postfix_number = format("%03d", var.postfix_number)
  resource_names = {
    for key, value in var.resource_names : key => replace(replace(replace(replace(replace(value, 
      "{{service_name}}", var.service_name), 
      "{{environment_name}}", var.environment_name),
      "{{azure_location}}", var.azure_location),
      "{{azure_location_short}}", substr(var.azure_location,0,3)),
      "{{postfix_number}}", local.formatted_postfix_number)
  }
}