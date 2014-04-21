module BelongsToPerson
  extend ActiveSupport::Concern

  included do
    belongs_to :person
    #validates :person_id, :presence => true, :numericality => true

    #scopes
      scope :with_person_working, lambda { || joins(:person).where("(people.working) = ?", true) }
      scope :with_person_first_name, lambda { |value| joins(:person).where("lower(people.first_name) LIKE ?", "%#{value.downcase}%") }
      scope :with_person_last_name, lambda { |value| joins(:person).where("lower(people.last_name) LIKE ?", "%#{value.downcase}%") }
      scope :with_person_first_name_jp, lambda { |value| joins(:person).where("(people.first_name_jp) LIKE ?", "%#{value}%") }
      scope :with_person_last_name_jp, lambda { |value| joins(:person).where("(people.last_name_jp) LIKE ?", "%#{value}%") }
      scope :with_person_company_ids, lambda { |value| joins(:person).where("people.company_id in (?)", value) }
      scope :with_person_unit_ids, lambda { |value| joins(:person).where("people.unit_id in (?)", value) }
      scope :with_person_category_location_type_ids, lambda { |value| joins(:person).where("people.category_location_type_id in (?)", value) }
      scope :with_person_category_grade_type_ids, lambda { |value| joins(:person).where("people.category_grade_type_id in (?)", value) }
      scope :with_person_category_title_type_ids, lambda { |value| joins(:person).where("people.category_title_type_id in (?)", value) }
      scope :with_person_category_position_type_ids, lambda { |value| joins(:person).where("people.category_position_type_id in (?)", value) }
      scope :with_person_category_job_type_ids, lambda { |value| joins(:person).where("people.category_job_type_id in (?)", value) }
  end
end