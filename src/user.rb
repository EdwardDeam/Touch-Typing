class User
attr_reader(:filepath, :name, :to)
attr_accessor(:wpm, :accuracy)
  def initialize(name)
    # If a save file exists load that data, otherwise set data to 0
    @name = name
    @filepath = File.dirname(__FILE__) + "/data/" + name + ".txt"
    if user_exists?()
      load_data
    else
      # If the user has no saved data set attributes to 0
      @wpm = 0.00
      @accuracy = 0.00
    end
  end

  def add_wpm(new_wpm)
    # If the user has no other stats just assign them
    if @wpm == 0
      @wpm = new_wpm
    else
      # Save a WPM average
      @wpm = ((@wpm + new_wpm) / 2.0).round(2)
    end
  end

  def add_accuracy(new_accuracy)
    # If the user has no other stats just assign them
    if @accuracy == 0
      @accuracy = new_accuracy
    else
      # Save an accuracy average
      @accuracy = ((@accuracy + new_accuracy) / 2).round(2)
    end
  end

  def load_data
    str_data = ""
    #pulling user information from txt file and splitting data into users name / wpm / accuracy.
    File.foreach(@filepath) { |line| str_data << line }
    str_data = str_data.split("/")
    @name = str_data[0]
    @wpm = str_data[1].to_f
    @accuracy = str_data[2].to_f
  end

  def user_exists?()
    #checks to see if it can find user data
    File.exists?(@filepath)
  end

  def save_data()
    #creating a string of the data to use later in load
    data = @name + "/" + @wpm.to_s + "/" + @accuracy.to_s
    File.open(@filepath, "w") { |f| f.puts(data) }
  end
end






