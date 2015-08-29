class Photo < ActiveRecord::Base
  belongs_to :art, :polymorphic => true

  has_attached_file :image, :styles=>{:medium => "100x100>", :thumb => "50x50>"}
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)  
end

