class UserResponsesController < ApplicationController
	include ExamHelper
	def index
		@casestudy_users = CasestudyUser.where(user_id: current_user.id )
		#raise @casestudy_users.inspect
		#@casestudy = @casestudy_user.casestudy
		
	end

	def exam
		#raise params.inspect
		@casestudy_user = CasestudyUser.find(params[:casestudy_user_id])
		@casestudy = @casestudy_user.casestudy
        @duration = @casestudy.duration
        if @casestudy_user.status == 'Not_started'
			init_exam()
            start_exam()
			@time_elapsed = @casestudy_user.time_elapsed
			@time_remaining = (Time.now + (@casestudy_user.casestudy.duration*60 - @time_elapsed)).to_s
        elsif @casestudy_user.status == 'in_progress'
			@time_elapsed = @casestudy_user.time_elapsed
			@time_remaining = (Time.now + (@casestudy_user.casestudy.duration - @time_elapsed)).to_s
			# redirect to same page
		elsif @casestudy_user.status == 'submitted_but_not_assessed'
			redirect_to root_path, notice: "You have already submitted Exam"
		elsif @casestudy_user.status == 'submitted_and_assessed'
			redirect_to root_path, notice: "You have already submitted Exam"
		end
		
	end

	def update
		@user_reponse = UserResponse.find(params[:format])
	      if @user_reponse.update(response: params[:response])
	        	redirect_to start_exam_path(casestudy_user: @casestudy_user), notice: "Answer saved"
	      else
				redirect_to start_exam_path(casestudy_user: @casestudy_user), notice: "Something is Wrong... Ans is not saved" 
	      end
	end

	def update_time
		puts "******************"
		@casestudy_user = CasestudyUser.find(params[:casestudy_user_id])
		duration = @casestudy_user.casestudy.duration
		@time_elapsed = @casestudy_user.time_elapsed + 5
		@casestudy_user.update(time_elapsed: @time_elapsed)
		puts @casestudy_user.time_elapsed
	end

	def submit
		final_submit()
		redirect_to root_path, notice: "Exam Submitted Successfully"
	end
end