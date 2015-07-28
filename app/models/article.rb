class Article < ActiveRecord::Base
   acts_as_likeable
    belongs_to :user
    has_many :likes
	has_many :comments, dependent: :destroy
	validates :post, presence: true,
                    length: { minimum: 1 }
    validates :description, presence: true,
                    length: { minimum: 1 }
    has_attached_file :photo
    validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

    has_attached_file :video
 
  #  def self.search(search)
  # if search
  #   where(:Post => ['Post LIKE ?', "%#{search}%"])
  # else
  #   find(:all)
  # end


def self.search(search)

  where("post||description LIKE ?", "%#{search}%") 
     


end
end   


