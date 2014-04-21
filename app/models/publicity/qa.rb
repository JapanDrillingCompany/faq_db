# -*- coding: utf-8 -*-
# Publicity::Qa Model
# 株主総会、決算説明会用の想定問答(Question Answer)について管理するモデルです。
# Author:: 藤本弘志 (mailto:hfujimoto@gmail.com)

# Publicity::Qa Model Class
class Publicity::Qa < ActiveRecord::Base
    include CommonNext

# Setting Table Name
    self.table_name = 'publicity_qas'

  # Mass Assignment
    attr_accessible :category1, :category2, :question, :answer, :note, :qa_category_id, :user_id, :reffile_file_name, :reffile_content_type, :reffile_file_size, :reffile_updated_at, :classification_type_id, :category_type_id, :rate

  # Associations
    belongs_to :qa_category

  # Validation
    validates_presence_of :question

  # Named Scope
    scope :with_qa_category, lambda { |value| where("qa_category_id = ?", value) }
    scope :with_keyword, lambda { |value| where('(question || answer ) LIKE ?', "%#{value}%") }
    scope :with_category1, lambda { |value| where('category1 LIKE ?', "%#{value}%") }
    scope :with_category2, lambda { |value| where('category2 LIKE ?', "%#{value}%") }

  # Attachment
    has_attached_file :reffile,
     :storage => :s3,
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "publicity/qas/reffile/:id/:style.:extension",
     :url  => ":s3_domain_url"

  # Search Method
    def self.search(params)
      qas = all
      qas = qas.with_keyword(params[:keyword]) unless params[:keyword].blank?
      qas = qas.with_qa_category(params[:qa_category_id]) unless params[:qa_category_id].blank?
      qas = qas.with_category1(params[:category1]) unless params[:category1].blank?
      qas = qas.with_category2(params[:category2]) unless params[:category2].blank?
      qas = qas.page(params[:page])
      qas = qas.per(500)
    end

end
