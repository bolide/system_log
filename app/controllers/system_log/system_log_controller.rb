# 显示和清理系统日志
module SystemLog
  class SystemLogController < ActionController::Base
    # 默认每页显示20条记录
    PER_PAGE = 20
    layout "system_log/application"
    include SystemLog::SystemLogHelper
    def index
      @logs = SystemLog.logo_data(params[:page]||1,params[:per]||PER_PAGE,params[:search] )
    end

    def clear
      SystemLog.clear
      redirect_to :action => :index
    end
  end
end
