require_relative 'questionsdatabase.rb'

class Questions
    attr_accessor :id, :title, :body, :user_id

    def initialize(option)
        @id = option['id']
        @title = option['title']
        @body = option['body']
        @user_id = option['user_id']
    end

    def self.all
        data = QuestionsDatabase.instance.execute(<<-SQL)
        SELECT * FROM questions
        SQL
        data.map {|ele| Questions.new(ele)}
    end

    def self.find_by_id(id)
        self.all.select {|ele| ele.id == id }
    end

    def self.find_by_author_id(id)
        self.all.select {|ele| ele.user_id == id }
    end

    def author
        # Question.find_by_author(self.user_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, self.user_id)
        SELECT * FROM users
        WHERE
            id = ?
        SQL

        Users.new(data.first)
    end

    def replies
        Replies.find_by_question_id(self.id)
    end

end