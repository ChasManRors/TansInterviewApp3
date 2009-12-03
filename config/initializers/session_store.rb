# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_TansInterviewApp_session',
  :secret      => '9a4d57f6472794909f17dc25ab4e436fd9b2fc05d54b641156e5516b541f45e15dbbced0fa764188df48f9455e36af8cea37aefce36e513b9cdc2a97519ea382'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
