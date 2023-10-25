class User < ApplicationRecord
  has_many :comment
  has_many :like
end
