class ProjectValue < ApplicationRecord
  belongs_to :project
  belongs_to :value
  validates :project_id, presence: true
  validates :value_id, presence: true
end