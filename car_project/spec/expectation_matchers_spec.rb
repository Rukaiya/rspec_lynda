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
end
