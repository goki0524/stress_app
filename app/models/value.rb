class Value < ApplicationRecord
  belongs_to :employee
  default_scope -> { order(created_at: :desc) }
  validates :a1, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :a2, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :a3, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :a4, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :a5, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :a6, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :a7, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :a8, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :a9, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :a10, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :a11, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :a12, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :a13, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :a14, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :a15, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :a16, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :a17, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b1, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b2, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b3, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b4, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b5, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b6, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b7, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b8, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b9, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b10, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b11, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b12, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b13, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b14, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b15, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b16, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b17, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b18, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b19, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b20, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b21, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b22, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b23, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b24, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b25, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b26, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b27, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b28, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :b29, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :c1, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :c2, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :c3, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :c4, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :c5, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :c6, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :c7, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :c8, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :c9, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :d1, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  # validates :d2, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
 
end
