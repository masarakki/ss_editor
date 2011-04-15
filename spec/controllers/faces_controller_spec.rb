require 'spec_helper'

describe FacesController do
  before do
    Character.stub(:find).with("1") { mock_character }
  end

  describe "GET index" do
    it "assigns all faces as @faces" do
      Face.stub(:all) { [mock_face] }
      get :index, :character_id => "1"
      assigns(:faces).should eq([mock_face])
    end
  end

  describe "GET show" do
    it "assigns the requested face as @face" do
      Face.stub(:find).with("37") { mock_face }
      get :show, :id => "37", :character_id => "1"
      assigns(:face).should be(mock_face)
    end
  end

  describe "GET new" do
    it "assigns a new face as @face" do
      Face.stub(:new) { mock_face }
      get :new, :character_id => "1"
      assigns(:face).should be(mock_face)
    end
  end

  describe "GET edit" do
    it "assigns the requested face as @face" do
      Face.stub(:find).with("37") { mock_face }
      get :edit, :id => "37", :character_id => "1"
      assigns(:face).should be(mock_face)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created face as @face" do
        Face.stub(:new).with({'these' => 'params'}) { mock_face(:save => true) }
        post :create, :face => {'these' => 'params'}, :character_id => "1"
        assigns(:face).should be(mock_face)
      end

      it "redirects to the created face" do
        Face.stub(:new) { mock_face(:save => true) }
        post :create, :face => {}, :character_id => "1"
        response.should redirect_to(character_face_url(mock_character, mock_face))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved face as @face" do
        Face.stub(:new).with({'these' => 'params'}) { mock_face(:save => false) }
        post :create, :face => {'these' => 'params'}, :character_id => "1"
        assigns(:face).should be(mock_face)
      end

      it "re-renders the 'new' template" do
        Face.stub(:new) { mock_face(:save => false) }
        post :create, :face => {}, :character_id => "1"
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested face" do
        Face.stub(:find).with("37") { mock_face }
        mock_face.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :face => {'these' => 'params'}, :character_id => "1"
      end

      it "assigns the requested face as @face" do
        Face.stub(:find) { mock_face(:update_attributes => true) }
        put :update, :id => "1", :character_id => "1"
        assigns(:face).should be(mock_face)
      end

      it "redirects to the face" do
        Face.stub(:find) { mock_face(:update_attributes => true) }
        put :update, :id => "1", :character_id => "1"
        response.should redirect_to(character_face_url(mock_character, mock_face))
      end
    end

    describe "with invalid params" do
      it "assigns the face as @face" do
        Face.stub(:find) { mock_face(:update_attributes => false) }
        put :update, :id => "1", :character_id => "1"
        assigns(:face).should be(mock_face)
      end

      it "re-renders the 'edit' template" do
        Face.stub(:find) { mock_face(:update_attributes => false) }
        put :update, :id => "1", :character_id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested face" do
      Face.stub(:find).with("37") { mock_face }
      mock_face.should_receive(:destroy)
      delete :destroy, :id => "37", :character_id => "1"
    end

    it "redirects to the faces list" do
      Face.stub(:find) { mock_face }
      delete :destroy, :id => "1", :character_id => "1"
      response.should redirect_to(character_faces_url(mock_character))
    end
  end
end
