require 'yaml'
MESSAGES = YAML.load_file('loan_calc_refactor_messages.yml')

def messages(message)
  MESSAGES[message]
end

def prompt(message)
  puts "=> #{message}"
end

def get_name
  loop do
    name = gets.strip.chomp

    if name.empty?
      prompt(messages('valid name'))
    else
      return name
    end
  end
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input || Float(input)
end

def number?(input)
  integer?(input) || float?(input)
rescue ArgumentError
  false
end

def get_loan_amount
  loop do
    prompt(messages('amount'))
    total_loan_amt = gets.chomp
    if number?(total_loan_amt) && total_loan_amt.to_f >= 0
      return total_loan_amt.to_f
    else
      prompt(messages('valid number'))
    end
  end
end

def get_apr
  loop do
    prompt(messages('apr'))
    apr_percentage = gets.chomp
    if number?(apr_percentage) && apr_percentage.to_f >= 0
      return apr_percentage.to_f
    else
      prompt(messages('valid number'))
    end
  end
end

def get_loan_duration_months
  loop do
    prompt(messages('duration'))
    loan_dur_months = gets.chomp
    if number?(loan_dur_months) && loan_dur_months.to_f >= 0
      return loan_dur_months.to_i
    else
      prompt(messages('valid number'))
    end
  end
end

def calc_monthly_payment(apr, total_loan_amt, loan_dur_months)
  monthly_interest_percentage = apr.to_f / 12
  monthly_int_decimal = monthly_interest_percentage.to_f / 100
  monthly_payment = total_loan_amt * (monthly_int_decimal / (1 - (1 +
                                     monthly_int_decimal)**(-loan_dur_months)))
  monthly_payment
end

def display_results(apr, total_loan_amt, loan_dur_months, monthly_payment)
  if apr == 0 # zero interest loans
    prompt("Your monthly payment is $#{format('%.2f', (
          total_loan_amt.to_f / loan_dur_months))}.")
  else
    prompt("Monthly payment: $#{format('%.2f', monthly_payment)}")
  end
end

def compute_again?
  prompt(messages('again'))
  answer = gets.chomp
  answer if answer.downcase == 'y' || answer.downcase == 'yes'
end

def print_goodbye(name)
  prompt("#{messages('goodbye')} #{name}.")
  prompt("Goodbye!")
end

system 'clear'
prompt(messages('welcome'))

name = get_name

prompt("Hi, #{name}!")

loop do # main loop
  total_loan_amt = get_loan_amount
  apr = get_apr
  loan_dur_months = get_loan_duration_months
  monthly_payment = calc_monthly_payment(apr, total_loan_amt, loan_dur_months)
  display_results(apr, total_loan_amt, loan_dur_months, monthly_payment)
  break unless compute_again?
end

print_goodbye(name)
