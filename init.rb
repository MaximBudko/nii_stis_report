Redmine::Plugin.register :monthly_report do
  name 'Monthly Report plugin'
  author 'Maxim Budko'
  description 'Генерация ежемесячного отчета НИИ СТИС'
  version '1.0.0'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  
  menu :top_menu, :report_generator, {controller: 'report', action: 'index'}, caption: 'Генератор отчетов' , if: Proc.new { User.current.admin? }
end
