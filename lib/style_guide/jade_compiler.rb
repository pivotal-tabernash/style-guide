require 'tilt-jade/jade_js'

module StyleGuide
  def self.html_from_jade_template(partial, options={})
    data = File.open(partial)
    compiled = JadeJs.compile(data, locals: {}, client: true, compileDebug: false)

    JadeJs::Source.context.eval("(#{compiled})(#{options[:locals].to_json}, \
        jade.runtime.attrs, jade.runtime.escape, jade.runtime.rethrow, \
        jade.runtime.merge)"
        )
  end
end
