class Question < ActiveRecord::Base
belongs_to :category, :foreign_key => 'category_id'
validates :category , :presence => true

resourcify
end
