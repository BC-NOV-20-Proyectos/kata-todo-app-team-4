require "csv"

class TodoList < ApplicationRecord
    has_many :todo_items, dependent: :delete_all


    def self.to_csv
      attributes = %w{id title}

      CSV.generate(headers: true) do |csv|
        csv << attributes

        all.each do |list|
          csv << attributes.map{ |attr| list.send(attr) }
        end
      end
    end

end
