#!/usr/bin/env ruby

task :default => :test do 
end 

task :test => :verify  do
     sh "ruby  tests/test.rb"
end

task :verify do
  if ENV['USER'] != "root"
     puts "You need to run this as root"
     exit 1
  end
end
