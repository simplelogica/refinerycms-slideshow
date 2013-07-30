shared_examples_for "model with attributes" do |model_name|

  context "validations" do

    context "with valid values" do

      let(:attributes) { attributes_for model_name }
      let(:model_object) { build model_name, attributes }

      subject { model_object }

      it { should be_valid }
      its(:errors) { should be_blank }

      context "after save" do
        before { model_object.save }
        subject { model_object.class.first(order: "id DESC") }

        FactoryGirl.attributes_for(model_name).keys.each do |attribute_name|
          its(attribute_name) { should eq attributes[attribute_name] }
        end
      end
    end
  end

end
