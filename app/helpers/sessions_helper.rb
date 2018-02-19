module SessionsHelper
  
  # 渡されたcompanyでログインする
  def log_in_company(company)
    session[:company_id] = company.id
  end
  
   # 渡されたcompanyでログインする
  def log_in_employee(employee)
    session[:employee_id] = employee.id
  end
  
  # 現在ログイン中のcompanyを返す (いる場合)
  def current_company
    # Company.find_by(id: session[:company_id])
    # @current_company = @current_company || Company.find_by(id: session[:company_id])
    @current_company ||= Company.find_by(id: session[:company_id])
  end
  
  # 現在ログイン中のemployeeを返す (いる場合)
  def current_employee
    @current_employee ||= Employee.find_by(id: session[:employee_id])
  end
  
  # 渡されたcompanyがログイン中のcompanyか返す
  def current_company?(company)
    company == current_company
  end
  
  # 渡されたemployeeがログイン中のemployeeか返す
  def current_employee?(employee)
    employee == current_employee
  end
  
  # companyがログインしていればtrue、その他ならfalseを返す
  def logged_in_company?
    !current_company.nil?
  end
  
  # employeeがログインしていればtrue、その他ならfalseを返す
  def logged_in_employee?
    !current_employee.nil?
  end
  
  def log_out_company
    session.delete(:company_id)
    @current_company = nil
  end
  
  def log_out_employee
    session.delete(:employee_id)
    @current_employee = nil
  end
end
