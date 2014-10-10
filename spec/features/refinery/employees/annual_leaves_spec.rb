# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Employees" do
    describe "annual_leaves" do
      refinery_login_with :refinery_user

      describe "list of annual leaves" do
        let(:employee) { FactoryGirl.create(:employee, user: logged_in_user) }
        before do
          FactoryGirl.create(:annual_leave, employee: employee, start_date: '2014-10-09')
          FactoryGirl.create(:annual_leave, employee: employee, start_date: '2014-10-16')
        end

        it "shows two items" do
          visit refinery.employees_annual_leaves_path
          page.should have_content("2014-10-09")
          page.should have_content("2014-10-16")
        end
      end

    end
  end
end
