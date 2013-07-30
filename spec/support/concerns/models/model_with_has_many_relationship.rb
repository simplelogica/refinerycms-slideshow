shared_examples_for "model with has many relationship" do |model_name, related_model_factory, has_many_relationship, belongs_to_relationship|

  context "when creating various #{has_many_relationship}" do

    let(:model_object) { create model_name }
    let(:related_object_1)  { create related_model_factory, belongs_to_relationship => model_object }
    let(:related_object_2)  { create related_model_factory, belongs_to_relationship => model_object }

    before do
      related_object_1 && related_object_2
    end

    subject { model_object }

    its(has_many_relationship) { should match_array [related_object_1, related_object_2] }

    context "related #{has_many_relationship}" do

      subject { related_object_1 }

      its(belongs_to_relationship) { should eq model_object }

    end

    context "related #{has_many_relationship}" do

      subject { related_object_2 }

      its(belongs_to_relationship) { should eq model_object }

    end

  end

end
