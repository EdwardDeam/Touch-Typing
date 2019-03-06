class User
attr_reader(:filepath, :name, :to)
attr_accessor(:wpm, :accuracy)
    def initialize(name)
        #checks to see if user file exists, if it does, loads user file.
        #if user does not exist, sets user attributes to 0.
        @name = name
        @filepath = "data/" + name + ".txt"
        if does_user_exist()
            load_file
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

    def load_file
        str_data = ""
        #pulling user information from txt file and splitting data into users name / wpm / accuracy.
        File.foreach(@filepath) do |line|
            str_data << line
        end
        str_data = str_data.split("/")
        @name = str_data[0]
        @wpm = str_data[1].to_f
        @accuracy = str_data[2].to_f
    end

    def does_user_exist()
        #checks to see if it can find user data
        if (File.exists?(@filepath))
            return true 
        else
            return false
        end
    end

    def save_data()
        #creating a string of the data to use later in load
        data = @name + "/" + @wpm.to_s + "/" + @accuracy.to_s
        File.open(@filepath, "w") do |file|
            file.puts(data)
        end
    end
end

# Tests
# test_user = User.new(testuser)
# test_user.add_wpm(40)
# puts test_user.wpm

# test_user.add_accuracy(88)
# puts test_user.accuracy






