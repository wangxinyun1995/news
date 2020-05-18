class Email < ApplicationRecord
  scope :in_time, ->{where("time > ? and time < ?", Time.current.at_beginning_of_day, Time.current.at_end_of_day)}
end
