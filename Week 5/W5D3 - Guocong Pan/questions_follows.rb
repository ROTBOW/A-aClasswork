require_relative 'questionsdatabase.rb'

class QuestionFollows
    attr_accessor :id, :user_id, :question_id

    def initialize(option)
        @id = option['id']
        @user_id = option['user_id']
        @question_id = option['question_id']
    end

    def self.all
        data = QuestionsDatabase.instance.execute(<<-SQL)
        SELECT * FROM questions_follows
        SQL
        data.map {|ele| QuestionFollows.new(ele)}
    end

    def self.find_by_id(id)
        self.all.select {|ele| ele.id == id }
    end

    def self.followers_for_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT users.id, fname, lname 
        FROM
            users
        JOIN 
            questions_follows on users.id = questions_follows.user_id
        WHERE
            question_id = ?
        SQL
        data.map {|ele| Users.new(ele)}
    end

    def self.followed_questions_for_user_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT questions.id, title, body, questions.user_id
        FROM
            questions
        JOIN
            questions_follows ON questions.id = questions_follows.question_id
        WHERE
            questions_follows.user_id = ?
        SQL
        data.map {|ele| Questions.new(ele)}
    end

end