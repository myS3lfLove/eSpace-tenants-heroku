@echo off
mkdir ..\src\media
mkdir ..\src\static
mkdir ..\src\credentials
@(
echo credentials = {
echo     "email_username" : "optional",
echo     "email_password" : "optional",
echo     "postgresql_name" : "optional",
echo     "postgresql_username" : "optional",
echo     "postgresql_password" : "optional",
echo     "postgresql_host" : "optional",
echo     "postgresql_port" : "optional",
echo     "secret_key" : "required",
echo     "consumer_key" : "optional",
echo     "consumer_secret" : "optional",
echo     "access_token" : "optional",
echo     "access_token_secret" : "optional",
echo }
) >..\src\credentials\credentials.py
@echo Enter credentials in  ..\src\credentials\credentials.py
pause
start notepad ..\src\credentials\credentials.py
pause
python -m pipenv sync
python -m pipenv install -r ..\requirments.txt
python -m pipenv run python ..\src\manage.py makemigrations
python -m pipenv run python ..\src\manage.py migrate
python -m pipenv run python ..\src\manage.py migrate_schemas --shared
python -m pipenv run python ..\src\manage.py collectstatic
@echo Enter following details for user
python -m pipenv run python ..\src\manage.py createsuperuser
@echo add schema as public and domian as localhost
@echo Enter following details for schema domain
python -m pipenv run python ..\src\manage.py create_tenant
python -m pipenv run python ..\src\manage.py create_tenant_superuser
pause
