# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_nested_attrs_session',
  :secret      => 'fccfa386b2a007049e1524900491fa2a4f9fd65aa07785521b803ba61d0aa624644b6a625da367c89baa74c81624fe73b8aeef5fb4501d8eeb4fd9d2c160f078'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
