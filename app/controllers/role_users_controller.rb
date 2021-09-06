class RoleUsersController < ApplicationController
    def new
        @user = User.find(params[:user_id])
        @roles_all = Role.all
        @roles = @user.roles
        @role = RoleUser.new
    end

    def create
        @user = User.find(params[:user_id])
        @role_user = @user.role_users.create(role_user_params)
        if @role_user.save
            
            redirect_to user_path(params[:casestudy_id], @question)
        else
            raise @role_user.errors.inspect
            redirect_to add_roles_path
        end
    end

    private

    def role_user_params
       # raise params.inspect
        params.require(:role_user).permit(:user_id)
    end

end
