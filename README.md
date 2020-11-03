# Oystercard

This week's challenge will start with going back over the basics we covered last week in Boris Bikes, giving you the chance to reinforce what you learned last week. You'll then be challenged to build a more complex system which should really stretch your skills in Ruby, TDD and object-oriented design, based off the following user stories:
```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```
## Gemfile Creation
Something new that I hadn't done before was the creation of a Gemfile in the root of my project directory. These are the steps I took to create a Gemfile for my oystercard program:

>*"A Gemfile is a file we create which is used for describing gem dependencies for Ruby programs. A gem is a collection of Ruby code that we can extract into a “collection” which we can call later."*

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
