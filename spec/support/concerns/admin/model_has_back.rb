shared_examples_for "model with admin" do

  def fill_record options
    fill_in I18n.t("activerecord.attributes.#{model_class.name.underscore}.#{model_name_attribute}"), :with => options[:name]
  end

  let(:new_link) { I18n.t("refinery.slideshow.admin.#{i18n_plural_key}.actions.create_new") }
  let(:edit_link) { I18n.t("refinery.slideshow.admin.#{i18n_plural_key}.#{i18n_plural_key.singularize}.edit") }
  let(:delete_link) { I18n.t("refinery.slideshow.admin.#{i18n_plural_key}.#{i18n_plural_key.singularize}.delete") }

  before do
    password = '123456'
    refinery_user = FactoryGirl.create(:refinery_superuser, {
      :username => "refinerycms",
      :password => password,
      :password_confirmation => password,
      :email => "refinerycms@refinerycms.com"
    })

    visit refinery.new_refinery_user_session_path

    fill_in I18n.t("activerecord.attributes.refinery/user.login"), :with => refinery_user.username
    fill_in I18n.t("activerecord.attributes.refinery/user.password"), :with => password

    click_button I18n.t("refinery.sessions.new.sign_in")
  end

  describe "index" do
    before do
      objects
    end

    let(:objects) { create_list model_factory, 2 }

    it "shows two items" do
      visit admin_index_path
      objects.each do |object|
        page.should have_content(object.send(model_name_attribute))
      end

    end

  end

  describe "create" do
    before do
      visit admin_index_path

      click_link new_link
    end

    context "valid data" do
      it "should succeed" do

        fill_record name: 'This is a test of the first string field'
        click_button I18n.t("refinery.admin.form_actions.save")

        page.should have_content(I18n.t("refinery.crudify.created", what: "'This is a test of the first string field'"))

        model_class.count.should == 1
      end
    end

    context "invalid data" do
      it "should fail" do
        click_button I18n.t("refinery.admin.form_actions.save")

        page.should have_content(I18n.t('errors.messages.blank'))
        model_class.count.should == 0
      end
    end

  end

  describe "edit" do
    let(:model_object) { FactoryGirl.create(model_factory, model_name_attribute => "A name") }
    before do
      model_object
    end

    it "should succeed" do
      visit admin_index_path

      within ".actions" do
        click_link edit_link
      end

      fill_record name: "A different name"
      click_button I18n.t("refinery.admin.form_actions.save")

      page.should have_content(I18n.t("refinery.crudify.updated", what: "'A different name'"))
      page.should have_no_content("A name")
    end

  end

  describe "destroy" do
    before { FactoryGirl.create(model_factory, model_name_attribute => "UniqueTitleOne") }

    it "should succeed" do
      visit admin_index_path

      click_link delete_link

      page.should have_content(I18n.t("refinery.crudify.destroyed", what: "'UniqueTitleOne'"))
      model_class.count.should == 0
    end
  end

end
