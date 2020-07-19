###############################  反省  ###################################
# 日付が１桁の場合と２桁の場合、rjustやprintfメソッドを使えば簡単できそう
# 岡本さんがmoduleを使っていて、面白かった
##########################################################################

# frozen_string_literal: true

require 'date'
require './02_2_miketa_calendar'

Calendar.new(Date.today).make_calendar
