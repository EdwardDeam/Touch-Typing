class User
attr_reader(:wpm, :accuracy, :saveduser)

    def initialize()
        #checks to see if user file exists, if it does, loads user file.
        #if user does not exist, sets user attributes to 0.
        if does_user_exist()
            load_file
        else
            @saveduser = 0
            @wpm = 0
            @accuracy = 0
        end
    end

    def load_file
        str_data = ""
        user_save_data = "savedata.txt"
        #pulling user information from txt file and splitting data into users name / wpm / accuracy.
        File.foreach(user_save_data) do |line|
            str_data << line
        end
        str_data = str_data.split("/")
        @saveduser = str_data[0]
        @wpm = str_data[1].to_f
        @accuracy = str_data[2].to_f
    end

    def does_user_exist()
        #checks to see if it can find user data
        if (File.exists?("savedata.txt"))
            return true 
        else
            return false
        end
    end

    def save_data()
        #creating a string of the data to use later in load
        data = @saveduser.to_s + "/" + @WPM.to_s + "/" + @Accuracy.to_s
        user_save_data = "savedata.txt"
        File.open(user_save_data, "w") do |file|
            file.puts(data)
        end
    end
end






