# encoding: utf-8

describe JmesPath do
  let :jmespath do
    described_class.new
  end

  describe '#compile' do
    it 'compiles an expression' do
      expression = jmespath.compile('foo.bar')
      expect(expression).to_not be_nil
    end

    context 'when there is a syntax error' do
      it 'raises an error' do
        expect { jmespath.compile('%') }.to raise_error(JmesPath::ParseError)
      end
    end

    context 'when the expression refers to a function that does not exist' do
      it 'raises an error' do
        expect { jmespath.compile('%') }.to raise_error(JmesPath::ParseError)
      end
    end

    context 'when the expression uses an invalid value' do
      it 'raises an error' do
        expect { jmespath.compile('%') }.to raise_error(JmesPath::ParseError)
      end
    end
  end
end

describe JmesPath::Expression do
  let :expression do
    JmesPath.new(configuration).compile(expression_str)
  end

  let :configuration do
    {}
  end

  let :expression_str do
    'foo.bar'
  end

  describe '#search' do
    let :input do
      {'foo' => {'bar' => 42}}
    end

    it 'searches the given input and returns the result' do
      expect(expression.search(input)).to eq(42)
    end

    context 'when a function is given the wrong number of arguments' do
      let :expression_str do
        'to_number(foo, bar)'
      end

      it 'raises an error' do
        expect { expression.search(input) }.to raise_error(JmesPath::ParseError)
      end
    end

    context 'when a function is given the wrong kind of argument' do
      let :expression_str do
        'max(@)'
      end

      it 'raises an error' do
        expect { expression.search(input) }.to raise_error(JmesPath::ArgumentTypeError)
      end

      context 'and :silent_type_errors is true' do
        let :configuration do
          super().merge(:silent_type_errors => true)
        end

        it 'does not raise any error' do
          expect { expression.search(input) }.to_not raise_error
        end
      end
    end
  end
end
