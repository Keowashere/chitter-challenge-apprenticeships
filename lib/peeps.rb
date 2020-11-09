require 'pg'

class Peeps

  attr_reader :id, :username, :message


  def initialize(id:, username:, message:)
    @id = id
    @username = username
    @message = message
  end


  def self.all
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM peeps')
    result.map do |peep|
      Peeps.new(id: peep['id'], username: peep['username'], message: peep['message'])
    end
  end

  def self.create(message:, username:)
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (username, message) VALUES('#{username}', '#{message}') RETURNING id, message, username;")
    Peeps.new(id: result[0]['id'], username: result[0]['username'], message: result[0]['message'])
  end

end
