Redmine::Plugin.register :monthly_report do
  name 'Monthly Report plugin'
  author 'Maxim Budko'
  description 'Генерация ежемесячного отчета НИИ СТИС'
  version '1.1.8'
  url 'https://github.com/MaximBudko/nii_stis_report'
  author_url 'https://github.com/MaximBudko'

  
  menu :top_menu, :report_generator, {controller: 'report', action: 'index'}, caption: 'Генератор отчетов' , if: Proc.new { User.current.allowed_to_see_plugin? }
end


User.class_eval do
  def allowed_to_see_plugin?
    custom_field_value = self.custom_field_value(CustomField.find_by_name('Plugin_visibility').id)
    custom_field_value == 'Да'
  end
end