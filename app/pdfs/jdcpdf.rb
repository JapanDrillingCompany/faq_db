# -*- coding: utf-8 -*-
require 'prawn'

# rowが長く、複数ページに分割する際に利用するモジュール。
# enumerableもしくはeach_with_indexを実装したクラスにインクルードして利用する
module Splittable
  # selfを引数per_numで分割し、arrayに格納して返却する
  # start_indexを指定すると、そのindexから分割して格納する
  # 例：[1,2,3,4,5,6].split(2, 1) => [[2,3],[4,5],[6]]
  def split(per_num, start_index = 0)
    segments = []
    segment = []
    self.each_with_index do |ele, i|
      next if( i < start_index )
      segment << ele
      if(segment.size == per_num)
        segments << segment
        segment = []
      end
    end
    if(segment.size != 0)
      segments << segment
    end
    return segments
  end
end

# 帳票の標準レイアウトを指定するクラス。
# 各帳票は、本クラスを継承して作成するようにする。
# 日本語を扱うため、vendor/fonts/以下にmigmix-1p-regular.ttf、migmix-1p-bold.ttf
# をインストールしておく
class JdcPdf
  attr_accessor :d
  # コンストラクタ。基本レイアウトを設定する。
  def initialize(opts=nil)
    #default options
    opts ||= { }
    opts[:page_size] ||= "A4" # 用紙サイズ
    opts[:page_layout] ||= :portrait # 用紙向き ( 縦:portrait、横:landscape )
    opts[:top_margin] ||= 60 # 余白（上）
    opts[:left_margin] ||= 40 # 余白（左）
    opts[:right_margin]||= 30 # 余白（右）
    opts[:title] ||= ''
    opts[:compress] ||= true # PDF圧縮
    @opts = opts

    @title = opts[:title]

  end
  def pre_render
    if(@d)
      return
    end
    @d = Prawn::Document.new(@opts)
    @d.font_families.update('jdc' =>{
                           :normal => "#{Rails.root}/vendor/fonts/migmix-1p-regular.ttf",
                           :bold => "#{Rails.root}/vendor/fonts/migmix-1p-bold.ttf",
                         })
    @d.font('jdc')
  end
  def render
    p "render!!!"
    pre_render
    create # childclass must be implemented.
    @d.render
  end

  #小クラスで実装するインタフェースメソッド。
  def create
    #小クラスで実装する前提（インタフェースメソッド）。
    p "create: no implementation"
    # 以下、テスト/用にヘッダだけ作る
    #image "#{Rails.root}/public/images/jdc-logo-header.jpg"
    #text "Japan Drilling Co., Ltd.", :size => 14, :align => :center
  end
  # ページヘッダを生成する。
  def header(str = nil)
    move_down(5)
    stroke_horizontal_rule
    move_down(10)
    text str, :size => 20, :style => :bold, :align => :center
    move_down(10)
    stroke_horizontal_rule
    move_down(5)
  end
  # 各ページ本文を生成する。小クラスでは、
  # body do
  # 固有の帳票処理...
  # end
  # のように記述することで、帳票が作成される
  def body
    header(@title)
    yield
    number_pages "<page>", { :at => [bounds.right - 50, 0], :align => :right }
  end

  # 帳票作成で共通に使う処理
  # Category::RequiredTrainingTypのstatusを文字列で返却する。nilの場合は'N/A'を返却する。
  def pos_training_type_status(position_type, training_type)
    stat = Training::PositionMatrix.get_status(position_type, training_type)
    if stat.exists?
      stat[0].status
    else
      "N/A"
    end
  end

  # (非同期で)メールを送信するメソッド
  # mail_headers:Hash ActionMailerに引き渡すハッシュ。
  # opts:Hash view生成時に、erbから使う値を入れておくハッシュ。
  # opts[:async] = false と設定した場合、
  # 非同期フレームワークを介さず同期でメール送信される。
  # file_name:String 添付ファイル名称。
  def send_mail(mail_headers, opts, file_name)
    # デフォルトのメールテンプレートを設定する。
    # TrainingMatrixPdfクラスならば、"training_matrix"というテンプレートを使うように設定。
    mail_headers[:template_name] ||= self.class.to_s.demodulize.underscore.gsub(/_pdf/, '')

    AsyncMailer.send_mail(mail_headers, opts, {file_name => self})
  end

  # call from AsyncMailer
  def perform
    return render
  end
  # 本クラス自体が、Prawn::Documentのように振舞うための処理(@d に処理を委譲するdelegate pattern)
  def method_missing(sym, *args, &blk)
    if(!@d)
      p "JDC_PDF DEPRECATION WARNING: use create()."
      pre_render
    end
    # p "delegate:#{sym.to_s}"
    @d.send(sym, *args, &blk)
  end

end