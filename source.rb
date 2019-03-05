require 'faker'


def quote_generator(n)
    n.times do
        puts Faker::GreekPhilosophers.quote
    end
end

stage_1 = quote_generator(10)

#stage_1 generates the first stage of quotes ('Level 1')

# def accuracy_calculator(input, quote_generator)
# input = []
# quote = stage_1.split
# quote_to_array = quote.chars


# end
####### ABOVE = ACCURACY CALCULATOR, NOT COMPLETE

