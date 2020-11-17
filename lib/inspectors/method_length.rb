module Inspectors
  class Indentation < AST::Processor

   def on_def(node)
     check_method_length(node)
   end 

   def check_method_length(node)
     array_of_lines = node.loc.expression.source.lines
     
   end
  end
end
