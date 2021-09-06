module AuthServices
    class WalkinReg
        def initialize(casestudy_id:, assessor_id:, name:, email:, passkey:)
            @casestudy_id = casestudy_id
            @assessor_id = assessor_id
            @email = email
            @name = name
            @passkey = passkey
           # raise params.inspect
            #raise @passkey
            #self.call()
        end

        def call
            if @passkey != Casestudy.find(@casestudy_id).passkey
                return "passkey incorrect"
            elsif User.find_by(email: @email)
                @user_id = User.find_by(email: @email).id
                #raise params.inspect

                @casestudy_user = CasestudyUser.create(casestudy_id: @casestudy_id, user_id: @user_id, assessor_id: @assessor_id)
                return @user, notice: "user valid"
            end
            @user = User.create(name: @name, email: @email, password: "123abcdefg")
            @casestudy_user = CasestudyUser.create(casestudy_id: @casestudy_id, user_id: @user.id, assessor_id: @assessor_id)

            if @user.save && @casestudy_user.save
                return @user, notice: "User and casestudy_user created"
            else
                return @user.errors
            end
        end
    end
end