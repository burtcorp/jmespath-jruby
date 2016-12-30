package io.burt.jmespath.jruby;

import org.jruby.Ruby;
import org.jruby.RubyClass;
import org.jruby.RubyObject;
import org.jruby.RubyHash;
import org.jruby.runtime.builtin.IRubyObject;
import org.jruby.anno.JRubyClass;
import org.jruby.anno.JRubyMethod;
import org.jruby.runtime.ThreadContext;
import org.jruby.runtime.ObjectAllocator;

import io.burt.jmespath.Expression;
import io.burt.jmespath.RuntimeConfiguration;
import io.burt.jmespath.parser.ParseException;

@JRubyClass(name = "JmesPath")
public class JmesPath extends RubyObject {
  private final RubyClass parseErrorClass;
  private JRubyRuntime jmespath;

  public JmesPath(Ruby ruby, RubyClass type) {
    super(ruby, type);
    this.parseErrorClass = (RubyClass) ruby.getClassFromPath("JmesPath::ParseError");
  }

  private static class JmesPathAllocator implements ObjectAllocator {
    public IRubyObject allocate(Ruby ruby, RubyClass type) {
      return new JmesPath(ruby, type);
    }
  }

  static RubyClass install(Ruby ruby) {
    RubyClass jmesPathClass = ruby.defineClass("JmesPath", ruby.getObject(), new JmesPathAllocator());
    jmesPathClass.defineAnnotatedMethods(JmesPath.class);
    return jmesPathClass;
  }

  @JRubyMethod(optional = 1)
  public IRubyObject initialize(ThreadContext ctx, IRubyObject[] args) {
    RuntimeConfiguration.Builder configuration = RuntimeConfiguration.builder();
    if (args.length > 0) {
      RubyHash options = args[0].convertToHash();
      IRubyObject silentTypeErrors = options.fastARef(ctx.runtime.newSymbol("silent_type_errors"));
      configuration.withSilentTypeErrors(silentTypeErrors != null && silentTypeErrors.isTrue());
    }
    this.jmespath = new JRubyRuntime(ctx.runtime, configuration.build());
    return this;
  }

  @JRubyMethod
  public IRubyObject compile(ThreadContext ctx, IRubyObject expression) {
    try {
      return JmesPathExpression.create(ctx.runtime, jmespath.compile(expression.toString()));
    } catch (ParseException pe) {
      throw ctx.runtime.newRaiseException(parseErrorClass, pe.getMessage());
    }
  }
}
