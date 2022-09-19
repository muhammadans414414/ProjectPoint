module DeviseTokenAuth
    class SessionsController < DeviseTokenAuth::ApplicationController
      before_action :set_user_by_token, only: [:destroy]
      after_action :reset_session, only: [:destroy]

      def new
        render_new_error
      end
  
      def create
        # Check
        # resource_params gives the parameters of the incoming requets. Incoming parameters are coming in the hash but keys as string, so here it is converting them into symbols
        # resource_class is a devise way of calling the models. Here resource class maps to the model of incoming request and in this case it is user
        # authenticate_keys is a unique key through which we find a record. devise by default, uses its email field and here resource_class.authentication_keys is finding email of the user class
        field = (resource_params.keys.map(&:to_sym) & resource_class.authentication_keys).first #[:email]
        @resource = nil
        if field
          email_value = get_case_insensitive_field_from_resource_params(field) # converts email into lowercase for matching the record
          
          @resource = find_resource(field, email_value)

        # find the resource by macthing symbol with value like :email=>"test_email@gmail.com"
        end
         # login is done
        if @resource && valid_params?(field, email_value) && @resource.active_for_authentication? #this return true
          valid_password = @resource.valid_password?(resource_params[:password]) # matches the password of resource with the password available in params\
          if (@resource.respond_to?(:valid_for_authentication?) && !@resource.valid_for_authentication? { valid_password }) || !valid_password # returns false
            return render_create_error_bad_credentials
          end
          
          @token = @resource.create_token
          @resource.save
          sign_in(:user, @resource)    
          
          yield @resource if block_given?
  
          render_create_success
        elsif @resource && !(@resource.active_for_authentication?)
          if @resource.respond_to?(:locked_at) && @resource.locked_at
            render_create_error_account_locked
          else
            render_create_error_not_confirmed
          end
        else
          render_create_error_bad_credentials
        end
      end
  
      def destroy
        # remove auth instance variables so that after_action does not run
        user = remove_instance_variable(:@resource) if @resource
        client = @token.client if @token.client
        @token.clear!
  
        if user && client && user.tokens[client]
          user.tokens.delete(client)
          user.save!
  
          yield user if block_given?
  
          render_destroy_success
        else
          render_destroy_error
        end
      end
  
      protected
  
      def valid_params?(key, val)
        resource_params[:password] && key && val
      end
  
      def get_auth_params
        auth_key = nil
        auth_val = nil
  
        # iterate thru allowed auth keys, use first found
        resource_class.authentication_keys.each do |k|
          if resource_params[k]
            auth_val = resource_params[k]
            auth_key = k
            break
          end
        end
  
        # honor devise configuration for case_insensitive_keys
        if resource_class.case_insensitive_keys.include?(auth_key)
          auth_val.downcase!
        end
  
        { key: auth_key, val: auth_val }
      end
  
      def render_new_error
        render_error(405, I18n.t('devise_token_auth.sessions.not_supported'))
      end
  
      def render_create_success
        
        render json: {
          data: resource_data(resource_json: @resource.token_validation_response),token: @token}
      end
  
      def render_create_error_not_confirmed
        render_error(401, I18n.t('devise_token_auth.sessions.not_confirmed', email: @resource.email))
      end
  
      def render_create_error_account_locked
        render_error(401, I18n.t('devise.mailer.unlock_instructions.account_lock_msg'))
      end
  
      def render_create_error_bad_credentials
        render_error(401, I18n.t('devise_token_auth.sessions.bad_credentials'))
      end
  
      def render_destroy_success
        render json: {
          success:true
        }, status: 200
      end
  
      def render_destroy_error
        render_error(404, I18n.t('devise_token_auth.sessions.user_not_found'))
      end
  
      private
  
      def resource_params
        params.permit(*params_for_resource(:sign_in))
      end
    end
  end