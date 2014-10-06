require 'tilt'
require 'tempfile'

class Tilt::IpythonNotebookTemplate < Tilt::Template
  def self.engine_initialized?
    true
  end

  def prepare
  end

  def evaluate(scope, locals, &block)
    unless @output
      file = Tempfile.new('ipynb')
      file.write(data)
      file.close
      IO.popen("ipython nbconvert --to html --template full --stdout #{file.path} 2>/dev/null") do |io|
        @output = io.read
      end
      file.unlink
    end
    @output
  end

  def allows_script?
    false
  end
end