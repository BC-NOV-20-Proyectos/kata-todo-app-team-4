require "csv"

class TodoItem < ApplicationRecord
  belongs_to :todo_list

  def completed?
    !completed_at.blank?
  end

  def self.to_csv
    attributes = %w{todo_list_id content}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |list|
        csv << attributes.map{ |attr| list.send(attr) }
      end
    end
  end
end
