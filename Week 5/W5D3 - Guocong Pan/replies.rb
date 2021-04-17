require_relative 'questionsdatabase.rb'

class Replies
    attr_accessor :id, :question_id, :user_id, :body, :parent_id

    def initialize(option)
        @id = option['id']
        @question_id = option['question_id']
        @user_id = option['user_id']
        @body = option['body']
        @parent_id = option['parent_id']
    end

    def self.all
        data = QuestionsDatabase.instance.execute(<<-SQL)
        SELECT * FROM replies
        SQL
        data.map {|ele| Replies.new(ele)}
    end

    def self.find_by_id(id)
        self.all.select {|ele| ele.id == id }
    end

    def self.find_by_user_id(id)
        self.all.select {|ele| ele.user_id == id }
    end

    def self.find_by_question_id(id)
        self.all.select {|ele| ele.question_id == id }
    end

    def author
        data = QuestionsDatabase.instance.execute(<<-SQL, self.user_id)
            SELECT * FROM users
            WHERE id = ?
        SQL
        Users.new(data.first)
    end

    def question
        data = QuestionsDatabase.instance.execute(<<-SQL, self.question_id)
            SELECT * FROM questions
            WHERE id = ?
        SQL
        Questions.new(data.first)
    end

    def parent_reply
        return nil if self.parent_id.nil?
        data = QuestionsDatabase.instance.execute(<<-SQL, self.parent_id)
            SELECT * FROM replies
            WHERE id = ?
        SQL
        Replies.new(data.first)
    end

    def child_replies
        data = QuestionsDatabase.instance.execute(<<-SQL, self.id)
            SELECT * FROM replies
            WHERE parent_id = ?
        SQL
        Replies.new(data.first)
    end

end