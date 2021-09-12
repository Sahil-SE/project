class AssessorResponsesController < ApplicationController
    include EvalHelper
    def index
        @casestudy_users = CasestudyUser.where(assessor_id: current_user.id)
        #raise @casestudy_users.inspect
		# @casestudy = @casestudy_user.casestudy
    end

    def eval
        @casestudy_user = CasestudyUser.find(params[:casestudy_user_id])
        @casestudy = @casestudy_user.casestudy
            #raise @casestudy_user.inspect
		init_eval()
        start_eval()

    end

    def update
        @assessor_response = AssessorResponse.find(params[:id])
        #raise 
	      if @assessor_response.update(rating: params[:assessor_response][:rating])
	        	redirect_to start_evaluation_path(casestudy_user: @casestudy_user), notice: "Evaluation saved"
	      else
				redirect_to start_evaluation_path(casestudy_user: @casestudy_user), notice: "Something is Wrong... Evaluaton is not saved" 
	      end
    end

    def submit
        final_submit()
		redirect_to root_path, notice: "Evaluation of Exam Submitted Successfully and Logged out"
    end

end
