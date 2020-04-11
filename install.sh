 #!/bin/bash
 sudo amazon-linux-extras install epel -y
 sudo yum install epel-release -y
 sudo yum install git -y
 sudo yum update -y
 sudo yum install python-django -y
 git clone https://github.com/GodsonSibreyan/GodsonPy.git
 cd GodsonPy/
 sudo python manage.py migrate
 sudo python manage.py runserver 0.0.0.0:8000
