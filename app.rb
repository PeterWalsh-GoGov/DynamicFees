# frozen_string_literal: true

require_relative 'lib/statements/predicate'
require_relative 'lib/terms/variable'
require_relative 'lib/terms/constant'
require_relative 'lib/variable_assignment'

require_relative 'lib/statements/negation'
require_relative 'lib/statements/disjunction'



is_adult = Predicate.new(Predicate::Operator::GREATER_THAN_OR_EQUAL, Variable.new("age"), Constant.new(18))
is_adult_movie = Predicate.new(Predicate::Operator::EQUAL, Variable.new("movie-rating"), Constant.new("Adult"))
is_not_adult_movie = Negation.new(is_adult_movie)

is_bow_hunting = Predicate.new(Predicate::Operator::EQUAL, Variable.new("bow-hunting"), Constant.new("Yes"))
is_gun_hunting = Predicate.new(Predicate::Operator::EQUAL, Variable.new("gun-hunting"), Constant.new("Yes"))

is_late = Predicate.new(Predicate::Operator::LESS_THAN, Variable.new('due-date'), Variable.new('submitted-date'))
is_week_late = Predicate.new(Predicate::Operator::LESS_THAN, Variable.new('week-from-due-date'), Variable.new('submitted-date'))

can_see_movie = Disjunction.new(is_adult, is_not_adult_movie)


age = VariableAssignment.new("age", 17)
movie_rating = VariableAssignment.new("movie-rating", "Good")

puts can_see_movie