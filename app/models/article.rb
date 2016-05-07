class Article < ActiveRecord::Base
	has_many :comments, :as => :commentable, :dependent => :destroy
	validates :title, presence: true,
                    length: { minimum: 5 }
  validates :body, presence: true
  validates :author, presence: true
end
