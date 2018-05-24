class ValuesController < ApplicationController
  before_action :logged_in_employee,
    only:[:new, :create, :show, :send_email, :interview, :interview_confirm]
  before_action :correct_employee,
    only:[:show, :send_email, :interview, :interview_confirm]
  
  def new
    @employee = current_employee
    @value = @employee.values.build
  end
  
  def create
    @value = current_employee.values.build(value_params)
    if @value.save
      flash[:success] = "ストレスチェックが終了しました。"
      redirect_to value_path(@value)
    else
      render 'new'
    end
  end
  
  def interview_confirm
    @employee = current_employee
    @value = Value.find(params[:id])
  end
  
  def interview
    @value = Value.find(params[:id])
    if @value.high_value? && @value.interview == false && @value.projects.present?
      @value.update(interview: true)
      current_employee.send_interview_mail(@value)
      flash[:success] = "担当者へ連絡しました。"
      redirect_to @value
    else
      redirect_to @value
    end
  end
  
  def send_email
    @value = Value.find(params[:id])
    flash[:success] = "ストレスチェックの結果をEmailで送信しました。"
    redirect_to @value
    current_employee.send_result_mail(@value)
  end
  
  def show
    @employee = current_employee
    @departments = current_employee.departments
    @correct_projects = []
    @departments.each do |department|
      department.company.projects.each do |project|
      @correct_projects << project.correct_project unless project.correct_project == nil
      end
    end
    
    @value = Value.find(params[:id])  
    
    @count_a = 0
    @count_b = 0
    @count_c = 0
    
    #TODO:リファクタリング必要
    #--------A項目(ストレスの原因と考えられる因子)--------
     #a1~a7,a11~a13,a15は数値が低ければストレスが高い(値を置き換える)→replace関数を使う
    r_a1 = replace(@value.a1)
    r_a2 = replace(@value.a2)
    r_a3 = replace(@value.a3)
    r_a4 = replace(@value.a4)
    r_a5 = replace(@value.a5)
    r_a6 = replace(@value.a6)
    r_a7 = replace(@value.a7)
    r_a8 = replace(@value.a8)
    r_a9 = replace(@value.a9)
    r_a10 = replace(@value.a10)
    r_a11 = replace(@value.a11)
    r_a12 = replace(@value.a12)
    r_a13 = replace(@value.a13)
    r_a14 = replace(@value.a14)
    r_a15 = replace(@value.a15)
    r_a16 = replace(@value.a16)
    r_a17 = replace(@value.a17)
    
    #A項目の合計 a1~a7,a11~a13,a15は数値を置き換える 数値が大きいほど高ストレス
     @count_a = r_a1 + r_a2 + r_a3 + r_a4 + r_a5 + r_a6 + r_a7 + @value.a8 + @value.a9 + @value.a10 + r_a11 + r_a12 + r_a13 + @value.a14 + r_a15
    #グラフの値 数値が小さいほどストレスが高い 足した個数分割る（平均）
    #仕事の負担（量）
    sigoto_ryou = (@value.a1 + @value.a2 + @value.a3) / 3
    #仕事の負担（質）
    sigoto_situ = (@value.a4 + @value.a5 + @value.a6) / 3
    #身体負担度
    sintaihutando = @value.a7
    #職場の対人関係
    taizinkankei = (@value.a12 + @value.a13 + r_a14) / 3
    #職場環境
    syokubakankyou = @value.a15
    #コントロール度
    control = (r_a8 + r_a9 +  r_a10) / 3
    #技能活用度
    katuyoudo = @value.a11
    #仕事の適性度
    tekiseido = r_a16
    #働きがい
    hatarakigai = r_a17
    
    #--------B項目(ストレスによっておこる心身への反応)--------
    #B項目 b1~b3は数値が低ければストレスが高い(値を置き換える)→replace関数を使う
    r_b1 = replace(@value.b1)
    r_b2 = replace(@value.b2)
    r_b3 = replace(@value.b3)
    r_b4 = replace(@value.b4)
    r_b5 = replace(@value.b5)
    r_b6 = replace(@value.b6)
    r_b7 = replace(@value.b7)
    r_b8 = replace(@value.b8)
    r_b9 = replace(@value.b9)
    r_b10 = replace(@value.b10)
    r_b11 = replace(@value.b11)
    r_b12 = replace(@value.b12)
    r_b13 = replace(@value.b13)
    r_b14 = replace(@value.b14)
    r_b15 = replace(@value.b15)
    r_b16 = replace(@value.b16)
    r_b17 = replace(@value.b17)
    r_b18 = replace(@value.b18)
    r_b19 = replace(@value.b19)
    r_b20 = replace(@value.b20)
    r_b21 = replace(@value.b21)
    r_b22 = replace(@value.b22)
    r_b23 = replace(@value.b23)
    r_b24 = replace(@value.b24)
    r_b25 = replace(@value.b25)
    r_b26 = replace(@value.b26)
    r_b27 = replace(@value.b27)
    r_b28 = replace(@value.b28)
    r_b29 = replace(@value.b29)

    #B項目の合計 b1~b3は数値を置き換える
    @count_b = r_b1 + r_b2 + r_b3 + @value.b4 + @value.b5 + @value.b6 + @value.b7 + @value.b8 + @value.b9 + @value.b10 + @value.b11 + @value.b12 + @value.b13 + @value.b14 +
            @value.b15 + @value.b16 + @value.b17 + @value.b18 + @value.b19 + @value.b20 + @value.b21 + @value.b22 + @value.b23 + @value.b24 + @value.b25 + @value.b26 + @value.b27 +
            @value.b28 + @value.b29
    
    #グラフの値 数値が小さいほどストレスが高い 足した個数分割る（平均）
    #活気
    kakki = (@value.b1 + @value.b2 + @value.b3) / 3
    #イライラ感
    iraira = (r_b4 + r_b5 + r_b6) / 3
    #疲労感
    hiroukan = (r_b7 + r_b8 + r_b9) / 3
    #不安感
    huankan = (r_b10 + r_b11 + r_b12) / 3
    #抑うつ感
    yokuutukan = (r_b13 + r_b14 + r_b15 + r_b16 + r_b17 + r_b18) / 6
    #身体愁訴
    sintaisyuuso = (r_b19 + r_b20 + r_b21 + r_b22 + r_b23 + r_b24 + r_b25 + r_b26 + r_b27 + r_b28 + r_b29) / 11

     #--------C項目(ストレス反応に影響を与える他の因子)--------
    r_c1 = replace(@value.c1)
    r_c2 = replace(@value.c2)
    r_c3 = replace(@value.c3)
    r_c4 = replace(@value.c4)
    r_c5 = replace(@value.c5)
    r_c6 = replace(@value.c6)
    r_c7 = replace(@value.c7)
    r_c8 = replace(@value.c8)
    r_c9 = replace(@value.c9)
    
    #C項目の合計 値の置き換えはなし
    @count_c = @value.c1 + @value.c2 + @value.c3 + @value.c4 + @value.c5 + @value.c6 + @value.c7 + @value.c8 + @value.c9
      
    #グラフの値 数値が小さいほどストレスが高い 足した個数分割る（平均）
    #上司からのサポート
    zyousi = (r_c1 + r_c4 + r_c7) / 3
    #同僚からのサポート
    douryou = (r_c2 + r_c5 + r_c8) / 3
    #家族・友人からのサポート
    kazoku_yuuzin = (r_c3 + r_c6 + r_c9) / 3
    #仕事や生活の満足度
    sigoto_seikatu_manzokudo = (r_c1 + r_c2) / 2
    
    stress_value_a = [sigoto_ryou, sigoto_situ, sintaihutando, taizinkankei, syokubakankyou, control, katuyoudo, tekiseido, hatarakigai]
    stress_value_a_border = [2, 2, 2, 2, 2, 2, 2, 2, 2] #TODO:あとで高ストレスの値を算出しボーダーラインに変える
    stress_value_b = [kakki, iraira, hiroukan, huankan, yokuutukan, sintaisyuuso]
    stress_value_b_border = [2, 2, 2, 2, 2, 2]
    stress_value_c = [zyousi, douryou, kazoku_yuuzin, sigoto_seikatu_manzokudo]
    stress_value_c_border = [2, 2, 2, 2]
        
    chart_a_categories = ['仕事の負担（量）', '仕事の負担（質）', '身体負担度', '職場の対人関係', '職場環境', 'コントロール度', '技能活用度', '仕事の適性度',
       '働きがい']
    chart_b_categories = ['活気', 'イライラ感', '疲労感', '不安感', '抑うつ感', '身体愁訴']
    chart_c_categories = ['上司からのサポート', '同僚からのサポート', '家族や友人からのサポート', '仕事や生活の満足度']
    
    
    @chart_a = LazyHighCharts::HighChart.new("graph") do |c|
     c.chart(polar: true, type: "line")
     c.title(text: "A．仕事のストレス要因", x: -20)
     c.pane(size: "85%")
     c.xAxis(categories: chart_a_categories,
             tickmarkPlacement: 'on',
             lineWidth: 0)
     c.yAxis(gridLineInterpolation: 'polygon', lineWidth: 0, min: 0)
  
    c.legend(verticalAlign: 'top', y: 40, layout: 'vertical')
     c.series(name: 'あなたのストレス度',
              data: stress_value_a,
              pointPlacement: 'on')
     c.series(name: '高ストレス',
              data: stress_value_a_border,
              color: '#FF0000',
              pointPlacement: 'on')
    end
  
   @chart_b = LazyHighCharts::HighChart.new("graph") do |c|
     c.chart(polar: true, type: "line")
     c.title(text: "B．心身のストレス反応", x: -20)
     c.pane(size: "85%")
     c.xAxis(categories: chart_b_categories,
             tickmarkPlacement: 'on',
             lineWidth: 0)
     c.yAxis(gridLineInterpolation: 'polygon', lineWidth: 0, min: 0)
  
     c.legend(verticalAlign: 'top', y: 40, layout: 'vertical')
     c.series(name: 'あなたのストレス度',
              data: stress_value_b,
              pointPlacement: 'on')
     c.series(name: '高ストレス',
              data: stress_value_b_border,
              color: '#FF0000',
              pointPlacement: 'on')
    end
  
    @chart_c = LazyHighCharts::HighChart.new("graph") do |c|
     c.chart(polar: true, type: "line")
     c.title(text: "C．周囲のサポート", x: -20)
     c.pane(size: "85%")
     c.xAxis(categories: chart_c_categories,
             tickmarkPlacement: 'on',
             lineWidth: 0)
     c.yAxis(gridLineInterpolation: 'polygon', lineWidth: 0, min: 0)
  
     c.legend(verticalAlign: 'top', y: 40, layout: 'vertical')
     c.series(name: 'あなたのストレス度',
              data: stress_value_c,
              pointPlacement: 'on')
     c.series(name: '高ストレス',
              data: stress_value_c_border,
              color: '#FF0000',
              pointPlacement: 'on')
    end
    
  end
  
  
  private 
  
    def value_params
      params.require(:value).permit(:a1, :a2, :a3, :a4, :a5, :a6, :a7, :a8, :a9,
      :a10, :a11, :a12, :a13, :a14, :a15, :a16, :a17, :b1, :b2, :b3, :b4, :b5,
      :b6, :b7, :b8, :b9, :b10, :b11, :b12, :b13, :b14, :b15, :b16, :b17, :b18,
      :b19, :b20, :b21, :b22, :b23, :b24, :b25, :b26, :b27, :b28, :b29, :c1, :c2,
      :c3, :c4, :c5, :c6, :c7, :c8, :c9, :d1, :d2)
    end
    
    def correct_employee
      redirect_to(root_url) unless 
      current_employee == Value.find(params[:id]).employee
    end
    
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
end
