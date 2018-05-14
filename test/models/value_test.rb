require 'test_helper'

class ValueTest < ActiveSupport::TestCase
  
  def setup
    @value = values(:value_1)
  end
  
  test "should be valid" do
    assert @value.valid?
  end
  
  test "employee id should be present" do
    @value.employee_id = nil
    assert_not @value.valid?
  end
  
  test "a1 should be present and integer and real number" do
    @value.a1 = nil
    assert_not @value.valid?
    @value.a1 = 1.1
    assert_not @value.valid?
    @value.a1 = 0
    assert_not @value.valid?
    @value.a1 = -1
    assert_not @value.valid?
  end
  
  test "a2 should be present and integer and real number" do
    @value.a2 = nil
    assert_not @value.valid?
    @value.a2 = 1.1
    assert_not @value.valid?
    @value.a2 = 0
    assert_not @value.valid?
    @value.a2 = -1
    assert_not @value.valid?
  end
  
  test "a3 should be present and integer and real number" do
    @value.a3 = nil
    assert_not @value.valid?
    @value.a3 = 1.1
    assert_not @value.valid?
    @value.a3 = 0
    assert_not @value.valid?
    @value.a3 = -1
    assert_not @value.valid?
  end
  
  test "a4 should be present and integer and real number" do
    @value.a4 = nil
    assert_not @value.valid?
    @value.a4 = 1.1
    assert_not @value.valid?
    @value.a4 = 0
    assert_not @value.valid?
    @value.a4 = -1
    assert_not @value.valid?
  end
  
  test "a5 should be present and integer and real number" do
    @value.a5 = nil
    assert_not @value.valid?
    @value.a5 = 1.1
    assert_not @value.valid?
    @value.a5 = 0
    assert_not @value.valid?
    @value.a5 = -1
    assert_not @value.valid?
  end
  
  test "a6 should be present and integer and real number" do
    @value.a6 = nil
    assert_not @value.valid?
    @value.a6 = 1.1
    assert_not @value.valid?
    @value.a6 = 0
    assert_not @value.valid?
    @value.a6 = -1
    assert_not @value.valid?
  end
  
  test "a7 should be present and integer and real number" do
    @value.a7 = nil
    assert_not @value.valid?
    @value.a7 = 1.1
    assert_not @value.valid?
    @value.a7 = 0
    assert_not @value.valid?
    @value.a7 = -1
    assert_not @value.valid?
  end
  
  test "a8 should be present and integer and real number" do
    @value.a8 = nil
    assert_not @value.valid?
    @value.a8 = 1.1
    assert_not @value.valid?
    @value.a8 = 0
    assert_not @value.valid?
    @value.a8 = -1
    assert_not @value.valid?
  end
  
  test "a9 should be present and integer and real number" do
    @value.a9 = nil
    assert_not @value.valid?
    @value.a9 = 1.1
    assert_not @value.valid?
    @value.a9 = 0
    assert_not @value.valid?
    @value.a9 = -1
    assert_not @value.valid?
  end
  
  test "a10 should be present and integer and real number" do
    @value.a10 = nil
    assert_not @value.valid?
    @value.a10 = 1.1
    assert_not @value.valid?
    @value.a10 = 0
    assert_not @value.valid?
    @value.a10 = -1
    assert_not @value.valid?
  end
  
  test "a11 should be present and integer and real number" do
    @value.a11 = nil
    assert_not @value.valid?
    @value.a11 = 1.1
    assert_not @value.valid?
    @value.a11 = 0
    assert_not @value.valid?
    @value.a11 = -1
    assert_not @value.valid?
  end
  
  test "a12 should be present and integer and real number" do
    @value.a12 = nil
    assert_not @value.valid?
    @value.a12 = 1.1
    assert_not @value.valid?
    @value.a12 = 0
    assert_not @value.valid?
    @value.a12 = -1
    assert_not @value.valid?
  end
  
  test "a13 should be present and integer and real number" do
    @value.a13 = nil
    assert_not @value.valid?
    @value.a13 = 1.1
    assert_not @value.valid?
    @value.a13 = 0
    assert_not @value.valid?
    @value.a13 = -1
    assert_not @value.valid?
  end
  
  test "a14 should be present and integer and real number" do
    @value.a14 = nil
    assert_not @value.valid?
    @value.a14 = 1.1
    assert_not @value.valid?
    @value.a14 = 0
    assert_not @value.valid?
    @value.a14 = -1
    assert_not @value.valid?
  end
  
  test "a15 should be present and integer and real number" do
    @value.a15 = nil
    assert_not @value.valid?
    @value.a15 = 1.1
    assert_not @value.valid?
    @value.a15 = 0
    assert_not @value.valid?
    @value.a15 = -1
    assert_not @value.valid?
  end
  
  test "a16 should be present and integer and real number" do
    @value.a16 = nil
    assert_not @value.valid?
    @value.a16 = 1.1
    assert_not @value.valid?
    @value.a16 = 0
    assert_not @value.valid?
    @value.a16 = -1
    assert_not @value.valid?
  end
  
  test "a17 should be present and integer and real number" do
    @value.a17 = nil
    assert_not @value.valid?
    @value.a17 = 1.1
    assert_not @value.valid?
    @value.a17 = 0
    assert_not @value.valid?
    @value.a17 = -1
    assert_not @value.valid?
  end
  
  test "b1 should be present and integer and real number" do
    @value.b1 = nil
    assert_not @value.valid?
    @value.b1 = 1.1
    assert_not @value.valid?
    @value.b1 = 0
    assert_not @value.valid?
    @value.b1 = -1
    assert_not @value.valid?
  end
  
  test "b2 should be present and integer and real number" do
    @value.b2 = nil
    assert_not @value.valid?
    @value.b2 = 1.1
    assert_not @value.valid?
    @value.b2 = 0
    assert_not @value.valid?
    @value.b2 = -1
    assert_not @value.valid?
  end
  
  test "b3 should be present and integer and real number" do
    @value.b3 = nil
    assert_not @value.valid?
    @value.b3 = 1.1
    assert_not @value.valid?
    @value.b3 = 0
    assert_not @value.valid?
    @value.b3 = -1
    assert_not @value.valid?
  end
  
  test "b4 should be present and integer and real number" do
    @value.b4 = nil
    assert_not @value.valid?
    @value.b4 = 1.1
    assert_not @value.valid?
    @value.b4 = 0
    assert_not @value.valid?
    @value.b4 = -1
    assert_not @value.valid?
  end
  
  test "b5 should be present and integer and real number" do
    @value.b5 = nil
    assert_not @value.valid?
    @value.b5 = 1.1
    assert_not @value.valid?
    @value.b5 = 0
    assert_not @value.valid?
    @value.b5 = -1
    assert_not @value.valid?
  end
  
  test "b6 should be present and integer and real number" do
    @value.b6 = nil
    assert_not @value.valid?
    @value.b6 = 1.1
    assert_not @value.valid?
    @value.b6 = 0
    assert_not @value.valid?
    @value.b6 = -1
    assert_not @value.valid?
  end
  
  test "b7 should be present and integer and real number" do
    @value.b7 = nil
    assert_not @value.valid?
    @value.b7 = 1.1
    assert_not @value.valid?
    @value.b7 = 0
    assert_not @value.valid?
    @value.b7 = -1
    assert_not @value.valid?
  end
  
  test "b8 should be present and integer and real number" do
    @value.b8 = nil
    assert_not @value.valid?
    @value.b8 = 1.1
    assert_not @value.valid?
    @value.b8 = 0
    assert_not @value.valid?
    @value.b8 = -1
    assert_not @value.valid?
  end
  
  test "b9 should be present and integer and real number" do
    @value.b9 = nil
    assert_not @value.valid?
    @value.b9 = 1.1
    assert_not @value.valid?
    @value.b9 = 0
    assert_not @value.valid?
    @value.b9 = -1
    assert_not @value.valid?
  end
  
  test "b10 should be present and integer and real number" do
    @value.b10 = nil
    assert_not @value.valid?
    @value.b10 = 1.1
    assert_not @value.valid?
    @value.b10 = 0
    assert_not @value.valid?
    @value.b10 = -1
    assert_not @value.valid?
  end
  
  test "b11 should be present and integer and real number" do
    @value.b11 = nil
    assert_not @value.valid?
    @value.b11 = 1.1
    assert_not @value.valid?
    @value.b11 = 0
    assert_not @value.valid?
    @value.b11 = -1
    assert_not @value.valid?
  end
  
  test "b12 should be present and integer and real number" do
    @value.b12 = nil
    assert_not @value.valid?
    @value.b12 = 1.1
    assert_not @value.valid?
    @value.b12 = 0
    assert_not @value.valid?
    @value.b12 = -1
    assert_not @value.valid?
  end
  
  test "b13 should be present and integer and real number" do
    @value.b13 = nil
    assert_not @value.valid?
    @value.b13 = 1.1
    assert_not @value.valid?
    @value.b13 = 0
    assert_not @value.valid?
    @value.b13 = -1
    assert_not @value.valid?
  end
  
  test "b14 should be present and integer and real number" do
    @value.b14 = nil
    assert_not @value.valid?
    @value.b14 = 1.1
    assert_not @value.valid?
    @value.b14 = 0
    assert_not @value.valid?
    @value.b14 = -1
    assert_not @value.valid?
  end
  
  test "b15 should be present and integer and real number" do
    @value.b15 = nil
    assert_not @value.valid?
    @value.b15 = 1.1
    assert_not @value.valid?
    @value.b15 = 0
    assert_not @value.valid?
    @value.b15 = -1
    assert_not @value.valid?
  end
  
  test "b16 should be present and integer and real number" do
    @value.b16 = nil
    assert_not @value.valid?
    @value.b16 = 1.1
    assert_not @value.valid?
    @value.b16 = 0
    assert_not @value.valid?
    @value.b16 = -1
    assert_not @value.valid?
  end
  
  test "b17 should be present and integer and real number" do
    @value.b17 = nil
    assert_not @value.valid?
    @value.b17 = 1.1
    assert_not @value.valid?
    @value.b17 = 0
    assert_not @value.valid?
    @value.b17 = -1
    assert_not @value.valid?
  end
  
  test "b18 should be present and integer and real number" do
    @value.b18 = nil
    assert_not @value.valid?
    @value.b18 = 1.1
    assert_not @value.valid?
    @value.b18 = 0
    assert_not @value.valid?
    @value.b18 = -1
    assert_not @value.valid?
  end
  
  test "b19 should be present and integer and real number" do
    @value.b19 = nil
    assert_not @value.valid?
    @value.b19 = 1.1
    assert_not @value.valid?
    @value.b19 = 0
    assert_not @value.valid?
    @value.b19 = -1
    assert_not @value.valid?
  end
  
  test "b20 should be present and integer and real number" do
    @value.b20 = nil
    assert_not @value.valid?
    @value.b20 = 1.1
    assert_not @value.valid?
    @value.b20 = 0
    assert_not @value.valid?
    @value.b20 = -1
    assert_not @value.valid?
  end
  
  test "b21 should be present and integer and real number" do
    @value.b21 = nil
    assert_not @value.valid?
    @value.b21 = 1.1
    assert_not @value.valid?
    @value.b21 = 0
    assert_not @value.valid?
    @value.b21 = -1
    assert_not @value.valid?
  end
  
  test "b22 should be present and integer and real number" do
    @value.b22 = nil
    assert_not @value.valid?
    @value.b22 = 1.1
    assert_not @value.valid?
    @value.b22 = 0
    assert_not @value.valid?
    @value.b22 = -1
    assert_not @value.valid?
  end
  
  test "b23 should be present and integer and real number" do
    @value.b23 = nil
    assert_not @value.valid?
    @value.b23 = 1.1
    assert_not @value.valid?
    @value.b23 = 0
    assert_not @value.valid?
    @value.b23 = -1
    assert_not @value.valid?
  end
  
  test "b24 should be present and integer and real number" do
    @value.b24 = nil
    assert_not @value.valid?
    @value.b24 = 1.1
    assert_not @value.valid?
    @value.b24 = 0
    assert_not @value.valid?
    @value.b24 = -1
    assert_not @value.valid?
  end
  
  test "b25 should be present and integer and real number" do
    @value.b25 = nil
    assert_not @value.valid?
    @value.b25 = 1.1
    assert_not @value.valid?
    @value.b25 = 0
    assert_not @value.valid?
    @value.b25 = -1
    assert_not @value.valid?
  end
  
  test "b26 should be present and integer and real number" do
    @value.b26 = nil
    assert_not @value.valid?
    @value.b26 = 1.1
    assert_not @value.valid?
    @value.b26 = 0
    assert_not @value.valid?
    @value.b26 = -1
    assert_not @value.valid?
  end
  
  test "b27 should be present and integer and real number" do
    @value.b27 = nil
    assert_not @value.valid?
    @value.b27 = 1.1
    assert_not @value.valid?
    @value.b27 = 0
    assert_not @value.valid?
    @value.b27 = -1
    assert_not @value.valid?
  end
  
  test "b28 should be present and integer and real number" do
    @value.b28 = nil
    assert_not @value.valid?
    @value.b28 = 1.1
    assert_not @value.valid?
    @value.b28 = 0
    assert_not @value.valid?
    @value.b28 = -1
    assert_not @value.valid?
  end
  
  test "b29 should be present and integer and real number" do
    @value.b29 = nil
    assert_not @value.valid?
    @value.b29 = 1.1
    assert_not @value.valid?
    @value.b29 = 0
    assert_not @value.valid?
    @value.b29 = -1
    assert_not @value.valid?
  end
  
  test "c1 should be present and integer and real number" do
    @value.c1 = nil
    assert_not @value.valid?
    @value.c1 = 1.1
    assert_not @value.valid?
    @value.c1 = 0
    assert_not @value.valid?
    @value.c1 = -1
    assert_not @value.valid?
  end
  
  test "c2 should be present and integer and real number" do
    @value.c2 = nil
    assert_not @value.valid?
    @value.c2 = 1.1
    assert_not @value.valid?
    @value.c2 = 0
    assert_not @value.valid?
    @value.c2 = -1
    assert_not @value.valid?
  end
  
  test "c3 should be present and integer and real number" do
    @value.c3 = nil
    assert_not @value.valid?
    @value.c3 = 1.1
    assert_not @value.valid?
    @value.c3 = 0
    assert_not @value.valid?
    @value.c3 = -1
    assert_not @value.valid?
  end
  
  test "c4 should be present and integer and real number" do
    @value.c4 = nil
    assert_not @value.valid?
    @value.c4 = 1.1
    assert_not @value.valid?
    @value.c4 = 0
    assert_not @value.valid?
    @value.c4 = -1
    assert_not @value.valid?
  end
  
  test "c5 should be present and integer and real number" do
    @value.c5 = nil
    assert_not @value.valid?
    @value.c5 = 1.1
    assert_not @value.valid?
    @value.c5 = 0
    assert_not @value.valid?
    @value.c5 = -1
    assert_not @value.valid?
  end
  
  test "c6 should be present and integer and real number" do
    @value.c6 = nil
    assert_not @value.valid?
    @value.c6 = 1.1
    assert_not @value.valid?
    @value.c6 = 0
    assert_not @value.valid?
    @value.c6 = -1
    assert_not @value.valid?
  end
  
  test "c7 should be present and integer and real number" do
    @value.c7 = nil
    assert_not @value.valid?
    @value.c7 = 1.1
    assert_not @value.valid?
    @value.c7 = 0
    assert_not @value.valid?
    @value.c7 = -1
    assert_not @value.valid?
  end
  
  test "c8 should be present and integer and real number" do
    @value.c8 = nil
    assert_not @value.valid?
    @value.c8 = 1.1
    assert_not @value.valid?
    @value.c8 = 0
    assert_not @value.valid?
    @value.c8 = -1
    assert_not @value.valid?
  end
  
  test "c9 should be present and integer and real number" do
    @value.c9 = nil
    assert_not @value.valid?
    @value.c9 = 1.1
    assert_not @value.valid?
    @value.c9 = 0
    assert_not @value.valid?
    @value.c9 = -1
    assert_not @value.valid?
  end
  
  test "d1 should be present and integer and real number" do
    @value.d1 = nil
    assert_not @value.valid?
    @value.d1 = 1.1
    assert_not @value.valid?
    @value.d1 = 0
    assert_not @value.valid?
    @value.d1 = -1
    assert_not @value.valid?
  end
  
  test "d2 should be present and integer and real number" do
    @value.d2 = nil
    assert_not @value.valid?
    @value.d2 = 1.1
    assert_not @value.valid?
    @value.d2 = 0
    assert_not @value.valid?
    @value.d2 = -1
    assert_not @value.valid?
  end
  
end
