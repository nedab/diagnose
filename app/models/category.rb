class Category < ActiveRecord::Base
  has_many :questions, dependent: :destroy

resourcify
end
