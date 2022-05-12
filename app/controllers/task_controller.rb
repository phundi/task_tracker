class TaskController < ApplicationController

  def new
    @task = Task.new
    @action = "/task/new"

    if request.post?
      @task = Task.new
      @task.title = params[:title]
      @task.desc = params[:description]    
      @task.due_date = params[:due_date] 
      @task.assignee_id = params[:assignee_id]       
      @task.status_id = params[:status_id]       
      @task.save
      
      n = Notification.new
      n.user_id = params[:assignee_id] 
      n.seen = 0
      n.notification = ""
      n.save
            
      redirect_to "/task/view?task_id=#{@task.id}"
    end
  end

  def edit
    @task = Task.find(params[:task_id])

    @action = "/task/edit"

    if request.post?

      @task.title = params[:title]
      @task.desc = params[:description]    
      @task.due_date = params[:due_date] 
      @task.assignee_id = params[:assignee_id]       
      @task.status_id = params[:status_id]       
      @task.save
      
      redirect_to "/task/view?task_id=#{@task.id}"
    end
  end

  def view
    @task = Task.find(params[:task_id])    
  end 

  def ajax_task

    search_val = params[:search][:value] rescue nil
    search_val = '_' if search_val.blank?

    tag_filter = ''
    code_filter = ''
    user = User.find(session["user_id"])
    
    data = Task.order(' task_id DESC ')
    data = data.where(" assignee_id = #{user.id} AND CONCAT_WS(title, '_') REGEXP '#{search_val}'")
    total = data.select(" count(*) c ")[0]['c'] rescue 0
    page = (params[:start].to_i / params[:length].to_i) + 1

    data = data.select(" task.* ")
    data = data.page(page).per_page(params[:length].to_i)

    @records = []
        
    data.each do |t|      
    
      tt = t.title[0 .. 50]
      tt = tt + "..." if t.title.length > 50
    
      ds = t.desc[0 .. 50]
      ds = ds + "..." if t.desc.length > 50

      row = [tt, ds, User.find(t.assignee_id).name, Status.find(t.status_id).name, t.due_date.strftime('%d-%b-%Y'), t.id]
      @records << row
    end
    
    render :text => {
        "draw" => params[:draw].to_i,
        "recordsTotal" => total,
        "recordsFiltered" => total,
        "data" => @records}.to_json and return
  end

end
