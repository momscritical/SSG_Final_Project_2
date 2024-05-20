terraform { 
  required_providers { 
    aws = { 
      source  = "hashicorp/aws" 
      version = "~> 4.46.0" 
    }
    kubernetes = { 
      source  = "hashicorp/kubernetes" 
      version = "~> 2.16.1" 
    }
    tls = { 
      source  = "hashicorp/tls" 
      version = "~> 4.0.4" 
    } 
    # random = { 
    #   source  = "hashicorp/random" 
    #   version = "~> 3.4.3" 
    # }
    # cloudinit = { 
    #   source  = "hashicorp/cloudinit" 
    #   version = "~> 2.2.0" 
    # }

  }
  required_version = "~> 1.3" 
}

provider "aws" { 
  region = var.region
}

provider "helm" { # apply 오류 있어서 추가했음
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubernetes" { # apply 오류 있어서 추가함 
  config_path = "~/.kube/config"
}