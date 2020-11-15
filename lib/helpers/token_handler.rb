class TokenHandler
  def initialize(tokens)
    @tokens = tokens
  end

  def token(index)
    return if @tokens.empty?

    @tokens[index][2]
  end

  def type(index)
    return if @tokens.empty?

    @tokens[index][1]
  end

  def line(index)
    return if @tokens.empty?

    @tokens[index][0][0]
  end

  def column(index)
    return if @tokens.empty?

    @tokens[index][0][1]
  end
end
