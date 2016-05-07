class Comment < ActiveRecord::Base
	belongs_to :commentable, :polymorphic => true     
  has_many :comments, :as => :commentable
  def article
  	return @article if defined?(@article)
  	@article = commentable.is_a?(Article) ? commentable : commentable.article
	end
end
