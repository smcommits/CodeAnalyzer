class NamingChecker < AST::Processor
  include Inspectors
  def initialize
    super
    @snake_case = /^@?[\da-z_]+[!?=]?$/
    @camel_case = /^@?[a-z][\da-zA-Z]+[!?=]?$/

    @error_type = 'Style/IncorrectNaming'
    @message = lambda { |type, name, naming_convention|
      "The #{type} #{name}  is not correct, please use #{naming_convention}."
    }
  end

  def on_begin(node)
    node.children.each { |c| process(c) }
  end

  def on_lvasgn(node)
    return if node.children.first.to_s =~ @snake_case

    name = node.children.first.to_s

    submit_report("#{node.loc.line}:#{node.loc.column}",
                  @error_type,
                  @message.call('var name', name, 'snake_case'))
  end

  alias on_ivasgn on_lvasgn

  def on_def(node)
    return if node.children.first.to_s =~ @snake_case

    name = node.children.first.to_s

    submit_report("#{node.loc.line}:#{node.loc.column}",
                  @error_type,
                  @message.call('method name', name, 'snake_case'))
  end

  def on_class(node)
    return if node.children.first.to_s =~ @camel_case

    name = node.children.first

    submit_report("#{node.loc.line}:#{node.loc.column}",
                  @error_type,
                  @message.call('class name', name, 'CamelCase'))
  end
end
