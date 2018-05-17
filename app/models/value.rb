class Value < ApplicationRecord
  belongs_to :employee
  has_many :project_values, dependent: :destroy
  has_many :projects, through: :project_values
  validates :employee_id, presence: true
  default_scope -> { order(created_at: :desc) }
  validates :a1, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :a2, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :a3, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :a4, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :a5, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :a6, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :a7, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :a8, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :a9, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :a10, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :a11, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :a12, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :a13, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :a14, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :a15, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :a16, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :a17, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b1, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b2, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b3, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b4, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b5, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b6, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b7, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b8, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b9, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b10, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b11, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b12, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b13, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b14, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b15, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b16, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b17, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b18, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b19, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b20, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b21, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b22, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b23, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b24, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b25, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b26, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b27, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b28, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :b29, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :c1, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :c2, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :c3, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :c4, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :c5, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :c6, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :c7, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :c8, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :c9, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :d1, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :d2, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
 
  #実施回とストレス値の関連付け
  def belong(project)
    projects << project
  end
  
  #実施回とストレス値の関連付けがあるか
  def belong?(project)
    projects.include?(project)
  end
  
  #従業員の他のストレス値がこの実施回に属していなければfalse,一つでも属していればture
  def super_belong?(project)
    other_values = self.employee.values.select{ |value| value != self && !value.blank? }
    return false if other_values.blank? 
    #従業員の他のストレス値がこの実施回に属していなければfalse,一つでも属していればture
    other_values.each do |value|
      return true if value.belong?(project)
    end
    return false
  end
  
  #実施回とストレス値の関連付けを解消
  def escape(project)
    projects.delete(project)
  end
  
  #値の置換
  def replace(x)
    case x
    when 1 then
      4
    when 2 then
      3
    when 3 then
      2
    when 4 then
      1
    end
  end
  
  #高ストレスか判定
  def high_value?
    count_a = 0
    count_b = 0
    count_c = 0
    #A項目の合計 a1~a7,a11~a13,a15は数値を置き換える 数値が大きいほど高ストレス
    r_a1 = replace(self.a1)
    r_a2 = replace(self.a2)
    r_a3 = replace(self.a3)
    r_a4 = replace(self.a4)
    r_a5 = replace(self.a5)
    r_a6 = replace(self.a6)
    r_a7 = replace(self.a7)
    r_a11 = replace(self.a11)
    r_a12 = replace(self.a12)
    r_a13 = replace(self.a13)
    r_a15 = replace(self.a15)
    
    count_a = r_a1 + r_a2 + r_a3 + r_a4 + r_a5 + r_a6 + r_a7 + self.a8 +
              self.a9 + self.a10 + r_a11 + r_a12 + r_a13 + self.a14 + r_a15
     
    #B項目 b1~b3は数値が低ければストレスが高い(値を置き換える)→replace関数を使う
    r_b1 = replace(self.b1)
    r_b2 = replace(self.b2)
    r_b3 = replace(self.b3)
    #B項目の合計 b1~b3は数値を置き換える
    count_b = r_b1 + r_b2 + r_b3 + self.b4 + self.b5 + self.b6 + self.b7 +
              self.b8 + self.b9 + self.b10 + self.b11 + self.b12 + self.b13 +
              self.b14 + self.b15 + self.b16 + self.b17 + self.b18 + self.b19 +
              self.b20 + self.b21 + self.b22 + self.b23 + self.b24 + self.b25 +
              self.b26 + self.b27 + self.b28 + self.b29
  
  #C項目の合計 値の置き換えはなし
    count_c = self.c1 + self.c2 + self.c3 + self.c4 + self.c5 + self.c6 +
              self.c7 + self.c8 + self.c9
              
    stress_sum = count_a + count_b + count_c
    if stress_sum >= 77 || (count_a + count_c >= 76 && count_b >= 63)
      true
    else
      false
    end
  end
  
end
