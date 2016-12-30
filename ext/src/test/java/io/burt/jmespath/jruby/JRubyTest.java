package io.burt.jmespath.jruby;

import org.jruby.Ruby;
import org.jruby.runtime.builtin.IRubyObject;

import io.burt.jmespath.JmesPathRuntimeTest;
import io.burt.jmespath.Adapter;
import io.burt.jmespath.RuntimeConfiguration;

public class JRubyTest extends JmesPathRuntimeTest<IRubyObject> {
  private static final Ruby ruby = Ruby.newInstance();

  @Override
  protected Adapter<IRubyObject> createRuntime(RuntimeConfiguration configuration) { return new JRubyRuntime(ruby, configuration); }

  @Override
  protected IRubyObject parse(String json) {
    try {
      return super.parse(json);
    } catch (RuntimeException e) {
      if (e.getMessage().contains("unexpected token at '}'") && json.endsWith("}")) {
        // NOTE This is a workaround for a mistake in the jmespath-java tests
        //      one of the tests contains JSON with a trailing } that the other
        //      implementations' JSON parsers don't care about.
        //      When jmespath-core:0.1.1 is released this whole method can
        //      be removed.
        return super.parse(json.substring(0, json.length() - 1));
      } else {
        throw e;
      }
    }
  }
}
