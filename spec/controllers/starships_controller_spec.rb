require 'rails_helper'

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

RSpec.describe StarshipsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Starship. As you add validations to Starship, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.build(:starship).attributes
  }

  let(:invalid_attributes) {
    FactoryGirl.build(:starship, name: nil).attributes
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StarshipsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all starships as @starships" do
      starship = Starship.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:starships)).to eq([starship])
    end
  end

  describe "GET #show" do
    it "assigns the requested starship as @starship" do
      starship = Starship.create! valid_attributes
      get :show, {:id => starship.to_param}, valid_session
      expect(assigns(:starship)).to eq(starship)
    end
  end

  describe "GET #new" do
    it "assigns a new starship as @starship" do
      get :new, {}, valid_session
      expect(assigns(:starship)).to be_a_new(Starship)
    end
  end

  describe "GET #edit" do
    it "assigns the requested starship as @starship" do
      starship = Starship.create! valid_attributes
      get :edit, {:id => starship.to_param}, valid_session
      expect(assigns(:starship)).to eq(starship)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Starship" do
        expect {
          post :create, {:starship => valid_attributes}, valid_session
        }.to change(Starship, :count).by(1)
      end

      it "assigns a newly created starship as @starship" do
        post :create, {:starship => valid_attributes}, valid_session
        expect(assigns(:starship)).to be_a(Starship)
        expect(assigns(:starship)).to be_persisted
      end

      it "redirects to the created starship" do
        post :create, {:starship => valid_attributes}, valid_session
        expect(response).to redirect_to(Starship.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved starship as @starship" do
        post :create, {:starship => invalid_attributes}, valid_session
        expect(assigns(:starship)).to be_a_new(Starship)
      end

      it "re-renders the 'new' template" do
        post :create, {:starship => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {   name: "Renegade" }
      }

      it "updates the requested starship" do
        starship = Starship.create! valid_attributes
        put :update, {:id => starship.to_param, :starship => new_attributes}, valid_session
        starship.reload
        new_attributes.each_pair do |key, value|
          expect(starship[key]).to eq(value)
        end
      end

      it "assigns the requested starship as @starship" do
        starship = Starship.create! valid_attributes
        put :update, {:id => starship.to_param, :starship => valid_attributes}, valid_session
        expect(assigns(:starship)).to eq(starship)
      end

      it "redirects to the starship" do
        starship = Starship.create! valid_attributes
        put :update, {:id => starship.to_param, :starship => valid_attributes}, valid_session
        expect(response).to redirect_to(starship)
      end
    end

    context "with invalid params" do
      it "assigns the starship as @starship" do
        starship = Starship.create! valid_attributes
        put :update, {:id => starship.to_param, :starship => invalid_attributes}, valid_session
        expect(assigns(:starship)).to eq(starship)
      end

      it "re-renders the 'edit' template" do
        starship = Starship.create! valid_attributes
        put :update, {:id => starship.to_param, :starship => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested starship" do
      starship = Starship.create! valid_attributes
      expect {
        delete :destroy, {:id => starship.to_param}, valid_session
      }.to change(Starship, :count).by(-1)
    end

    it "redirects to the starships list" do
      starship = Starship.create! valid_attributes
      delete :destroy, {:id => starship.to_param}, valid_session
      expect(response).to redirect_to(starships_url)
    end
  end

  describe 'GET #create_your_own_starship' do
    before { get :create_your_own_starship }

           it { should redirect_to(new_starship_path) }
           it { should redirect_to(action: :new) }
    end

end
