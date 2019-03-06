class User
attr_reader(:filename, :name)
aatr_accessor(:wpm, :accuracy)

    def initialize(name)
        #checks to see if user file exists, if it does, loads user file.
        #if user does not exist, sets user attributes to 0.
        @name = name
        @filename = name + ".txt"
        if does_user_exist()
            load_file
        else
            @wpm = 0.00
            @accuracy = 0.00
        end
    end

    def load_file
        str_data = ""
        #pulling user information from txt file and splitting data into users name / wpm / accuracy.
        File.foreach(@filename) do |line|
            str_data << line
        end
        str_data = str_data.split("/")
        @name = str_data[0]
        @wpm = str_data[1].to_f
        @accuracy = str_data[2].to_f
    end

    def does_user_exist()
        #checks to see if it can find user data
        if (File.exists?(@filename))
            return true 
        else
            return false
        end
    end

    def save_data()
        #creating a string of the data to use later in load
        data = @name + "/" + @wpm.to_s + "/" + @accuracy.to_s
        File.open(@filename, "w") do |file|
            file.puts(data)
        end
    end
end







