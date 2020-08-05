require_relative 'questionsdb'
require_relative 'user'
require_relative 'question'

class Question_follows

    attr_accessor :id, :user_id, :questions_id

    def self.find_by_id(id)
        question_follows = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            questions_follows
        WHERE
            id = ?
        SQL
        return nil unless question_follows.length > 0
        Question_follows.new(question_follows.first)
    end

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
        data.map { |datum| Question_follows.new(datum) }
    end

    def self.followers_for_question_id(question_id)
        question_follows = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
            users.*
        FROM 
            users
        JOIN question_follows ON 
            users.id = question_follows.user_id
        WHERE
            questions_id = ?
        SQL
        question_follows.map { |user| Question_follows.new(user) }
    end

    def self.followed_questions_for_user_id(user_id)
        followed_questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT
            questions.*
        FROM 
            questions
        JOIN question_follows ON 
            questions.id = question_follows.questions_id
        WHERE
            user_id = ?
        SQL
        followed_questions.map { |question| Question_follows.new(question) }
    end

    def self.most_followed_questions(n)
        most_followed_questions = QuestionsDatabase.instance.execute(<<-SQL, n)
        SELECT
            questions.*
        FROM
            questions
        JOIN question_follows ON
            questions.id = question_follows.questions_id
        GROUP BY
            questions.id
        ORDER BY
            COUNT(question_follows.questions_id) DESC
        LIMIT n
        SQL
        most_followed_questions.map { |question| Question.new(question) }
    end

    def self.most_followed(n)
        
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @questions_id = options['questions_id']
    end
end