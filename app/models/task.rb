class Task < ApplicationRecord
  has_many :usertask
  has_many :users, through: :usertask
end
