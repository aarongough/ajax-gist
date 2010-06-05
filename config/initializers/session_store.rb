# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ajax-gist_session',
  :secret      => '2da09a7256a564dfc06fd1af689c100265329cca6a324f5db9cc860e2d3310252c76ad7bd12bcd93e826eed06e80f4920d06549a24749edc4f237845f1e9adc6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
