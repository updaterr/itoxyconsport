class AddRowToProjectTypes < ActiveRecord::Migration
  def change
    ProjectTypes.create(:name => "Dwubój siłowy")
  end
end
