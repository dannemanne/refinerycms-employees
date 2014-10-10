# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Employees" do
    describe "sick_leaves" do
      refinery_login_with :refinery_user

      describe "list of sick leaves" do
        let(:employee) { FactoryGirl.create(:employee, user: logged_in_user) }
        before do
          FactoryGirl.create(:sick_leave, employee: employee, start_date: '2012-01-31')
          FactoryGirl.create(:sick_leave, employee: employee, start_date: '2012-07-31')
        end

        it "shows two items" do
          visit refinery.employees_sick_leaves_path
          page.should have_content("2012-01-31")
          page.should have_content("2012-07-31")
        end
      end

    end
  end
end
