class Group < ActiveRecord::Base
	validates :title, presence: true

	has_many :posts,dependent: :destroy
	has_many :groups_users
	has_many :participated_groups, through: :group_users, source: :group

	belongs_to :owner, class_name: "User", foreign_key: :user_id
	
	def editable_by?(user)
    user && user == owner
    end

end
