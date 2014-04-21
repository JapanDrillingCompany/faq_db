# -*- coding: utf-8 -*-
# Publicity::Qas Controller
# 株主総会、決算説明会用の想定問答(Question Answer)について管理するコントローラーです。
# Inherited ResourcesによりControllerの抽象化を行っている。
# Author:: 藤本弘志 (mailto:hfujimoto@gmail.com)

# Publicity::Qas Controller Class
class Publicity::QasController < InheritedResources::Base

  def index
    @qas = Publicity::Qa.search(params).order('id DESC')
    respond_to do |format|
      format.html # index.html.erb
      format.js # index.js.erb
      format.xls { headers["Content-Type"] = "application/vnd.ms-excel"
              send_data @qas.to_xls_data(:columns => [:id, {:qa_category => [:id, :name] }, :question, :answer, :note, :created_at, :updated_at ]),
              :filename => "qas_#{Time.now.strftime('%Y_%m_%d_%H_%M_%S')}.xls" }
    end
  end

  #showメソッド。特定のUserの情報を取得します。
  def show
    @qa = Publicity::Qa.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.pdf do
        type = params[:pdftype]
        pdf_cls = nil
        if(type =~ /^[A-Z][a-zA-Z0-9_:]+$/)
          begin
            v = eval(type)
            if(v.ancestors.include?(JdcPdf))
              pdf_cls = v
            end
          rescue
          end
        end
        pdf_cls ||= QaPdf
        p pdf_cls
        pdf = pdf_cls.new(@qa)
        send_data pdf.render, :filename => "Qa#{@qa.id}_#{Time.now.strftime('%Y%m%d')}.pdf",
                                      :type => "application/pdf",
                                      :disposition => "inline"
      end
    end
  end

  def excel
    @qas = Publicity::Qa.all
    send_data @qas.to_xls_data(:columns => [:id, {:qa_category => [:id, :name] }, :question, :answer, :note, :created_at, :updated_at ]),
            :filename => "qas_#{Time.now.strftime('%Y_%m_%d_%H_%M_%S')}.xls"

  end

end
