#!/usr/bin/env rake
require "bundler/gem_tasks"
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end
begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end
RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'SystemLog'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

# 在此设置Route，可以避免在每个应用程序中设置
load 'rails/tasks/engine.rake'
#class ActionController::Routing::RouteSet
#  alias draw_without_log draw
#  def draw_with_log
#    draw_without_log do |map|
#      map.resources :system_log,:collection => { :clear => :get, :change_level => :get }
#      yield map
#    end
#  end
#  alias draw draw_with_log
#end