require_relative '../codebase/question_2'

describe ArrayList do
  let(:random_array) { Array.new(rand(3..5)) { Array.new(4) { rand(1...9) } } }
  let(:random_target) { rand(1..9) }

  context '> On methods availability' do
    it ' - ArrayList is respond to .new' do
      expect(ArrayList).to respond_to(:new)
    end
    it ' - Object form ArrayList is respond to .find_array_by_target' do
      expect(ArrayList.new(random_array)).to respond_to(:find_array_by_target)
    end
  end

  context '> On passing arguments' do

    context '> When target argument for class is not nil and present in array' do
      subject(:not_nil_target) { ArrayList.new(random_array, random_array.sample.sample ) }
      it '- find method does\'nt returns nil' do
        expect(not_nil_target.find_array_by_target).not_to be_nil
      end
      it '- output was diplayed' do
        expect { not_nil_target.find_array_by_target }.to output.to_stdout
      end
    end

    context '> When target argument for method is not nil and present in array' do
      subject(:not_nil_target) { ArrayList.new(random_array) }
      it '- find method does\'nt returns nil' do
        expect(not_nil_target.find_array_by_target(random_array.sample.sample)).not_to be_nil
      end
      it '- output was diplayed' do
        expect { not_nil_target.find_array_by_target(random_array.sample.sample) }.to output.to_stdout
      end
    end

    context '> For target argument' do
      context '> When target argument for class is nil' do
        subject(:nil_target) { ArrayList.new(random_array, nil) }
        it '- find method returns nil' do
          expect(nil_target.find_array_by_target).to be_nil
        end
        it '- no output was diplayed' do
          expect { nil_target.find_array_by_target }.not_to output.to_stdout
        end
      end

      context '> When target argument for method is nil' do
        subject(:nil_target) { ArrayList.new(random_array) }
        it '- find method returns nil' do
          expect(nil_target.find_array_by_target(nil)).to be_nil
        end
        it '- no output was diplayed' do
          expect { nil_target.find_array_by_target(nil) }.not_to output.to_stdout
        end
      end
    end

    context '> For list argument' do
      context '> When list is nil' do
        subject(:nil_list) { ArrayList.new(nil) }
        it '- Argument error appears' do
          expect { nil_list }.to raise_error(ArgumentError)
        end
      end

      context '> When array in list is not iterable' do
        subject(:nil_list) { ArrayList.new((0...10).map { ('a'..'z').to_a[rand(26)] }.join, random_target) }
        it '- Argument error appears' do
          expect { nil_list.find_array_by_target }.to raise_error(ArgumentError)
        end
      end
    end
  end
end