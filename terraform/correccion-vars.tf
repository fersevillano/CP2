variable "location" {
  type = string
  description = "Región de Azure donde crearemos la infraestructura"
  default = "Norway East" 
}

variable "storage_account" {
  type = string
  description = "Nombre para la storage account"
  default = "fersevstoragecp37"
}

variable "public_key_path" {
  type = string
  description = "Ruta para la clave pública de acceso a las instancias"
  default = "~/.ssh/id_rsa.pub" # o la ruta correspondiente
}

variable "ssh_user" {
  type = string
  description = "Usuario para hacer ssh"
  default = "Adminusername"
}
