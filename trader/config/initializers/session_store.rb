# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_trader_session',
  :secret      => '05be8e67a1e5291bc0a91fa4cbbb8d44b6daadad6119368437a4c755a6066d9634b4cadc723ff91870c7da5054f9cc365ff470781a53ce604cc73a4fe8db4b36'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
