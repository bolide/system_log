## 在此设置Route，可以避免在每个应用程序中设置
#class ActionController::Routing::RouteSet
#  alias old_draw draw
#
#  def draw
#    old_draw do |map|
#      map.system_log 'system_log', :controller=>'system_log'
#      map.connect 'system_log/clear', :controller=>'system_log', :action => 'clear'
#      yield map
#    end
#  end
#
#end
#
#

#unless Rails.env == 'production'
  SystemLog::Engine.routes.draw do
    match 'system_log' => 'system_log#index'
    match 'system_log/clear' => 'system_log#clear'
    root :to => 'system_log#index'
  end
#end