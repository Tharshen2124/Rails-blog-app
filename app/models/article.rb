class Article < ApplicationRecord
    include Visible 
    
    #* relationship
    has_many :comments 

    #^ validation
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }

end
