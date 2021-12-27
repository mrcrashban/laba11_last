class FacController < ApplicationController
  skip_before_action :output, raise: false

  def input; end

  def show
    respond_to do |format|
      format.xml { render xml: Fuc.all.to_xml }
      format.html { @all = Fuc.all }
    end
  end

  def output;
    num = params[:num]

    factorials = find_factorials(num)

    data = if factorials.nil?
             { message: "Неверные параметры запроса (num = #{num}" }
           else
             index = []
             factorial = []
             first = []
             second = []
             third = []
             find = []
             factorials.each do |elem|
               index << elem[0]
               factorial << elem[1]
               first << elem[2]
               second << elem[3]
               third << elem[4]
               find << elem[5]
             end
           end
    Fuc.create(param: num.to_i,
               index: index.join(' '),
               factorial: factorial.join(' '),
               first: first.join(' '),
               second: second.join(' '),
               third: third.join(' '),
               find: find.join(' '))
    unless Fuc.exists?(param: num)
      @result = Array.new { Array.new(6) }
      @result[0] = Fuc.find_by(param: num).index.split(' ').map { |n| String(n) }
      @result[1] = Fuc.find_by(param: num).factorial.split(' ').map { |n| String(n) }
      @result[2] = Fuc.find_by(param: num).first.split(' ').map { |n| String(n) }
      @result[3] = Fuc.find_by(param: num).second.split(' ').map { |n| String(n) }
      @result[4] = Fuc.find_by(param: num).third.split(' ').map { |n| String(n) }
      @result[5] = Fuc.find_by(param: num).find.split(' ').map { |n| String(n) }

      respond_to do |format|
        format.html { render inline: data.to_s }
        format.xml { render xml: data.to_xml }
      end
    end
  end

  private

  def find_factorials(number)
    if (number != '') && (number.to_i.to_s != '0')
      numberi = number.to_i
      @result = []
      i = 0
      first = 1
      factorial = 1
      fac_num = 1
      while i < numberi
        i += 1
        num = first * (first + 1) * (first + 2)
        if factorial < num
          @result << [i, fac_num, first, (first + 1), (first + 2), 'Нет']
          factorial = (factorial * (fac_num + 1))
          fac_num += 1
        elsif factorial == num
          @result << [i, fac_num, first, (first + 1), (first + 2), 'Да']
          first += 1
        else
          @result << [i, fac_num, first, (first + 1), (first + 2), 'Нет']
          first += 1
        end
      end
      @result
    end
  end

end