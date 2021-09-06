class UserResponsesController < ApplicationController
	include ExamHelper
	def index
		@casestudy_user = CasestudyUser.find(params[:casestudy_user_id])
		@casestudy = @casestudy_user.casestudy
			
	end

	def exam
		@casestudy_user = CasestudyUser.find(params[:casestudy_user_id])
		@casestudy = @casestudy_user.casestudy
        @time = @casestudy.duration
        if @casestudy_user.status == 'Not_started'
			init_exam()
            start_exam()
        elsif @casestudy_user.status == 'in_progress' 
			# redirect to same page
		elsif @casestudy_user.status == 'submitted_but_not_assessed'
			redirect_to root_path, notice: "You have already submitted Exam"
		end
		
	end

	def update
		@user_reponse = UserResponse.find(params[:id])
	      if @user_reponse.update(response: params[:user_response][:response])
	        	redirect_to start_exam_path(casestudy_user: @casestudy_user), notice: "Answer saved"
	      else
				redirect_to start_exam_path(casestudy_user: @casestudy_user), notice: "Something is Wrong... Ans is not saved" 
	      end
	end

	def submit
		final_submit()
		redirect_to root_path, notice: "Exam Submitted Successfully and Logged out"
	end
end