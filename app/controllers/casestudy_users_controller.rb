class CasestudyUsersController < ApplicationController
    def index
        @casestudies = Casestudy.all        
    end

    def create
        @casestudies = Casestudy.all
        @casestudy_user = CasestudyUser.new
        @users = User.where(role: "student")
        @casestudy = Casestudy.find(params[:casestudy_id])
        @assesor = User.where("assesor")
        @casestudy_user = CasestudyUser.create(casestudy_user_params)
        if @casestudy_user.save?
            redirect_to assign_casestudies_to_users_path
        else
            raise @casestudy_user.errors.inspect
            redirect_to add_traits_path
        end
    end

    private
    def casestudy_user_params
        params.require(:user).permit(:id)        
    end
end
