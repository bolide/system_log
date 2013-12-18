SystemLog::Engine.routes.draw do
  #Rails.application.routes.draw do
  match 'system_log' => 'system_log#index'
  match 'system_log/clear' => 'system_log#clear'
#  root :to => 'system_log#index'
  #end
end