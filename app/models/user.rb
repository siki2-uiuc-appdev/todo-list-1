# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:tasks, { :class_name => "Task", :foreign_key => "owner_id", :dependent => :destroy })
  has_many(:next_up_tasks, -> { where status: "next up" } , { :class_name => "Task", :foreign_key => "owner_id"})
  has_many(:in_progress_tasks, -> { where status: "in progress" } , { :class_name => "Task", :foreign_key => "owner_id"})
  has_many(:done_tasks, -> { where status: "done" } , { :class_name => "Task", :foreign_key => "owner_id"})
end
