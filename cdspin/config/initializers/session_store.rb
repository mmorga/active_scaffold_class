# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cdspin_session',
  :secret      => 'a96fe67da45706cefc3c3c9ca23c061598c85a369bc59141c72e3afb060d018cfd2e814885615faa3f7640dd03674d47372da9d147037a69d38efd020f97631d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
