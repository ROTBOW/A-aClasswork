require_relative 'questionsdatabase.rb'

class Users
    attr_accessor :id, :fname, :lname

    def initialize(option)
        @id = option['id']
        @fname = option['fname']
        @lname = option['lname']
    end

    def self.all
        data = QuestionsDatabase.instance.execute(<<-SQL)
        SELECT * FROM users
        SQL
        data.map {|ele| Users.new(ele)}
    end

    def self.find_by_id(id)
        self.all.select {|ele| ele.id == id }
    end

    def self.find_by_name(str1, str2)
        name = QuestionsDatabase.instance.execute(<<-SQL, str1, str2)
        SELECT * FROM users
        WHERE 
            fname = ? AND lname = ? 
        SQL
        Users.new(name.first) 
    end

    def authored_questions
        Questions.find_by_author_id(self.id)
    end

    def authored_replies
        Replies.find_by_user_id(self.id)
    end

end