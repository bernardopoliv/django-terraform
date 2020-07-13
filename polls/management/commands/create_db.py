from django.core.management.base import BaseCommand
from psycopg2 import connect
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

from django_terraform.settings_prod import DB_HOST, DB_USER, DB_PASSWORD, DB_NAME


class Command(BaseCommand):
    help = 'Creates the initial database'

    def handle(self, *args, **options):
        self.stdout.write(self.style.SUCCESS('Creating database...'))

        con = connect(dbname='postgres', user=DB_USER, host=DB_HOST, password=DB_PASSWORD)
        con.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
        cur = con.cursor()
        cur.execute('CREATE DATABASE ' + DB_NAME)
        cur.close()
        con.close()

        self.stdout.write(self.style.SUCCESS(f'The database "{DB_NAME}" was created successfully!'))
