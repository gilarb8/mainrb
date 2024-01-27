# MIT License
# Copyright (c) 2024 Gillar Ajie Prasatya
# See LICENSE file for details.


class Item
  attr_accessor :first_name, :last_name, :age, :team

  def initialize(first_name, last_name, age, team)
    @first_name = first_name
    @last_name = last_name
    @age = age
    @team = team
  end

  def dup
    # Metode dup digunakan untuk menduplikasi objek Item.
    Item.new(@first_name.dup, @last_name.dup, @age.dup, @team.dup)
  end
end

class CRUDProgram
  def initialize
    @items = []
  end

  def main_menu
    loop do
      system("clear") || system("cls") # Membersihkan tampilan (linux/windows)
      puts "\nMain Menu:"
      puts "1. Add Item"
      puts "2. View Items"
      puts "3. Edit Item"
      puts "4. Delete Item"
      puts "5. Logout"
      print "Choose an option: "
      option = gets.chomp.to_i

      case option
      when 1
        add_item_menu
      when 2
        view_items_menu
      when 3
        edit_item_menu
      when 4
        delete_item_menu
      when 5
        puts "Logout. Goodbye!"
        break
      else
        puts "Invalid option. Please choose a valid option."
      end
    end
  end

  def add_item_menu
    system("clear") || system("cls") # Membersihkan tampilan (linux/windows)
    puts "\nAdd Item Menu:"
    print "Enter First Name: "
    first_name = gets.chomp
    print "Enter Last Name: "
    last_name = gets.chomp

    age = get_valid_age_input

    team = get_valid_team_input

    display_item_details(Item.new(first_name, last_name, age, team))

    print "Are you sure you want to save this item? (y/n): "
    choice = gets.chomp.downcase

    until ['y', 'n'].include?(choice)
      puts "Invalid choice. Please enter 'y' or 'n'."
      print "Are you sure you want to save this item? (y/n): "
      choice = gets.chomp.downcase
    end

    case choice
    when 'y'
      @items << Item.new(first_name, last_name, age, team)
      puts "Item saved successfully!"
    when 'n'
      puts "Item not saved."
    end
  end

  def view_items_menu
    system("clear") || system("cls") # Membersihkan tampilan (linux/windows)
    puts "\nView Items Menu:"
    if @items.empty?
      puts "No items to display."
    else
      display_items_table
    end
    puts "Press enter to go back to the main menu..."
    gets.chomp
  end

  def edit_item_menu
    system("clear") || system("cls") # Membersihkan tampilan (linux/windows)
    puts "\nEdit Item Menu:"
    display_items

    print "Enter item index to edit: "
    index_to_edit = gets.chomp.to_i

    item_to_edit = @items[index_to_edit - 1]

    if item_to_edit.nil?
      puts "Invalid index. Please enter a valid index."
      edit_item_menu
      return
    end

    puts "\nEdit Item ##{index_to_edit}:"
    display_item_details(item_to_edit)

    print "Do you want to edit this item? (y/n): "
    choice = gets.chomp.downcase

    until ['y', 'n'].include?(choice)
      puts "Invalid choice. Please enter 'y' or 'n'."
      print "Do you want to edit this item? (y/n): "
      choice = gets.chomp.downcase
    end

    case choice
    when 'y'
      # Gunakan dup untuk menduplikasi item sebelum diedit
      original_item = item_to_edit.dup
      edit_item_details(item_to_edit)
      display_item_details(item_to_edit)

      print "Are you sure you want to save changes? (y/n): "
      save_choice = gets.chomp.downcase

      until ['y', 'n'].include?(save_choice)
        puts "Invalid choice. Please enter 'y' or 'n'."
        print "Are you sure you want to save changes? (y/n): "
        save_choice = gets.chomp.downcase
      end

      case save_choice
      when 'y'
        puts "Changes saved successfully!"
      when 'n'
        puts "Changes not saved."
        # Kembalikan data item ke nilai sebelum diedit
        @items[index_to_edit - 1] = original_item
      end
    when 'n'
      puts "Edit canceled."
    end
  end

  def delete_item_menu
    system("clear") || system("cls") # Membersihkan tampilan (linux/windows)
    puts "\nDelete Item Menu:"
    display_items

    print "Enter item index to delete: "
    index_to_delete = gets.chomp.to_i

    item_to_delete = @items[index_to_delete - 1]

    if item_to_delete.nil?
      puts "Invalid index. Please enter a valid index."
      delete_item_menu
      return
    end

    puts "\nDelete Item ##{index_to_delete}:"
    display_item_details(item_to_delete)

    print "Are you sure you want to delete this item? (y/n): "
    choice = gets.chomp.downcase

    until ['y', 'n'].include?(choice)
      puts "Invalid choice. Please enter 'y' or 'n'."
      print "Are you sure you want to delete this item? (y/n): "
      choice = gets.chomp.downcase
    end

    case choice
    when 'y'
      @items.delete_at(index_to_delete - 1)
      puts "Item deleted successfully!"
    when 'n'
      puts "Deletion canceled."
    end
  end

  private

  def display_items
    puts "\nItems:"
    @items.each_with_index do |item, index|
      puts "#{index + 1}. #{item.first_name} #{item.last_name}, Age: #{item.age}, Team: #{item.team}"
    end
  end

  def display_items_table
    header = "| %-5s | %-15s | %-15s | %-5s | %-10s |" % ["Index", "First Name", "Last Name", "Age", "Team"]
    separator = "+%s+%s+%s+%s+%s+" % ["-" * 7, "-" * 17, "-" * 17, "-" * 7, "-" * 12]

    puts separator
    puts header
    puts separator

    @items.each_with_index do |item, index|
      puts "| %-5d | %-15s | %-15s | %-5d | %-10s |" % [index + 1, item.first_name, item.last_name, item.age, item.team]
    end

    puts separator
  end

  def display_item_details(item)
    puts "\nItem Details:"
    puts "First Name: #{item.first_name}"
    puts "Last Name: #{item.last_name}"
    puts "Age: #{item.age}"
    puts "Team: #{item.team}"
  end

  def edit_item_details(item)
    print "Enter New First Name: "
    item.first_name = gets.chomp
    print "Enter New Last Name: "
    item.last_name = gets.chomp

    age = get_valid_age_input
    item.age = age

    team = get_valid_team_input
    item.team = team
  end

  def get_valid_age_input
    loop do
      print "Enter New Age: "
      age = gets.chomp

      if age.match?(/\A\d+\z/)
        return age.to_i
      else
        puts "Invalid input. Please enter a valid age (numeric)."
      end
    end
  end

  def get_valid_team_input
    loop do
      print "Enter Team (Red/Blue/Purple): "
      team = gets.chomp.downcase
      return team if %w[red blue purple].include?(team)

      puts "Invalid team. Please enter Red, Blue, or Purple."
    end
  end
end

# Menjalankan program
program = CRUDProgram.new
program.main_menu
