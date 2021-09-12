class CasestudyUsersController < ApplicationController
    def index
        @casestudies = Casestudy.all        
    end
    
    def new
       @casestudies = Casestudy.all        
       @casestudy_user = CasestudyUser.new
       @user = Role.find_by(name: "student").users
       @assesor = Role.find_by(name: "assesor").users
    end

    def create
        # @casestudy = Casestudy.find(:casestudy_id)
        #raise params.inspect
        @casestudy_user = CasestudyUser.create(casestudy_id: params[:casestudy_id], user_id: params[:casestudy_user][:user_id], assessor_id: params[:casestudy_user][:assessor_id], time_elapsed: 0, status: 0)
        if @casestudy_user.save
            redirect_to list_of_casestudies_for_assigning_path
        else
            raise @casestudy_user.errors.inspect
            redirect_to creator_dasboard_path
        end
    end

        # private
        # def casestudy_user_params
        #     params.require(:casestudy_user).permit(:user_id, :assessor_id, :casestudy_id)        
        # end
end
