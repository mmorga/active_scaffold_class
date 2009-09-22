# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cdspin_session',
  :secret      => '994e492d37a86ba7306901e62f54186266a3b75cb26300cf7337f02d135bb61ef9ae5d9efc039be96943c4cd44b4ee5348e7e7d8647f791a11baa69e2bce704e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
