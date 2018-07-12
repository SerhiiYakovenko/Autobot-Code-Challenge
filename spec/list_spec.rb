require_relative '../codebase/question_2'

describe ArrayList do
  let(:random_array) { Array.new(rand(3..5)) {Array.new(4) { rand(1...9) } } }
  let(:random_target) { rand(1..9)}

  context '> On methods availability' do
    it ' - ArrayList is respond to .new' do
      expect(ArrayList).to respond_to(:new)
    end
    it ' - Object form ArrayList is respond to .find_array_by_target' do
      expect(subject).to respond_to(:find_array_by_target)
    end
  end
  context '> On passing arguments to class initialize' do
    context '> When target argument for class is nil' do
      subject(:nil_target) { ArrayList.new(random_array, nil) }
      it '- find method returns nil' do
        expect(nil_target.find_array_by_target).to be_nil
      end
      it '- no output was diplayed' do
        expect { nil_target.find_array_by_target }.not_to output.to_stdout
      end
    end
    context '> When list argument for class is nil' do
      subject(:nil_array_list) { ArrayList.new(nil, random_target) }
      it '- find method returns nil' do
        expect(nil_array_list.find_array_by_target).to be_nil
      end
      it '- no output was diplayed' do
        expect { nil_array_list.find_array_by_target }.not_to output.to_stdout
      end
    end
  end
end