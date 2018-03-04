module ApplicationHelper
   require 'rqrcode'
   require 'rqrcode_png'
   require 'chunky_png'
   
   
    # ページごとの完全なタイトルを返します。
  def full_title(page_title = '')
    base_title = "Stress App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  
  #性別を文字列に置き換える
  def replace_sex(sex_val)
    if sex_val == 1 
      "男性"
    else
      "女性"
    end
  end
  
  
  def divide_a(x)
    case x
    when 1 then
      p "そうだ"
    when 2 then
      p "まあそうだ"
    when 3 then
      p "ややちがう"
    when 4 then
      p "ちがう"
    end
  end
  
  def divide_b(x)
    case x
    when 1 then
      p "ほとんどなかった"
    when 2 then
      p "ときどきあった"
    when 3 then
      p "しばしばあった"
    when 4 then
      p "ほとんどいつもあった"
    end
  end
  
  def divide_c(x)
    case x
    when 1 then
      p "非常に"
    when 2 then
      p "かなり"
    when 3 then
      p "多少"
    when 4 then
      p "全くない"
    end
  end
  
  def divide_d(x)
    case x
    when 1 then
      p "満足"
    when 2 then
      p "まあ満足"
    when 3 then
      p "やや不満足"
    when 4 then
      p "不満足"
    end
  end
  
  
  def high_stress(count_a:, count_b:, count_c:)
    stress_sum = count_a + count_b + count_c
    high_stress = false
    
    if stress_sum >= 77 || (count_a + count_c >= 76 && count_b >= 63)
      high_stress = true
      p "あなたは高ストレス者に該当します" + "合計:#{stress_sum}, A項目:#{count_a}, B項目:#{count_b}, C項目:#{count_c}"
    else
      p "あなたは高ストレス者に該当しません"+ "合計:#{stress_sum}, A項目:#{count_a}, B項目:#{count_b}, C項目:#{count_c}"
    end
    
  end
  
  
  def stress_check(count_a:, count_b:, count_c:)
    stress_sum = count_a + count_b + count_c
    
    good_comment = <<-EOS
  ストレス状況は低めな状態にあるようです。
  仕事に対してのストレスとの付き合い方がうまく、ストレス状況は低めであるようです。
  またストレスからくる心身への影響も少ないようです。
  EOS
  
    soso_comment = <<-EOS
  ストレスの原因となる因子が少しあるようです。
  仕事にかかわる時間は一日のうちの多くを占めるので、仕事の量の多さや忙しさ、
  仕事の性質、仕事に対してコントロールできる度合いなど、その他様々な出来事が
  ストレスの原因になり得ます。日々の仕事の中で、ストレスとなる原因について
  考えてみましょう。
  EOS
  
    bad_comment = <<-EOS
  ストレス状況は高めな状態にあるようです。
  日々の仕事の中で、ストレスフルな日常を送っている可能性があります。
  ストレスの状態が続くと、心や身体がストレスの原因に対して反応し、その結果として、
  気分が落ち込む、イライラ感がつのる、疲れる、元気がないといった症状が現れます。
  また気分だけでなく、体の不調として現れてくる事もあります。日々の仕事の中で、
  ストレスとなる原因について考え、ストレス低減していくことが必要です。
  EOS
    
    if stress_sum >= 77 || (count_a + count_c >= 76 && count_b >= 63)
      p bad_comment
    elsif stress_sum < 40
      p good_comment
    else
      p soso_comment
    end
    
  end
  
  def date_conversion(date)
    return date.strftime("%Y年%m月%d日 %H時%M分") 
  end



  def qrcode_tag(text, options = {})
    qr = ::RQRCode::QRCode.new(text)
    return ChunkyPNG::Image.from_datastream(qr.as_png.resize(250,250).to_datastream).to_data_url
  end
  

end
