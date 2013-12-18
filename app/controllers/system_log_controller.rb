# 显示和清理系统日志
module SystemLog
  class SystemLogController < ActionController::Base
    # 默认每页显示20条记录
    PER_PAGE = 20
    include SystemLogHelper
    def index
      @logs = SystemLog.logo_data(:page => params[:page],
        :per_page => PER_PAGE,
        :search => params[:search] )
    end

    def clear
      SystemLog.clear
      redirect_to :action => :index
    end
  end
end
