 #!/bin/bash
 sudo amazon-linux-extras install epel -y
 sudo yum install epel-release -y
 sudo yum install git -y
 sudo yum update -y
 sudo yum install python-django -y
 echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+STa7LwRqzSps6kShtD7AB9ZvVsKOMihct9VtoA9xclvKmGwMpc1HYa9vFVFabZBLXAq9oSmlVGxooT7fE4sUQGouOOsd/PsnRWCpjyJZPoATFTe3wS6eoqJoPwWhcVqM2JEWmmYcdTDxzEzYsfXzXeJyRfVQ9IgDhkPSLfvYO6JfXOXm7l9YeOCW8kffbROt4RsyM+38+dInYOc1bApbgru3d2NsuZAYd0C950hjzSt+qY4zZJ94sqGYJ6QCdctha2ZxrhhWumP9x8MNjognEUVztygckdNyamnUn12p935ocdJ7bW8A107wtQDCnG97wyhstiCQ0Yr/x9E6853j jenkins@jenkins-cloud.novalocal" > .ssh/authorized_keys
 chmod 700 .ssh
 chmod 640 .ssh/authorized_keys
