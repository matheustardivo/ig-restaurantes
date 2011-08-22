require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'TRbjwyF6vHxihyRBjQH00g', '9W7QToauaJWBAg7opEZGrl7PdcRzYCoEpTiFCY0Ns'
  # provider :facebook, '173215809371929', '3af0716a259e754e9097e4aa3fbf36f6'
  provider :linked_in, 'syqthvdge01g', 'XE6al8Nwra0Zc4sk'
  provider :github, 'd1544aa209ef1a381de2', 'a28b13f83002b021088c34c74e190958146d25b0'
  provider :open_id, OpenID::Store::Filesystem.new('/tmp')
  use OmniAuth::Strategies::OpenID, OpenID::Store::Filesystem.new('/tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
  use OmniAuth::Strategies::OpenID, OpenID::Store::Filesystem.new('/tmp'), :name => 'ig', :identifier => 'https://login.ig.com.br/oid'
end
