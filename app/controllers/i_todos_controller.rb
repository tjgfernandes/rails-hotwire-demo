class ITodosController < ApplicationController
  before_action :set_i_todo, only: %i[ show edit update destroy ]

  def index
    @i_todos = ITodo.all
  end

  def new
    @i_todo = ITodo.new

    respond_to do |format|
      format.turbo_stream { render }
      format.html { render :new }
    end
  end

  # POST /i_todos or /i_todos.json
  def create
    @i_todo = ITodo.new(i_todo_params)

    respond_to do |format|
      if @i_todo.save
        format.turbo_stream
        format.html { redirect_to i_todo_url(@i_todo), notice: "iTodo was successfully created." }
        format.json { render :show, status: :created, location: @i_todo }
      else
        format.turbo_stream
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @i_todo.errors, status: :unprocessable_entity }
      end
      Rails.logger.info "NEW I TODO CREATED? #{@i_todo.inspect}"
    end
  end

  # PATCH/PUT /i_todos/1 or /i_todos/1.json
  def update
    respond_to do |format|
      if @i_todo.update(i_todo_params)
        format.turbo_stream
        format.html { redirect_to i_todos_url, notice: "iTodo was successfully updated." }
        format.json { render :show, status: :ok, location: @i_todo }
      else
        format.turbo_stream
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @i_todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /i_todos/1 or /i_todos/1.json
  def destroy
    @i_todo.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@i_todo) }
      format.html { redirect_to i_todos_eurl, notice: "iTodo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_i_todo
    @i_todo = ITodo.find(params[:id])
  end

  def i_todo_params
    params.require(:i_todo).permit(:title, :done)
  end
  
end
