# SImple file automation with code 



# block parameters {

#  arguments

#}




resource "local_file" "temp_file" {

  filename        = "Demo.txt"
  content         = "Hello , Myself prem mishra"
  file_permission = "0664"

}


