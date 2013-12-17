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

unless RAILS_ENV == 'production'
  Rails.application.routes.draw do
    resources :system_log do
      get "clear", :on => :collection
    end
  end
end