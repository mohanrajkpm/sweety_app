# view object
class UserPresenter
    def initialize(user)
        @user = user
    end

    def has_doctor?
        @user.has_role?('doctor')
    end 
end