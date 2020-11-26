provider "google"{
    project = "sopes1-280618"
    region = "us-central1"
}

resource "google_compute_instance" "default" {
    name = "desde-terraform"
    machine_type = "e2-medium"
    zone = "us-central1-a"
    boot_disk {
      auto_delete = true
      initialize_params {
        image = "ubuntu-1804-bionic-v20201116"
        size = 16
      }
    }
    tags = [ "todo-entra",
             "todo-sale",
             "http-server",
             "https-server"
     ]
    //interface, arrached_disck->source, service_account->scopes, node_affinities
    network_interface {
      network = "default"
      access_config {
        
      }
    }
    metadata = {
      "ssh-keys"="DGG:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsWfCxPY8dOzzLEZ6m0AjU3YHzY6ienE0mDFyOLywfjK7NSzFzBfCoecTxNkwC9NCre+zLu9PCsFBVn+qaS8nlG+Tuc2dL83cxk+efMbjguDqxdWYIevRfNAYhpBWfYW+QmAc1h3OCKltEdJZxk1Mh38D6L1Jf6BjQzdcnJL+yZhAiDkKfA1TnlNPK9W3lh58BXWB1J/8OFh4Y2Bi7BIbCh7W8/FWBJkPo0mxYlR6zDcEqsf3fIO+CupG9wH75G9dGi4NfE5+qElsypiAjNb1KAYfK8dX/gvCj/kfgdcuvuXD0HkqF5lcJWG0v0R0KEeulAniqT5sywYRatgw3MALcqBdZf1nCHCbuLZRQvYWzAmLKzLVVGReFO99juFMPTpIe5a8AODmT0KrVmrWLRR+30UgMNN6YeHnUXU8E54z9EAPXHQPvTcwdA8BjwduK4KxjO/RsghQmmYdpQkw6n4XQBaVRUM/U5uUczB91ZptK+/Yf+4jFHNslrM+VHpfD1DU= DGG@localhost"
    }
    metadata_startup_script = "sudo apt-get update; sudo apt-get install -y docker.io; sudo docker run -it --name miweb -p 80:80 -d nginx"
}

