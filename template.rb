USE_GIT = false

# Set up git repository
git :init if USE_GIT
 
# Set up .gitignore files
run %{find . -type d -empty | xargs -I xxx touch xxx/.gitignore}
file '.gitignore', <<-END
.DS_Store
coverage/*
log/*.log
db/*.db
db/*.sqlite3
db/schema.rb
tmp/**/*
doc/api
doc/app
config/database.yml
coverage/*
END
 
# Initialize submodules
git :submodule => "init" if USE_GIT
 
# Create migration for users table
file 'db/migrate/0_create_users.rb', <<-CODE
class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.timestamps
      t.string :login, :null => false
      t.string :crypted_password, :null => false
      t.string :password_salt, :null => false
      t.string :persistence_token, :null => false
      t.integer :login_count, :default => 0, :null => false
      t.datetime :last_request_at
      t.datetime :last_login_at
      t.datetime :current_login_at
      t.string :last_login_ip
      t.string :current_login_ip
    end
    
    add_index :users, :login
    add_index :users, :persistence_token
    add_index :users, :last_request_at
  end
 
  def self.down
    drop_table :users
  end
end
CODE
 
 
# Copy database.yml for distribution use
run "cp config/database.yml config/database.yml.example"
run "rm -f public/index.html"
 
gem "mbleigh-acts-as-taggable-on", :lib => "acts-as-taggable-on", :source => "http://gems.github.com"
gem "thoughtbot-shoulda", :lib => "shoulda", :source => "http://gems.github.com"
gem "thoughtbot-factory_girl", :lib => "factory_girl", :source => "http://gems.github.com"
gem "mislav-will_paginate", :lib => "will_paginate", :source => "http://gems.github.com"
gem "mmorga-money", :lib => "money", :source => "http://gems.github.com"
gem "ruby-graphviz", :lib => "graphviz", :source => "http:www.rubyforge.org"

# Install plugins as git submodules
plugin 'asset_packager',
       :git => 'git://github.com/sbecker/asset_packager.git',
       :submodule => USE_GIT
 
plugin 'authlogic',
       :git => 'git://github.com/binarylogic/authlogic.git',
       :submodule => USE_GIT
 
plugin 'annotate_models',
       :submodule => USE_GIT,
       :git => 'git://github.com/ctran/annotate_models.git'

plugin 'web-app-theme',
      :submodule => USE_GIT,
      :git => 'git://github.com/pilu/web-app-theme.git'

plugin 'active_scaffold',
      :submodule => USE_GIT,
      :git => 'git://github.com/activescaffold/active_scaffold.git -r rails-2.2'

# Initialize submodules
git :submodule => "init" if USE_GIT
 
rake('gems:install', :sudo => true)

rake('db:sessions:create')
generate("authlogic", "user session")
 
generate("theme", "application --app_name=\"CD Spin\" --theme=\"blue\"")

# Database probably isn't created at this point...
rake('db:migrate')
rake('annotate_models')
 
# unless `grep 'user_sessions' #{RAILS_ROOT}/config/routes.rb` =~ /\w/
#   route "map.resource :account, :controller => 'users'"
#   route "map.resources :users"
#   route "map.resource :user_session"
#   route "map.root :controller => 'user_sessions', :action => 'new'"
# end
 
# Commit all work so far to the repository
git :add => '.' if USE_GIT
git :commit => "-a -m 'Initial commit from template'" if USE_GIT
 
# Success!
puts "================== SUCCESS! =================="
