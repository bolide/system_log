require 'rails'
require "system_log/version"
require "system_log/engine"
module SystemLog
  class SystemLog
    class << self
      # 分页（支持多关键字查询）
      def paginate(options_or_page = {})
        logs = find_all_logs
        # 根据search参数来决定是否需要查询
        keywords = options_or_page[:search]
        if keywords && !keywords.strip.blank?
          # 把keywords转化成正则表达式数组
          keywords = keywords.strip.split(/\s+/).collect! {|w| Regexp.new(w, 'i')}
          # 一条记录应该匹配每个关键字
          logs = logs.find_all do |log|
            keywords.all? { |r| log =~ r }
          end
          logs = logs.paginate(options_or_page).collect! {|log| parse(log)}
          logs.collect! do |log|
            keywords.each { |r| log.gsub!(r, '<span class="search_results">\0</span>')}
            log
          end
        else
          logs = logs.paginate(options_or_page).collect! {|log| parse(log)}
        end
        logs
      end
      def clear
        File.open(logfile_path, 'w') do |f|
          f.print ''
        end
      end
      private
      def find_all_logs
        File.open(logfile_path) do |f|
          f.read.split("\nProcessing ").reverse[1..-1]
        end
      end
      # 日志文件的路径，一般在RAILS_ROOT/log下，根据环境配置
      # 依次记录到product.log development.log test.log中
      def logfile_path
        File.join(RAILS_ROOT, "log", "#{ENV['RAILS_ENV']}.log")
      end
      def parse(log)
        ERB::Util.html_escape(log.gsub(/\e\[[\d;m]+/, '')).gsub("\n", "<br/>")
      end
    end
  end
end
