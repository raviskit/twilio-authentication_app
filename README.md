# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* ruby 2.3.0p0

* Rails 5.0.2, rspec-rails (3.5.2)

# Kalebr-Test-App


How to setup this app in you local machine :

Step-1:

Install ruby and rails in local from below guide .
https://gorails.com/setup

Step-2:

Clone this app in local .

Step-3:

bundle install # download all the required packages from internet only once .

Step-4:

rake db:create # setup database

Step-5:

rake db:schema:load #set table and their columns .

Step-6:

rake db:seed  #sets pre required values , like category etc ..

Step-7 :

#This app uses Solr as search engine to give better searching experience . Run your solr using below commands .

bundle exec rake sunspot:solr:start

Step-8:

#Finally hit below command and cheers .

rails server . # it starts the server on http://localhost:3000


Note : This app runs with paperclip which creates multiple sizes of images so make sure you have imagemagick package , or install it .


Run all the specs .

rspec spec/controllers/*(give file name here)
rspec spec/models/*(give file name here)
