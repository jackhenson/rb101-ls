require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def messages(message)
  MESSAGES[message]
end

def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input || Float(input)
end

def number?(input)
  integer?(input) || float?(input) rescue false
end

prompt(messages('welcome'))

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt(messages('valid name'))
  else
    break
  end
end

prompt("Hi, #{name}!")

loop do # main loop
  total_loan_amount = ''
  loop do
    prompt(messages('amount'))
    total_loan_amount = gets.chomp

    if number?(total_loan_amount) && total_loan_amount.to_f >= 0 
      break
    else
      prompt(messages('valid number'))
    end
  end

  apr_percentage = ''
  loop do
    prompt(messages('apr'))
    apr_percentage = gets.chomp

    if number?(apr_percentage) && apr_percentage.to_f >= 0 
      break
    else
      prompt(messages('valid number'))
    end
  end

  loan_duration_years = ''
  loop do
    prompt(messages('duration'))
    loan_duration_years = gets.chomp

    if number?(loan_duration_years) && loan_duration_years.to_f >= 0 
      break
    else
      prompt(messages('valid number'))
    end
  end

  loan_duration_months = loan_duration_years.to_f * 12
  monthly_interest_percentage = apr_percentage.to_f / 12
  monthly_int_decimal = monthly_interest_percentage.to_f / 100
  monthly_payment = total_loan_amount.to_f *
                    (monthly_int_decimal /
                    (1 - (1 + monthly_int_decimal)**(-loan_duration_months)))

  if monthly_interest_percentage == 0 # for zero interest loans
    prompt("Your monthly payment is $#{format('%.2f', (total_loan_amount.to_f /
                                                      loan_duration_months))}.")
  else
    prompt("Monthly payment: $#{format('%.2f', monthly_payment)}")
  end

  prompt(messages('again'))
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("#{messages('goodbye')} #{name}.")
prompt("Goodbye!")
