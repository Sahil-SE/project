module ExamHelper
	def init_exam
		if @casestudy_user.status == 'Not_started'
			@casestudy.questions.each do |q|
				#raise params.inspect
				ans = q.user_responses.new(response: "###",
											casestudy_user_id: @casestudy_user.id,
											user_id: @casestudy_user.user_id)
				ans.save
				# raise ans.errors.inspect
			end
		end
	end

	def start_exam
		@casestudy_user.status = "in_progress"
		@casestudy_user.started_time = Time.now
		@casestudy_user.save
	end

	def final_submit
		@casestudy_user = CasestudyUser.find(params[:casestudy_user_id])
		@casestudy_user.status = 'submitted_but_not_assessed'
		@casestudy_user.completed_time = Time.now
		@casestudy_user.save
		sign_out current_user
	end
end