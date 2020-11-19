class SpaceAroundOperators < Inspectors::Base
  include Inspectors
  def initialize(code)
    super
    @error_type = 'Style/SpaceAroundOperators'
    @message = 'Please include space around operators'
  end

  def inspect
    tokens = TokenHandler.new(@tokenized_code)
    @tokenized_code.each_with_index do |_token, index|
      next unless tokens.type(index) == :on_op

      unless tokens.type(index - 1) == :on_sp && tokens.type(index + 1) == :on_sp
        submit_report("#{tokens.line(index)}:#{tokens.column(index)}", @error_type, @message)
      end
    end
  end
end
