require_relative 'questionsdb'

class Question_likes

    attr_accessor :id, :likes, :name_id

    def self.find_by_id(id)
        question_likes = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            questions
        WHERE
            id = ?
        SQL
        return nil unless question_likes.length > 0
        Question_likes.new(question_likes.first)
    end

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
        data.map { |datum| Question_likes.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @likes = options['likes']
        @name_id = options['name_id']
    end
end