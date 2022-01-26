require './lib/expense.rb'
require './lib/users.rb'
require './lib/exception_handler/exception.rb'

#maintain the global set of users
$users = []
$users_expense_directory = {}
$user_constant = {
    2 => "u1",
    3 => "u2",
    4 => "u3",
    5 => "u4",
}

def init 
    @user_object = User.new
    while(true)
        get_user_input
    end
end

def get_user_input
    puts "--------------Please enter the input-------------"
    puts "1.show\n2.expense\n3.show user details"
    inp = gets.chomp.to_i
    case inp
    when 1
        @user_object.list_users    
        puts "1.show all\n2.u1\n3.u2\n4.u3\n5.u4"
        user_id = gets.chomp.to_i
        case user_id
        when 1
            @user_object.show_all_expense
        else
            @user_object.user_expense($user_constant[user_id])
        end
    when 2
        puts "Please enter the user paying"
        current_user = gets.chomp
        puts "Please enter the amount paid"
        amount = gets.chomp.to_f
        puts "Please enter 1.equal split, 2.exact split"
        split_type = gets.chomp.to_i
        case split_type
        when 1
            puts "Please enter the users wanted to taken for consideration Eg--> u1,u2,u3.."
            list_users = gets.chomp.split(',')
            expense_obj = Expense.new(current_user, amount)    
            expense_obj.add_expense(list_users)
        when 2
            puts "Please enter the users wanted to taken for consideration Eg--> u1,u2,u3.."
            list_users = gets.chomp.split(',')
            puts "Enter the amount with comma seperated eg--> 200,100"
            amounts = gets.chomp.split(',')
            amounts = amounts.map {|amount| amount.to_f}
            expense_obj = Expense.new(current_user,amount)
            expense_obj.add_expense_exact_amount(list_users,amounts)
        else
            puts "====invalid input========"
        end
    when 3
        @user_object.list_users    
        puts "2.u1\n3.u2\n4.u3\n5.u4"
        user_id = gets.chomp.to_i
        puts "--------Invalid Input--------" if user_id == 1
        @user_object.show_user_details($user_constant[user_id])
    else
        puts "------Invalid Input-----------"
    end
end

begin
    init
rescue => e
    ExceptionHandler.new(e.message)
end