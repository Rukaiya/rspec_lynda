# frozen_string_literal: true

describe 'Expectation Matchers' do
  describe 'equivalence mathers' do

    it 'will match loose equality with #eq' do
      a = '2 cats'
      b = '2 cats'
      expect(a).to eq(b)
      expect(a).to be == b

      c = 17
      d = 17.0
      expect(c).to eq(d)
    end

    it 'will match value equality with #eql' do
      a = '2 cats'
      b = '2 cats'
      expect(a).to eql(b)

      c = 17
      d = 17.0
      expect(c).not_to eql(d)
    end

    it 'will match identity equality with #equal' do
      a = '2 cats'
      b = '2 cats'
      expect(a).to equal(b)

      c = b
      expect(b).to equal(c)
      expect(b).to be(c)
    end
  end

  describe 'truthyness matchers' do
    it 'will match true/false' do
      expect(1 < 2).to be true
      expect(1 > 2).to be false

      expect('foo').not_to be true
      expect('nil').not_to be false
      expect(0).not_to be false
    end

    it 'will match truthy/falsey' do
      expect(1 < 2).to be_truthy
      expect(1 > 2).to be_falsey

      expect('foo').to be_truthy
      expect('nil').not_to be_falsey
      expect(0).not_to be_falsey
    end

    it 'will match nil' do
      expect(nil).to be_nil
      expect(nil).to be nil

      expect(false).not_to be_nil
      expect(0).not_to be_nil
    end
  end

  describe 'numeric comparison matchers' do

    it 'will match less than/ greater than' do
      expect(10).to be > 9
      expect(10).to be >= 10
      expect(10).to be <= 10
      expect(9).to be < 10
    end

    it 'will match numeric ranges' do
      expect(10).to be_between(5, 10).inclusive
      expect(10).not_to be_between(5, 10).exclusive
      expect(10).to be_within(1).of(11)
      expect(5..10).to cover(9)
    end
  end

  describe "collection matchers" do

    it 'will match arrays' do
      array = [1, 2, 3]
      expect(array).to include(3)
      expect(array).to include(1, 3)

      expect(array).to start_with(1)
      expect(array).to end_with(3)

      expect(array).to match_array([1, 2, 3])
      expect(array).not_to match_array([1, 2])

      expect(array).to contain_exactly(3, 1, 2)
      expect(array).not_to contain_exactly(1, 2)
    end

    it 'will match arrays' do
      string = 'some string'
      expect(string).to include('ring')
      expect(string).to include('so', 'ring')

      expect(string).to start_with('so')
      expect(string).to end_with('ring')
    end

    it 'will match arrays' do
      hash = { a: 1, b: 2, c: 3 }
      expect(hash).to include(:a)
      expect(hash).to include(a: 1)

      expect(hash).to include(a: 1, c: 3)
      expect(hash).to include({ a: 1, c: 3 })

      # color(:) syntax will convert the key to symbol, so to keep the key type rocket(=>) syntax is used
      expect(hash).not_to include({ 'a' => 1, 'c' => 3 })
    end
  end
end
