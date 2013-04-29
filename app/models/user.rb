require 'paperclip'

class User < ActiveRecord::Base    
  validates :name, :presence => true    
  validates :email, :presence => true
  
  #has_attached_file :pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :attach

  ACCESS_KEY_ID = 'AKIAJDPPPEEFNVBFDP7A'
  SECRET_ACCESS_KEY = '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'
  BUCKET = '10021testbucket'

  has_attached_file :pic,
    :storage => 's3',
    :bucket => BUCKET,
    :path => "uploads/:attachment/:id/:styles.:extension",
    :styles => {
      :medium => "300x300>",
      :thumb => "100x100>" },
    :s3_credentials => {
      :access_key_id => ACCESS_KEY_ID,
      :secret_access_key => SECRET_ACCESS_KEY },
    :s3_permissions => 'public-read'

end
