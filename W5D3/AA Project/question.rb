require_relative 'questionsdb'
require_relative 'user'
require_relative 'replies'

class Question

    attr_accessor :id, :title, :body, :author_id

    def self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            questions
        WHERE
            id = ?
        SQL
        return nil unless question.length > 0
        Question.new(question.first)
        # Question.new(question)
    end

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map { |datum| Question.new(datum) }
    end

    def self.find_by_author_id(author_id)
        question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT
            *
        FROM
            questions
        WHERE
            author_id = ?
        SQL
        return nil unless question.length > 0
        Question.new(question.first)
        # Question.new(question)
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end

    def author
        User.find_by_id(self.author_id)
    end

    def replies
        Reply.find_by_question_id(self.id)
    end

    def followers
        Question_follows.followers_for_question_id(self.id)
    end
end

# q = Question.new('title' => 'How to write HTML?', 'body' => 'Will we have a lecture on this topic?', 'author_id' => (SELECT id FROM users WHERE 'fname' = 'Drew'))