class TokenHandler

  def initialize(tokens)
    @tokens = tokens
  end

  def token(index)
    @tokens[index][2]
  end

  def type(index)
    @tokens[index][1]
  end

  def line(index)
    @tokens[index][0][0]
  end

  def column(index)
    @tokens[index][0][1]
  end

end

