require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe EditablesController do

  # This should return the minimal set of attributes required to create a valid
  # Editable. As you add validations to Editable, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "name" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EditablesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all editables as @editables" do
      editable = Editable.create! valid_attributes
      get :index, {}, valid_session
      assigns(:editables).should eq([editable])
    end
  end

  describe "GET show" do
    it "assigns the requested editable as @editable" do
      editable = Editable.create! valid_attributes
      get :show, {:id => editable.to_param}, valid_session
      assigns(:editable).should eq(editable)
    end
  end

  describe "GET new" do
    it "assigns a new editable as @editable" do
      get :new, {}, valid_session
      assigns(:editable).should be_a_new(Editable)
    end
  end

  describe "GET edit" do
    it "assigns the requested editable as @editable" do
      editable = Editable.create! valid_attributes
      get :edit, {:id => editable.to_param}, valid_session
      assigns(:editable).should eq(editable)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Editable" do
        expect {
          post :create, {:editable => valid_attributes}, valid_session
        }.to change(Editable, :count).by(1)
      end

      it "assigns a newly created editable as @editable" do
        post :create, {:editable => valid_attributes}, valid_session
        assigns(:editable).should be_a(Editable)
        assigns(:editable).should be_persisted
      end

      it "redirects to the created editable" do
        post :create, {:editable => valid_attributes}, valid_session
        response.should redirect_to(Editable.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved editable as @editable" do
        # Trigger the behavior that occurs when invalid params are submitted
        Editable.any_instance.stub(:save).and_return(false)
        post :create, {:editable => { "name" => "invalid value" }}, valid_session
        assigns(:editable).should be_a_new(Editable)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Editable.any_instance.stub(:save).and_return(false)
        post :create, {:editable => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested editable" do
        editable = Editable.create! valid_attributes
        # Assuming there are no other editables in the database, this
        # specifies that the Editable created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Editable.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => editable.to_param, :editable => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested editable as @editable" do
        editable = Editable.create! valid_attributes
        put :update, {:id => editable.to_param, :editable => valid_attributes}, valid_session
        assigns(:editable).should eq(editable)
      end

      it "redirects to the editable" do
        editable = Editable.create! valid_attributes
        put :update, {:id => editable.to_param, :editable => valid_attributes}, valid_session
        response.should redirect_to(editable)
      end
    end

    describe "with invalid params" do
      it "assigns the editable as @editable" do
        editable = Editable.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Editable.any_instance.stub(:save).and_return(false)
        put :update, {:id => editable.to_param, :editable => { "name" => "invalid value" }}, valid_session
        assigns(:editable).should eq(editable)
      end

      it "re-renders the 'edit' template" do
        editable = Editable.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Editable.any_instance.stub(:save).and_return(false)
        put :update, {:id => editable.to_param, :editable => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested editable" do
      editable = Editable.create! valid_attributes
      expect {
        delete :destroy, {:id => editable.to_param}, valid_session
      }.to change(Editable, :count).by(-1)
    end

    it "redirects to the editables list" do
      editable = Editable.create! valid_attributes
      delete :destroy, {:id => editable.to_param}, valid_session
      response.should redirect_to(editables_url)
    end
  end

end
