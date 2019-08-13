class Person < ApplicationRecord
  has_many :person_cases, dependent: :destroy

  validates :first_name, :full_name, presence: true

  before_validation :set_full_name
  after_save :create_person_cases

  def sex_label
    return '' if sex.nil?
    sex? ? 'Ж' : 'М'
  end

  def sex_to_sym
    return nil if sex.nil?
    sex? ? :female : :male
  end

  private

  def set_full_name
    self.full_name = [last_name, first_name, middle_name].reject(&:blank?).join(' ')
  end

  def create_person_cases
    person_cases.delete_all

    Petrovich::CASES.reject { |i| i == :nominative }.each do |case_type|
      petrovich = Petrovich(
          lastname: last_name,
          firstname: first_name,
          middlename: middle_name,
          gender: sex_to_sym,
      ).to(case_type)

      person_cases.create(
          case_type: case_type,
          first_name: petrovich.firstname,
          last_name: petrovich.lastname,
          middle_name: petrovich.middlename,
          full_name: petrovich.to_s.strip,
      )
    end
  end
end
