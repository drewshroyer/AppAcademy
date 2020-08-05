require_relative 'questionsdb'
require_relative 'user'
require_relative 'question'

class Reply

    attr_accessor :id, :question_subject_id, :user_id, :body, :parent_reply_id

    def self.find_by_id(id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            replies
        WHERE
            id = ?
        SQL
        return nil unless replies.length > 0
        Reply.new(replies.first)
    end

    def self.find_by_user_id(user_id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT
            *
        FROM
            replies
        WHERE
            user_id = ?
        SQL
        return nil unless reply.length > 0
        Reply.new(reply.first)
    end

    def self.find_by_question_id(question_subject_id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, question_subject_id)
        SELECT
            *
        FROM
            replies
        WHERE
            question_subject_id = ?
        SQL
        return nil unless reply.length > 0
        Reply.new(reply.first)
    end

    def self.find_by_parent_id(parent_reply_id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, parent_reply_id)
        SELECT
            *
        FROM
            replies
        WHERE
            parent_reply_id = ?
        SQL
        return nil unless reply.length > 0
        Reply.new(reply.first)
        # reply.map { |child| Reply.new(child) }
    end

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
        data.map { |datum| Reply.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @question_subject_id = options['question_subject_id']
        @user_id = options['user_id']
        @parent_reply_id = options['parent_reply_id']
        @body = options['body']
    end

    def author
        User.find_by_id(self.user_id)
    end

    def question
        Question.find_by_id(self.question_subject_id)
    end

    def child_replies
        Reply.find_by_parent_id(self.id) #this gives a list of replies
    end

    #reply id = 1, parent_reply_id = id

    def parent_reply
        Reply.find_by_id(self.parent_reply_id)
    end

end