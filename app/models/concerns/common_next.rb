module CommonNext
  extend ActiveSupport::Concern

    def previous_record
      self.class.unscoped.where('id < ?', self.id).order(:id).last
    end

    # Find Next Record Method
    def next_record
      self.class.unscoped.where('id > ?', self.id).order(:id).first
    end
end