from dataStorage.models import Client, Domain

# create your public tenant
tenant = Client(schema_name='public', name='localhost')
tenant.save()

# Add one or more domains for the tenant
domain = Domain()
domain.domain = 'localhost' # don't add your port or www here! on a local server you'll want to use localhost here
domain.tenant = tenant
domain.is_primary = True
domain.save()
