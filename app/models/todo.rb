require "date"

class Todo < ApplicationRecord
  validates :todo_text, presence: true, length: { minimum: 2 }
  validates :due_date, presence: true
  belongs_to :user

  def add(record)
    Todo.new(record)
  end

  def self.of_user(user)
    all.where(user_id: user.id)
  end

  def self.overdue
    all.where("due_date < ?", Date.today)
  end

  def self.due_today
    all.where("due_date = ?", Date.today)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def self.completed
    all.where(completed: true)
  end

  def self.show_list
    puts "Over due"
    puts overdue.showlist

    puts "Due today"
    puts due_today.showlist

    puts "Due later"
    puts due_later.showlist
  end

  def to_s
    return ":id => #{self.id}, :todo_text => #{self.todo_text}, :due_date => #{self.due_date}"
  end
end
