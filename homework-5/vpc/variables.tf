variable region {}
variable vpc_cidr {}
variable environment {}
variable subnet {
  description = "sybnet cidr"
  type        = list(string)
  default     = null
  nullable    = true
}
