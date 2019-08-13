class PersonCase < ApplicationRecord
  belongs_to :person

  CASE_SYM_TO_LABEL = {
      nominative: 'Именительный',
      genitive: 'Родительный',
      dative: 'Дательный',
      accusative: 'Винительный',
      instrumental: 'Творительный',
      prepositional: 'Предложный',
  }

  def case_label
    CASE_SYM_TO_LABEL[case_type.to_sym]
  end
end
