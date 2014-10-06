require_relative "tilt/ipython_notebook"

module IpythonNotebook
  class << self
    def registered(app)
      app.inst.template_extensions ipynb: :html
      ::Tilt.register ::Tilt::IpythonNotebookTemplate, 'ipynb'
    end
    alias :included :registered
  end
end

Middleman::Extensions.register :ipython_notebook, IpythonNotebook