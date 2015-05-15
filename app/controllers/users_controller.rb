class UsersController < ApplicationController
    before_action :set_user, only: [:show, :create, :edit, :update, :destroy]

    def show
        @user = User.find_by(params[:id])
    end

    def create
      @user = User.new(params[:user])

      respond_to do |format|
        if @user.save
            Users.mailer.confirmation_instructions(@user).deliver_later
            format.html { redirect_to(@user, notice: 'User was successfuly created.')}
            format.json { render json: @user, status: :created, location: @user }
        else
            format.html { render action: 'new'}
            format.json { render json: @user.errors, status: :unprocessable_entity}
        end
    end
end

def edit
end

def update
    @user = User.find_by(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        sign_in(@user == current_user ? @user : current_user, :bypass => true)
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
    else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
    end
end
end

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    if request.patch? && params[:user] && params[:user][:email]
        @user = User.find(params[:id])
        if @user.update(user_params)
            @user.skip_reconfirmation!
            sign_in(@user, :bypass => true)
            redirect_to '/', notice: 'Your profile was successfully updated.'
        else
            @show_errors = true
        end
    end
end


  # DELETE /users/:id.:format
  def destroy
    @user = User.find_by(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
  end
end

private
def set_user
    @user = User.find(params[:id])
end

def user_params
            accessible = [ :name, :email ] # extend with your own params
            accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
            params.require(:user).permit(accessible)
        end
    end

