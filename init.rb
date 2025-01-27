Redmine::Plugin.register :monthly_report do
  name 'Monthly Report plugin'
  author 'Maxim Budko'
  description 'Генерация ежемесячного отчета НИИ СТИС'
  version '1.0.9'
  url 'https://github.com/MaximBudko/nii_stis_report'
  author_url 'https://github.com/MaximBudko'

  
  menu :top_menu, :report_generator, {controller: 'report', action: 'index'}, caption: 'Генератор отчетов' , if: Proc.new { User.current.admin? }
end
