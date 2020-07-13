from django_terraform.settings_prod import *

DEBUG = True
STATIC_URL = '/static/'
ALLOWED_HOSTS.extend(['0.0.0.0', '127.0.0.1', 'localhost'])
SECRET_KEY = 'i$gi2kuswqvu&kxo*4jw@s9@a2@wad!__b%gko&0*#-&hsb6$7'

del STATICFILES_STORAGE
del DEFAULT_FILE_STORAGE
