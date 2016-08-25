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
  end
end

describe JmesPath::Expression do
  let :expression do
    JmesPath.new.compile('foo.bar')
  end

  describe '#search' do
    it 'searches the given input and returns the result' do
      input = {'foo' => {'bar' => 42}}
      expect(expression.search(input)).to eq(42)
    end
  end
end
