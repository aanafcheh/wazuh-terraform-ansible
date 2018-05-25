// Allow https traffic and pings from everywhere
resource "google_compute_firewall" "wazuh" {  
    name = "wazuh"
    network = "default"
    
    allow {
      protocol = "icmp"
    }
    
    allow {
        protocol = "tcp"
        ports = ["5601"]
    }
    
    allow {
        protocol = "tcp"
        ports = ["1515"]
    }
    
    allow {
        protocol = "tcp"
        ports = ["1514"]
    }


    source_ranges = ["0.0.0.0/0"]
} 
