class User
    def initialize
        create_users
        create_expense_directory
    end

    def list_users
        puts "-------List of Users available in the system-------------"
        $users.each do |key,value|
            puts "#{key} --> #{value[:name]}"
        end
    end

    def show_user_details(user_id)
        puts $users[user_id.to_sym]
    end

    def show_all_expense
        total_expenses = $users_expense_directory
        total_expenses.each do |key,value|
            puts "#{$users[key][:name]} owes money to"
            value.each do |a,b|
                puts "#{$users[a][:name]}, Rs.#{b}"
            end
            puts "------------------\n"
        end
    end

    def user_expense(user_id)
        user_details = get_expense_directory_for_user(user_id)
        puts "#{$users[user_id.to_sym][:name]} owes money to"
        user_details.each do |key,value|
            puts "#{$users[key][:name]}, Rs.#{value}"
        end
    end

    private

    def get_expense_directory_for_user(user_id)
        return $users_expense_directory[user_id.to_sym]
    end

    def create_users
        $users = {
        u1: {
            name: "Gopiraj",
            email: "gopiraj@split.com",
            mobile: 8883753131,
        },
        u2: {
            name: "Abishek",
            email: "Abishek@split.com",
            mobile: 8998080900,
        },
        u3: {
            name: "Johncena",
            email: "Johncena@split.com",
            mobile: 8998343030,
        },
        u4: {
            name: "Marvel",
            email: "marvel@split.com",
            mobile: 8998034530,
        }
    }
    end

    def create_expense_directory
        $users_expense_directory = {
            u1: {
                u2: 0,
                u3: 0,
                u4: 0
            },
            u2: {
                u1: 0,
                u3: 0,
                u4: 0
            },
            u3: {
                u2: 0,
                u1: 0,
                u4: 0
            },
            u4: {
                u2: 0,
                u3: 0,
                u1: 0
            }
        }
    end
end