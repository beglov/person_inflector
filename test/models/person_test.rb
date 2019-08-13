require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "should not save person without data" do
    person = Person.new
    assert_not person.save
  end

  test 'full_name is incorrect' do
    person = Person.create(last_name: 'Новиков', first_name: 'Сергей', middle_name: 'Николаевич')
    assert_equal 'Новиков Сергей Николаевич', person.full_name
    person = Person.create(last_name: 'Новиков', first_name: 'Сергей')
    assert_equal 'Новиков Сергей', person.full_name
  end

  test 'person_cases is incorrect' do
    person = Person.create(last_name: 'Салтыков-Щедрин', first_name: 'Михаил', middle_name: 'Евграфович')
    assert_respond_to person, :person_cases
    assert_equal 5, person.person_cases.count

    person_case = person.person_cases.find_by(case_type: :dative)
    assert_equal 'Салтыкову-Щедрину Михаилу Евграфовичу', person_case.full_name

    person.update(last_name: 'Андрейчук', first_name: 'Саша', middle_name: '', sex: 0)
    person_case = person.person_cases.find_by(case_type: :instrumental)
    assert_equal 'Андрейчуком Сашей', person_case.full_name
  end
end
