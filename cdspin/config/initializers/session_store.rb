# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cdspin_session',
  :secret      => '788c325ada66d29846ac446e888e028b8069e04f90d61ca961c6f9feef8b0dafbfc53ff79fc74d5ca67de18460df4f9e938690c126fb6878ba5276312af59522'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
