module ExamManager
	def initialize(casestudy_user)
		@casestudy_user = casestudy_user
		if @casestudy_user.status == 0
			@casestudy.questions.each do |q|
				ans = q.user_responses.new(response: "Not answered yet...",
											casestudy_user_id: @casestudy_user.id,
											user_id: @casestudy_user.user_id)
				ans.save
				# raise ans.errors.inspect
			end
		end
	end

	def start_exam
		@casestudy_user.status = 1
		@casestudy_user.started_time = Time.now
		@casestudy_user.save
	end

	def final_submit
		@casestudy_user = CasestudyUser.find(params[:casestudy_user_id])
		@casestudy_user.status = 2
		@casestudy_user.completed_time = Time.now
		@casestudy_user.save
		sign_out current_user
	end
end