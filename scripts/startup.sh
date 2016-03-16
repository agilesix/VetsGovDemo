export RAILS_SECRET='rake secret'
export SSL_CERT_FILE = '/usr/src/app/config/cacert.pem'
rails s -b 0.0.0.0 -p 3000 Puma