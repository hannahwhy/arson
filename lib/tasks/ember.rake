namespace :ember do
  EMBERJS = 'vendor/ember.js'

  desc 'Rebuild and install Ember.js'
  task :install => [:ensure, :build] do
    mkdir_p "vendor/assets/javascripts/ember.js"
    cp "#{EMBERJS}/dist/ember.js", "vendor/assets/javascripts/ember.js"
  end

  task :ensure do
    abort 'ember.js submodule is missing' unless File.exists?("#{EMBERJS}/Rakefile")
  end

  task :build do
    Bundler.with_clean_env do
      cd EMBERJS do
        sh 'bundle install && bundle exec rake dist'
      end
    end
  end
end
