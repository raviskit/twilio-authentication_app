class AuthyJob < ActiveJob::Base

  def perform(user_contact, country_code, user_email)
    # this is a fallback procedure gets active when twilio is down
     conn = Faraday.new(:url => 'https://api.authy.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
     end

    registered_user =   conn.post '/protected/json/users/new', { "api_key" => Rails.application.secrets.authy_key, "user[cellphone]" => "#{user_contact}", "user[email]" => "#{user_email}", "user[country_code]" => "#{country_code}" }
    _added_user = JSON.parse(registered_user.body)

     if _added_user["success"]
       user_id = _added_user["user"]["id"]
       authenticate_user = conn.post do |req|
        req.url "/onetouch/json/users/#{user_id}/approval_requests"
        req.headers['Content-Type'] = 'application/json'
        req.body =    '{
             "api_key": "#{Rails.application.secrets.authy_key}",
             "message": "Login requested for a CapTrade Bank account.",
             "details[username]": "#{user_email}",
             "details[location]": "Bangalore, INDIA",
             "details[Account Number]": "#{country_code}#{user_contact}",
             "seconds_to_expire": "120"
           }'
       end
       # save user authy_id 
        _succeeded = JSON.parse(authenticate_user.body)
     end
     #return _succeeded, _added_user
     return [], _added_user
  end
end
