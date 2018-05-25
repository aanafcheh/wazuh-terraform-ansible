# default ssh user to login to Google Cloud virtual machines
variable "gc_ssh_user" {
  default = "aanafcheh"
}

# default ssh-key to login to Google Cloud virtual machines
variable "gc_ssh_pub_key_file" {
  default = "~/.ssh/id_ed25519.pub"
}
