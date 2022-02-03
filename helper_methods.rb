module Tools
  def reply(name)
    sleep 1
    puts "\n#{name} created successfully!!!"
    sleep 1
    resume
  end

  def resume
    print "\nDo you wish to continue? [Y/N]: "
    input = gets.chomp

    if input.downcase == 'y' || input.downcase == 'yes' || input == ''
      clear
      run
    else
      exit
    end
  end

  def invalid_prompt
    clear
    puts 'Incorrect selection, please try again!'
    sleep 1
  end

  def clear
    print "\e[2J\e[f"
  end

  def exit
    clear
    nil
  end
end
