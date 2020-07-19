# frozen_string_literal: true

# 日付を入力するとその日付が属する月のカレンダーを表示するメソッドを持ったクラス
class Calendar
  DAYS_OF_WEEK = ' Su Mo Tu We Th Fr Sa'

  def initialize(which_day)
    @specific_day = which_day
    @firstday = Date.new(which_day.year, which_day.month, 1)
    @joined_array = make_joined_array
  end

  # カレンダーを出力するメソッド
  def make_calendar
    make_first_line
    make_second_line
    make_calendar_body(@joined_array)
    puts "\n"
  end

  private

  # １行目に今月が何月何年か出力する（例 July 2020）
  def make_first_line
    puts @specific_day.strftime('      %B %Y')
  end

  # ２行目にDAYS_OF_WEEKを出力する
  def make_second_line
    puts DAYS_OF_WEEK
  end

  # カレンダーの本体部分を出力する（日付で埋め尽くされる部分）
  def make_calendar_body(joined_array)
    make_blanks_on_first_row
    calendar_body = ''
    joined_array.each do |date, blank, day_of_week|
      calendar_body += blank + date.to_s
      # 土曜日（day_of_week == 6）である場合は改行
      calendar_body += "\n" if day_of_week == 6
    end
    puts calendar_body
  end

  # 月初日の前方のブランクを作る
  # ------ 以下、事例 -------
  # Su Mo Tu We Th Fr Sa ...
  #                 1  2 ...
  def make_blanks_on_first_row
    blank_coefficient = @firstday.cwday * 3
    print ' ' * blank_coefficient
  end

  # NO.1 ~ No.3の配列を合体させ、配列の配列を作る
  # [日付, 日付の前のスペース, 曜日]という配列の配列を作る
  # 例 => [[1, '  ', 3][2, '  ', 4]..[31, ' ', 5]]
  def make_joined_array
    make_joined_array_components
    @date_array.zip(@blank_array, @day_of_week_array)
  end

  def make_joined_array_components
    lastday = (@firstday >> 1) - 1

    # (NO.1) 月初日から月末日までの配列を作る
    @date_array = (@firstday.day..lastday.day).to_a

    # (NO.2) スペースの配列を作る（1桁の日付の場合はスペース2つ、2桁の日付の場合はスペース1つ）
    @blank_array = []
    9.times { @blank_array << '  ' }
    (lastday.day - 9).times { @blank_array << ' ' }

    # (NO.3) 曜日の配列を作る (日:0, 月:1, 火:2, 水:3, 木:4, 金:5, 土:6)
    # 例：月初日が水曜日の場合、(1 + 3 - 1) % 7 => 3 となる
    # その場合、8日も水曜日なので、(8 + 3 - 1) % 7 => 3 となる
    @day_of_week_array = @date_array.map { |n| (n + @firstday.wday - 1) % 7 }
  end
end
