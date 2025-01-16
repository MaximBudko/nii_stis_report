class ReportController < ApplicationController

  def index
    @groups123 = Group.all
    @selected_groups = []
  end

  def generate
    @selected_groups_for_temp = params[:groups]


    start_date = params[:start_date]
    end_date = params[:end_date] 

    if start_date.blank?
      flash[:error] = "Необходимо указать дату начала!"
      redirect_to action: 'index' and return
    end
    
    if end_date.blank?
      flash[:error] = "Необходимо указать дату окончания!"
      redirect_to action: 'index' and return
    end


    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date) 
    
    if @start_date >= @end_date
      flash[:error] = "Дата начала должна быть меньше даты окончания!"
      redirect_to action: :index and return
    end
        
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attacment; filename="Отчет.xlsx"'
      }
    end
  end
end
