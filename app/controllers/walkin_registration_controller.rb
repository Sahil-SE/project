class WalkinRegistrationController < ApplicationController
    require '/home/jombay-admin/projects/simulation_6/app/services/auth_services/walkin_reg.rb'
    def new

    end

    def create
        #raise params.inspect

        record = AuthServices::WalkinReg.new(casestudy_id: params[:casestudy_id], assessor_id: params[:assessor_id], name: params[:name], email: params[:email], passkey: params[:passkey]).call
       # raise record.inspect
       #raise record.inspect

        if record.class == User
            sign_in record
            redirect_to user_dashboard_path
        elsif record == "user valid"
            redirect_to user_dashboard_path, notice: record
        elsif record == "passkey incorrect"
            redirect_to root_path, notice: record
        else
            #raise record.inspect
            redirect_to root_path
        end
    end
end
