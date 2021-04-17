require_relative 'questionsdatabase.rb'

class QuestionLikes
    attr_accessor :id, :user_id, :question_id

    def initialize(option)
        @id = option['id']
        @user_id = option['user_id']
        @question_id = option['question_id']
    end

    def self.all
        data = QuestionsDatabase.instance.execute(<<-SQL)
        SELECT * FROM question_likes
        SQL
        data.map {|ele| QuestionLikes.new(ele)}
    end

    def self.find_by_id(id)
        self.all.select {|ele| ele.id == id }
    end

end