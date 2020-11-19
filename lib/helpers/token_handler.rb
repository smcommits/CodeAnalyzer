class TokenHandler
  attr_accessor :tokens

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

  def previous_token(index)
    return if @tokens[index - 1].nil?

    @tokens[index - 1]
  end

  def next_token(index)
    return if @tokens[index + 1].nil?

    @tokens[index + 1]
  end
end
