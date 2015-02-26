# encoding: utf-8
require 'spec_helper'

describe Refinery do
  describe 'Employees' do
    describe 'employees' do
      refinery_login_with :refinery_user

      describe 'employee directory' do
        context 'when only two out of three employees has active employment contract' do
          before do
            FactoryGirl.create(:employee_with_contract, full_name: 'Jack Bower')
            FactoryGirl.create(:employee_with_contract, full_name: 'Bruce Wayne')
            FactoryGirl.create(:employee, full_name: 'James Bond')
          end

          it 'shows two items' do
            visit refinery.employees_employees_path
            expect( page ).to have_content('Jack Bower')
            expect( page ).to have_content('Bruce Wayne')
            expect( page ).not_to have_content('James Bond')
          end
        end
      end

    end
  end
end
