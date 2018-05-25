# Create a new virtual machine
resource "google_compute_instance" "wazuh_agent_1" {
   name = "wazuh-agent-1"
   machine_type = "n1-standard-2"
   zone = "europe-west3-a"  // Frankfurt region
   
   tags = ["wazuh-agent-1", "staging"]
   
   boot_disk {
      initialize_params {
      image = "centos-7"
   }
  }

  metadata {
    sshKeys = "${var.gc_ssh_user}:${file(var.gc_ssh_pub_key_file)}"
  }

network_interface {
   network = "default"
   access_config {}
}
}

// show the virtual machine's public IP address
output "wazuh_agent_1_address" {
  value = "${google_compute_instance.wazuh_agent_1.network_interface.0.access_config.0.nat_ip}"
}
