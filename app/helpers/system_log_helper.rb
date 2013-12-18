module SystemLogHelper
  class SystemLog
    class << self
      # 分页（支持多关键字查询）
      def logo_data(page,per,search)
        logs = find_all_logs
        # 根据search参数来决定是否需要查询
        keywords = search
        if keywords && !keywords.strip.blank?
          # 把keywords转化成正则表达式数组
          keywords = keywords.strip.split(/\s+/).collect! {|w| Regexp.new(w, 'i')}
          # 一条记录应该匹配每个关键字
          logs = logs.find_all do |log|
            keywords.all? { |r| log =~ r }
          end
          logs = Kaminari.paginate_array(logs).page(page).per(per).collect! {|log| parse(log)}
          logs.collect! do |log|
            keywords.each { |r| log.gsub!(r, '<span class="search_results">\0</span>')}
            log
          end
        else
          logs = Kaminari.paginate_array(logs).page(page).per(per).collect! {|log| parse(log)}
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
      # 日志文件的路径，一般在Rails.root/log下，根据环境配置
      # 依次记录到product.log development.log test.log中
      def logfile_path
        File.join(Rails.root, "log", "#{ENV['RAILS_ENV']}.log")
      end
      def parse(log)
        ERB::Util.html_escape(log.gsub(/\e\[[\d;m]+/, '')).gsub("\n", "<br/>")
      end
    end
  end
end
