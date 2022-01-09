require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
end


def operation_to_message(op)
  case op
  when '1' then prompt(messages('adding'))
  when '2' then prompt(messages('subtracting'))
  when '3' then prompt(messages('multiplying'))
  when '4' then prompt(messages('dividing'))
  end
end

prompt(messages('welcome'))

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt(messages('enter name'))
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt(messages('first number'))
    number1 = gets.chomp

    if number?(number1)
      break
    else
      prompt(messages('valid number'))
    end
  end

  number2 = ''
  loop do
    prompt(messages('second number'))
    number2 = gets.chomp

    if number?(number2)
      break
    else
      prompt(messages('valid number'))
    end
  end

  prompt(messages('operator'))

  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else prompt("Must choose 1, 2, 3 or 4.")
    end
  end

  prompt(operation_to_message(operator))
  result =  case operator
            when '1' then number1.to_f + number2.to_f
            when '2' then number1.to_f - number2.to_f
            when '3' then number1.to_f * number2.to_f
            when '4' then number1.to_f / number2.to_f
            end

  prompt(messages('result') + " #{result}.")

  prompt(messages('again'))
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(messages('goodbye'))
