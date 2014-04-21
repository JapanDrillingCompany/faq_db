# -*- coding: utf-8 -*-
# Publicity::QaCategories Controller
# 株主総会、決算説明会用の想定問答(Question Answer)の分類について管理するコントローラーです。
# Inherited ResourcesによりControllerの抽象化を行っている。
# Author:: 藤本弘志 (mailto:hfujimoto@gmail.com)

# Publicity::QaCategories Controller Class
class Publicity::QaCategoriesController < InheritedResources::Base
  load_and_authorize_resource :class => "Publicity::QaCategory"
end