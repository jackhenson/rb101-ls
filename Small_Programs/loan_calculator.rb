require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def messages(message)
  MESSAGES[message]
end

def prompt(message)
  puts "=> #{message}"
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

loop do  # main loop
  total_loan_amount = ''
  loop do
    prompt(messages('amount'))
    total_loan_amount = gets.chomp

    if total_loan_amount.empty? || total_loan_amount.to_f < 0
      prompt(messages('valid number'))
    else
      break
    end
  end

  apr_percentage = ''
  loop do
    prompt(messages('apr'))
    apr_percentage = gets.chomp

    if apr_percentage.empty? || apr_percentage.to_f < 0
      prompt(messages('valid number'))
    else
      break
    end
  end

  loan_duration_years = ''
  loop do
    prompt(messages('duration'))
    loan_duration_years = gets.chomp

    if loan_duration_years.empty? || loan_duration_years.to_f < 0
      prompt(messages('valid number'))
    else
      break
    end
  end

  loan_duration_months = loan_duration_years.to_f * 12
  
  monthly_interest_percentage = apr_percentage.to_f / 12

  monthly_interest_decimal = monthly_interest_percentage.to_f / 100
  
  monthly_payment = total_loan_amount.to_f * (monthly_interest_decimal / (1 - (1 + monthly_interest_decimal)**(-loan_duration_months)))

  if monthly_interest_percentage == 0  # for zero interest loans
    prompt("Your monthly payment is $#{format("%.2f",(total_loan_amount.to_f / loan_duration_months))}.")
  else
    prompt("Monthly payment: $#{format("%.2f", monthly_payment)}")
  end

  prompt(messages('again'))
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("#{messages('goodbye')} #{name}.")
prompt("Goodbye!")