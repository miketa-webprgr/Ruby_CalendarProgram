###############################  反省  ###################################
# 日付が１桁の場合と２桁の場合、rjustやprintfメソッドを使えば簡単できそう
# okamotoさんがmoduleを使っていて、面白かった
##########################################################################

# frozen_string_literal: true

require 'date'

DAYS_OF_WEEK = ' Su Mo Tu We Th Fr Sa'
@today = Date.today

# require 'byebug'; byebug

# カレンダーを出力するメソッド
def make_calendar(which_day)
  puts which_day.strftime('      %B %Y')
  puts DAYS_OF_WEEK

  find_firstday(which_day)
  make_blanks_on_first_row
  make_joined_array_components

  joined_array = make_joined_array(@date_array, @blank_array, @day_of_week_array)
  make_calendar_body(joined_array).to_s
  puts "\n"
end

def find_firstday(which_day)
  @firstday = Date.new(which_day.year, which_day.month, 1)
end

def make_joined_array_components
  lastday = (@firstday >> 1) - 1

  # (NO.1) 月初日から月末日までの配列を作る
  @date_array = (@firstday.day..lastday.day).to_a

  # (NO.2) スペースの配列を作る（1桁の日付の場合はスペース2つ、2桁の日付の場合はスペース1つ）
  @blank_array = []
  9.times { @blank_array << '  ' }
  (lastday.day - 9).times { @blank_array << ' ' }

  # (NO.3) 曜日の配列を作る (日:1, 月:2, 火:3, 水:4, 木:5, 金:6, 土:7)
  # 例：月初日が水曜日の場合、(1 + 3) % 7 => 4 となる
  @day_of_week_array = @date_array.map { |n| (n + @firstday.cwday) % 7 }
end

# カレンダー本体の最初の行の空白を作る
def make_blanks_on_first_row
  blank_coefficient = @firstday.cwday * 3
  print ' ' * blank_coefficient
end

# (NO.1 ~ 3)の配列を合体させ、配列の配列を作る
# [日付, 日付の前のスペース, 曜日]という配列の配列を作る
# 例 => [[1, '  ', 3][2, '  ', 4]..[31, ' ', 5]]
def make_joined_array(date_array, blank_array, day_of_week_array)
  date_array.zip(blank_array, day_of_week_array)
end

# カレンダーの本体部分を作る（日付で埋め尽くされる部分）
def make_calendar_body(joined_array)
  calendar_body = ''
  joined_array.each do |date, blank, day_of_week|
    calendar_body += if day_of_week.zero?
                       # 土曜日である場合は改行する
                       blank + date.to_s + "\n"
                     else
                       # 土曜日ではないので改行しない
                       blank + date.to_s
                     end
  end
  puts calendar_body
end

# 今月のカレンダーを出力する
make_calendar(@today)
