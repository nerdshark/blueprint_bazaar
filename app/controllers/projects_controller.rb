class ProjectsController < ApplicationController
  skip_before_filter :require_login, :only => [:index, :show]
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    if current_user
      @project = Project.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @project }
      end
    else
      respond_to do |format|

      end
    end



  end


  # GET /projects/1/edit
  def edit
    begin
      unless (@project = Project.find(params[:id])).creator == current_user

      end
      @project

    rescue
      raise
    end

  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @project.creator = current_user
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        flash.now[:alert] = @project.errors.messages
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    if @project.owner._id == @current_user._id
        @project.destroy
        respond_to do |format|
            format.html { redirect_to projects_url }
            format.json { head :no_content }
        end
    else
        respond_to do |format|
            format.html { redirect_to projects_url, alert: "You are not authorized to delete #{@project.title}" }
            format.json { render json: @project.errors, status: :unauthorized }
            #TODO: Create admin notification for unauthorized deletion attempt
        end
    end

  end
end
