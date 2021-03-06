class Blog < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, default_url: "default.jpg"
										validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	else
	    has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, default_url: "default.jpg",
		  							    :storage => :dropbox,
									    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
									    :path => ":style/:id_filename"
									    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	end

	validates :name, :summary, :description, presence: true
	validates_attachment_presence :image

	belongs_to :user

end