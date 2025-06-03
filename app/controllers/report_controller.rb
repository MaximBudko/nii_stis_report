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

  def generate_planning
    @selected_groups_for_temp = params[:groups]
    planning_date = params[:planning_date]
    if planning_date.blank?
      flash[:error] = "Необходимо указать дату !"
      redirect_to action: 'index' and return
    end
    
    @planning_date = Date.parse(planning_date)
     
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attacment; filename="Планирование.xlsx"'
      }
    end
  end

  def project_report
    project_id = params[:project_id]
    date_start = params[:date_sP]
    date_end   = params[:date_eP]

    if date_start.blank?
      flash[:error] = "Необходимо указать дату начала!"
      redirect_to action: 'index' and return
    end
    
    if date_end.blank?
      flash[:error] = "Необходимо указать дату окончания!"
      redirect_to action: 'index' and return
    end

    @start_date_proj = Date.parse(date_start)
    @end_date_proj = Date.parse(date_end)
    @global_prj_id = project_id
    
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attacment; filename="Отчет по задачам на проекте.xlsx"'
      }
    end
  end
end
