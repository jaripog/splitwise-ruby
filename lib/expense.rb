class Expense    
    attr_accessor :input
    def initialize(user, amount)
      @current_user = user.to_sym
      @expense_amount = amount
    end

    def add_expense(list_users)
      total_amount = @expense_amount 
      split_amount = total_amount/list_users.length
      each_user_contribution = (total_amount - split_amount) /  (list_users.length - 1)

      user_keys = list_users.map {|user| user.to_sym}
      user_keys.each do |key|
        if key!=@current_user
          unless $users_expense_directory[key][@current_user].nil? 
            $users_expense_directory[key][@current_user] = $users_expense_directory[key][@current_user] + each_user_contribution  
          end 
        end
      end
      check_and_settle_current_user_debt(each_user_contribution,list_users)
    end

    def add_expense_exact_amount(list_users,amounts)
      list_users = list_users.map{ |user| user.to_sym}
      list_users.each_with_index do |value,index|
        $users_expense_directory[value][@current_user] =  $users_expense_directory[value][@current_user] + amounts[index]
      end
      check_and_settle_current_user_dbts_for_exact_amount(list_users,amounts)
    end

    def check_and_settle_current_user_debt(amount,list_users)
      current_user_dbts = $users_expense_directory[@current_user]
      list_users = list_users.map { |u| u.to_sym }
      current_user_dbts.each do |key,value| 
        unless list_users.index(key).nil?
          $users_expense_directory[@current_user][key] = value - amount
        end
      end
    end

    def check_and_settle_current_user_dbts_for_exact_amount(list_users, amounts)
      list_users.each_with_index do |value,index|
        $users_expense_directory[@current_user][value] =  $users_expense_directory[@current_user][value] - amounts[index]
      end
    end
end