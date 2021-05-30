mkdir ../src/credentials
mkdir ../src/static
mkdir ../src/media
echo 'credentials = {"secret_key" : "required","postgresql_name" : "myS3lf","postgresql_username" : "rshn","postgresql_password" : "QazWsx123123","postgresql_host" : "181.215.242.86","postgresql_port" : "32585"}' >>../src/credentials/credentials.py
pipenv sync
pipenv install -r requirments.txt
pipenv run python ../src/manage.py makemigrations
pipenv run python ../src/manage.py migrate
echo "Enter following details for user"
pipenv run python ../src/manage.py createsuperuser
