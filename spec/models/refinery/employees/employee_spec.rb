require 'spec_helper'

module Refinery
  module Employees
    describe Employee do
      describe "validations" do
        let(:employee) { FactoryGirl.build(:employee) }

        it 'validates employee_no presence' do
          expect(employee).to be_valid

          employee.employee_no = ''
          expect(employee).not_to be_valid
        end
        it 'validates full_name presence' do
          expect(employee).to be_valid

          employee.full_name = ''
          expect(employee).not_to be_valid
        end
        it 'validates employee_no uniqueness' do
          expect(employee).to be_valid

          FactoryGirl.create(:employee, employee_no: employee.employee_no)
          expect(employee).not_to be_valid
        end
      end
    end
  end
end
