module SessionsHelper
  
  # 渡されたcompanyでログインする
  def log_in(company)
    session[:company_id] = company.id
  end
  
  # 現在ログイン中のcompanyを返す (いる場合)
  def current_company
    # Company.find_by(id: session[:company_id])
    # @current_company = @current_company || Company.find_by(id: session[:company_id])
    @current_company ||= Company.find_by(id: session[:company_id])
  end
  
  # companyがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_company.nil?
  end
  
  def log_out
    session.delete(:company_id)
    @current_company = nil
  end
  
end
