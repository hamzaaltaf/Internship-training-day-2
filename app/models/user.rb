class User < ActiveRecord::Base
    validates_presence_of :first_name, :email, :last_name, :roll_number
    before_validation :generate_roll_number
    has_many :tasks

    
    def generate_roll_number
        self.roll_number =  6.times.map{rand(10)}.join
    end

    # User.first.tasks.create()
    # Task.create(name: "xtz", desc: "zkjashdjkhsa", user_id: User.first.id)

    # after_create
    # before_save
    # after_save
    
    # before_delete
    # after_destroy

    #  
    # after_validation
end


