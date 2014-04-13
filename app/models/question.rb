class Question < ActiveRecord::Base
resourcify
belongs_to :category, :foreign_key => 'category_id'
validates :title, :presence => true
validates :content , :presence => true
validates :right , :presence => true
validates :category , :presence => true
validates :exercise , :presence => true
end
