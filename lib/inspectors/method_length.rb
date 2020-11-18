class MethodLength < AST::Processor
  include Inspectors
  attr_reader :error_type

  def initialize
    super
    @error_type = 'Complexity/MethodLength'
    @message = ->(name) { "The method *#{name}* is too long, please refactor the code." }
  end

  def on_begin(node)
    node.children.each { |c| process(c) }
  end

  def on_def(node)
    return if line_length_valid?(node)

    submit_report("#{node.loc.line}:#{node.loc.column}", @error_type, @message.call(node.children.first))
  end

  def line_length_valid?(node)
    array_of_lines = node.loc.expression.source.lines
    array_of_lines.size < 30
  end
end
