# Oystercard

-   Running  `gem list`  I was able to see the list of gems installed on my machine.  `bundler`  was included in my list of installed gems.
-   Running `bundler init` created a Gemfile in the root of my project directory. 
-   I edited my Gemfile, specifying my Ruby version and the Rspec gem after the  `git_source`  line:
```
ruby '2.7.1' 
group :development, :test do 
  gem "rspec" 
end 
```
- The development / test syntax denotes that the gems will only be required when the development and test environments are running.
- Running  `bundle install` invokes the bundler, that looks at the  `Gemfile`, and evaluates whether any of the gems need to be installed and install them.
- Information about the gems, their versions and dependencies are saved to an auto-generated `Gemfile.lock`.
