# -*- coding: utf-8 -*-
# 社員のレジュメ(PDF)を発行する帳票ファイルです。
# Author:: 藤本弘志 (mailto:hfujimoto@gmail.com)
require 'jdcpdf'
class QasPdf < JdcPdf
  def initialize(qas)
    super(:top_margin => 24,
          :page_layout => :portrait, # 縦
          :page_size => "A4",
          :left_margin => 36,
          :right_margin => 24,
          :top_margin => 24,
          :bottom_margin => 24)
    @qas = qas
    header
    qas_list
  end

  def header
    text "想定問答一覧", :size => 20, :style => :bold, :align => :center
    text "日本海洋掘削株式会社", :size => 14, :align => :right
    text " 総務部／総務セクション", :size => 14, :align => :right
  end

  def qas_list
    move_down(10)
    @qas.each do |qa|
       text " 質問(#{ qa.id}) #{qa.question}"
       move_down 5
       text "回答#{qa.answer}"
       # 下へ5px移動
       move_down 5
       # 罫線
       stroke_horizontal_rule
       # 下へ5px移動
       move_down 5
    end

  end

end