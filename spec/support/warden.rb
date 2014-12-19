# Devise test helper to stub sign in / sign out (for feature tests)
include Warden::Test::Helpers
Warden.test_mode!
