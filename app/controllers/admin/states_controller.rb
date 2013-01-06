class Admin::StatesController < Admin::BaseController
  
  def index    
  end
  
  def new
    @state = State.new
  end
  
  def create
    @state = State.new(params[:state])
    if @state.save
      flash[:notice] = "State has been created."
      redirect_to admin_states_path
    else
      flash[:warning] = "State has not been created."
      render :action => "new"
    end
  end
end
