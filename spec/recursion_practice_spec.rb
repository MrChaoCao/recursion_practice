require 'rspec'
require 'recursion_practice'

describe '#range_recursive' do
  it 'returns an empty array when end is less than start' do
    expect(range_recursive(2,1)).to eq([])
  end

  it 'calls itself recursively' do
    expect(self).to receive(:range_recursive).at_least(:twice).and_call_original
    range_recursive(1,5)
  end

  it 'returns the correct array of numbers' do
    expect(range_recursive(1,5)).to eq([1,2,3,4])
  end
end

describe '#exponentiation_one' do
  it 'returns 1 when power is 0' do
    expect(exponentiation_one(2,0)).to eq(1)
  end

  it 'calls itself recursively' do
    expect(self).to receive(:exponentiation_one).at_least(:twice).and_call_original
    exponentiation_one(2,5)
  end

  it 'correctly exponentiates positive numbers' do
    expect(exponentiation_one(2,5)).to eq(32)
  end
end

describe '#exponentiation_two' do
  it 'returns 1 when power is 0' do
    expect(exponentiation_two(2,0)).to eq(1)
  end

  it 'calls itself recursively' do
    expect(self).to receive(:exponentiation_two).at_least(:twice).and_call_original
    exponentiation_two(2,6)
  end

  it 'correctly exponentiates positive numbers' do
    expect(exponentiation_two(2,5)).to eq(32)
  end
end

describe '#deep_dup' do
  let(:arr) { [1, 2, 3, 4] }
  let(:nested_arr) { [1, 2, 3, [1, 2, [3]], [[[2]]] ]}

  it 'returns a copy of a flat array' do
    expect(arr.deep_dup).to eq([1, 2, 3, 4])
  end

  it 'returns a copy of a nested array' do
    expect(nested_arr.deep_dup).to eq([1, 2, 3, [1, 2, [3]], [[[2]]] ])
  end

  it 'creates a deep copy of a nested array' do
    copy = nested_arr.deep_dup
    nested_arr[3] << 3
    expect(copy).not_to eq(nested_arr)
  end

  it 'returns empty array when given an empty array' do
    expect([].deep_dup).to eq([])
  end
end
