def inspect_indentation(node, body)
  multi_line_code_indentation(body, node)
rescue StandardError
  # if function body is a single line
  body unless match_indent?(body, node)
end

def multi_line_code_indentation(body, node)
  defaulters = []
  body.children.each_with_index do |child, index|
    if index.zero?
      defaulters << child unless match_indent?(child, node)
    else
      defaulters << child unless match_indent?(child, node) || on_same_line?(child, body.children[index - 1])
    end
  end
  defaulters
end

def on_same_line?(child, previous_child)
  child.location.line == previous_child.location.line
end

def match_indent?(child, node)
  child.location.column - node.location.column == 2
end
