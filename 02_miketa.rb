###############################  反省  ###################################
# printメソッドを使えば改行されないから、もっと楽にできた
# 日付が１桁の場合と２桁の場合、rjustやprintfメソッドを使えば簡単できそう
# okamotoさんがmoduleを使っていて、面白かった
# 
##########################################################################

# frozen_string_literal: true

require 'date'

DAYS_OF_WEEK = ' Su Mo Tu We Th Fr Sa'
today = Date.today

# 月初日と月末日
firstday = Date.new(today.year, today.month, 1)
lastday = (firstday >> 1) - 1

# (NO.1) 1日から31日の配列を作る
date_array = (firstday.day..lastday.day).to_a

# (NO.2) スペースの配列を作る（1桁の日付の場合はスペース2つ、2桁の日付の場合はスペース1つ）
spacing_array = []
9.times { spacing_array << '  ' }
(lastday.day - 9).times { spacing_array << ' ' }

# (NO.3) 曜日の配列を作る (日:1, 月:2, 火:3, 水:4, 木:5, 金:6, 土:0)
day_of_week_array = date_array.map { |n| (n + firstday.cwday) % 7 }

# (NO.1 ~ 3)の配列を合体させ、配列の配列を作る
# 例 => [[1, '  ', 3][2, '  ', 4]..[31, ' ', 5]]
joined_array = date_array.zip(spacing_array, day_of_week_array)

# カレンダー本体（1~31）で埋め尽くされる部分を作る
calendar_body = ''
joined_array.each do |date, space, day_of_week|
  calendar_body += if day_of_week.zero?
                    # 土曜日である場合は改行する
                    space + date.to_s + "\n"
                   else
                    # 土曜日ではないので改行しない
                    space + date.to_s
                   end
end

# カレンダー本体の最初の行の空白を作る
spacing_coefficient = firstday.strftime('%w').to_i * 3
spacing = ' ' * spacing_coefficient

# カレンダーを出力する
puts today.strftime("      %B %Y \n")
puts DAYS_OF_WEEK
puts spacing + calendar_body
