# -*- coding: utf-8 -*-
# 社員のレジュメ(PDF)を発行する帳票ファイルです。
# Author:: 藤本弘志 (mailto:hfujimoto@gmail.com)
require 'jdcpdf'
class QaPdf < JdcPdf
  def initialize(qa)
    super(:top_margin => 24,
          :page_layout => :portrait, # 縦
          :page_size => "A4",
          :left_margin => 36,
          :right_margin => 24,
          :top_margin => 24,
          :bottom_margin => 24)
    @qa = qa
    header
    question
    answer
    note
  end

  def header
    text "想定問答カード #{ @qa.id}", :size => 20, :style => :bold, :align => :center
    text "#{ @qa.qa_category.name unless @qa.qa_category.blank?}", :size => 14, :align => :right
    text "日本海洋掘削株式会社 総務部", :size => 14, :align => :right
  end

  def question
    move_down(20)
      text "質問事項", :size => 12, :align => :center
    move_down(5)
      text @qa.question, :size => 16, :style => :bold, :align => :left
  end

  def answer
    move_down(20)
      text "回答", :size => 12, :align => :center
    move_down(5)
      text @qa.answer, :size => 16, :style => :bold, :align => :left
  end

  def note
    move_down(10)
    text "以上、ご回答申し上げました。", :size => 14, :align => :right
    move_down(10)
    text "参考", :size => 14, :align => :right
    text @qa.note, :size => 12, :style => :bold, :align => :left
  end
end

