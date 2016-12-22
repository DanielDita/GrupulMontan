class Impression < ActiveRecord::Base
  belongs_to :post, :polymorphic=>true 
end
