# -*- coding: utf-8 -*-
# Publicity::Qa Category Model
# 株主総会、決算説明会用の想定問答(Question Answer)の分類について管理するモデルです。
# Author:: 藤本弘志 (mailto:hfujimoto@gmail.com)

# Publicity::QaCategory Model Class
class Publicity::QaCategory < ActiveRecord::Base
    include CommonNext

  # Setting Table Name
    self.table_name = 'publicity_qa_categories'

  # Associations
    has_many :qas, :dependent => :destroy

  # Validation
    validates_presence_of :name
end