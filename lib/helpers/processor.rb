  class Processor < AST::Processor
    include Inspectors
    def on_begin(node)
      node.children.each { |c| process(c) }
    end
   def on_def(node)
      return if node.location.line == node.location.end.line
      p node
      name, arg, body = *node
      defaulters = inspect_indentation(node, body)
      defaulters.each do |defaulter|
        p defaulter.location.line
      end
    end

  end

def parse_code(code)
  Processor.new.process(code)
end
