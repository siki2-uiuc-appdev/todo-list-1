# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  body       :text
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#
class Task < ApplicationRecord
end
