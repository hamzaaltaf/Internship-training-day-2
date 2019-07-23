class Student < ActiveRecord::Base
    # name, rollno, #email
    validates_presence_of :name, :email
    validates :name, :email, presence: true, uniqueness: true, on: :create
    before_create :generate_rollno
    
    def generate_rollno
        self.rollno = (0..6).map {|a| rand(10)}.join
    end

    def detail
        {
                id: self.id,
                name: self.name,
                email: self.email
        }
    end
end
