# -*- encoding : utf-8 -*-
class V1::Overrides::TokenValidationController < DeviseTokenAuth::TokenValidationsController
    def validate_token
       # @resource will have been set by set_user_by_token concern
       if @resource
         render json: {
             data: {
                         "access-token": request.headers[acess-token],
                         "token-type": request.headers[token-type],
                         "client": request.headers[client],
                         "expiry": request.headers[expiry],
                         "uid": request.headers[uid]
                         }

         }
       else
         render json: {
           success: false,
           errors: ["Invalid login credentials"]
         }, status: 401
       end
     end
end
