load database
   from mysql://victor:root@localhost/fnaeg
   into pgsql://localhost/fnaeg
  alter schema 'fnaeg' rename to 'public';