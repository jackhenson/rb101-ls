require 'pry'
LANGUAGE = 'en'

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
  when '1' then messages('adding', LANGUAGE)
  when '2' then messages('subtracting', LANGUAGE)
  when '3' then messages('multiplying', LANGUAGE)
  when '4' then messages('dividing', LANGUAGE)
  end
end

prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt(messages('valid name', LANGUAGE))
  else
    break
  end
end
binding.pry
prompt(messages('hi', LANGUAGE) + " #{name}")

loop do # main loop
  number1 = ''
  loop do
    prompt(messages('first number', LANGUAGE))
    number1 = gets.chomp

    if number?(number1)
      break
    else
      prompt(messages('valid number', LANGUAGE))
    end
  end

  number2 = ''
  loop do
    prompt(messages('second number'))
    number2 = gets.chomp

    if number?(number2)
      break
    else
      prompt(messages('valid number', LANGUAGE))
    end
  end

  prompt(messages('operator', LANGUAGE))

  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else prompt(messages('valid op', LANGUAGE))
    end
  end

  prompt(operation_to_message(operator))
  result =  case operator
            when '1' then number1.to_f + number2.to_f
            when '2' then number1.to_f - number2.to_f
            when '3' then number1.to_f * number2.to_f
            when '4' then number1.to_f / number2.to_f
            end

  prompt(messages('result', LANGUAGE) + " #{result}.")

  prompt(messages('again', LANGUAGE))
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(messages('goodbye', LANGUAGE))
