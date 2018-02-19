module ApplicationHelper
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

end
