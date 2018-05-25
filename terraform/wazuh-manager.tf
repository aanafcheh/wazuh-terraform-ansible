# Create a new virtual machine
resource "google_compute_instance" "wazuh_manager" {
   name = "wazuh-manager"
   machine_type = "n1-standard-2"
   zone = "europe-west3-a"  // Frankfurt region
   
   tags = ["wazuh-manager", "staging"]
   
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
output "wazuh_manager_address" {
  value = "${google_compute_instance.wazuh_manager.network_interface.0.access_config.0.nat_ip}"
}
