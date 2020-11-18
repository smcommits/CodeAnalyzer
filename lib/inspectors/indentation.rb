class Indentation < AST::Processor
  include Inspectors

  attr_reader :message, :errors, :error_type

  def initialize
    super
    @error_type = 'Style/IncorrectIndentation'
    @message = 'Please use indentation of exactly two spaces'
  end

  def on_begin(node)
    node.children.each { |c| process(c) }
  end

  def on_def(node)
    return if node.location.line == node.location.end.line

    _name, _arg, body = *node

    defaulters = inspect_indentation(node, body)
    handle_defaulters(defaulters)
  end

  def on_module(node)
    _name, *children = *node
    defaulters = inspect_indentation(node, children)
    handle_defaulters(defaulters)
  end

  def on_class(node)
    _name, _base_class, *children = *node
    defaulters = inspect_indentation(node, *children)
    handle_defaulters(defaulters)
  end

  def on_send(node)
    super
    _name, _args, body = *args.first
    defaulters = inspect_indentation(node, body)
    handle_defaulters(defaulters)
  end

  def on_while(node)
    _condition, body = *node
    return unless node.loc.keyword.begin_pos == node.loc.expression.begin_pos

    defaulters = inspect_indentation(node, body)
    handle_defaulters(defaulters)
  end

  alias on_until on_while

  def on_for(node)
    _name, _range, body = *node
    defaulters = inspect_indentation(node, body)
    handle_defaulters(defaulters)
  end

  def handle_defaulters(defaulters)
    return if defaulters.nil?

    if !defaulters.is_a?(Array)
      submit_report("#{defaulters.loc.line}:#{defaulters.loc.column}", @error_type, @message)
    else
      defaulters.each do |defaulter|
        submit_report("#{defaulter.loc.line}, #{defaulter.loc.column}", @error_type, @message)
      end
    end
  end
end
