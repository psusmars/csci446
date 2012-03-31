class Members::UsersController < Members::MembersController
	filter_resource_access
  # GET /users
  # GET /users.json
  def index
    @users = User.all
		@users = User.paginate page: params[:page], order: 'last_name asc',	per_page: 10
		
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
		@user = current_user
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
		if current_user.admin? and params[:id] != "id"
			@user = User.find(params[:id])
		else
			@user = current_user
		end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to members_root_url, notice: "Successfully updated profile" }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
