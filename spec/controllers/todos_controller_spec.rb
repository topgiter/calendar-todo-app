require 'rails_helper'

RSpec.describe TodosController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Todo. As you add validations to Todo, be sure to
  # adjust the attributes here as well.
  
  let(:valid_attributes) {
    {title: 'first todo', description: 'sample test todo', status: "active"} 
    
  }

  let(:invalid_attributes) {
    {title: '', description: 'sample test todo', status: "active"} 
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TodosController. Be sure to keep this updated too.
  let(:valid_session) { 
    {authorization: {"access_token"=>"ya29.GltSBgEZ_fgjh4PSVidullxU8GhPHnkzmgWnRltvLGrg5aHgIyOqOdlV69NJYxHUjoNNop6-aySaw6rJDS133DLn-zHXCCGf-rMkjS-hAIEbIFseS4LzR-Y3qPxu", "expires_in"=>3600, "refresh_token"=>"1/JeMZk5ftmo7kJEVf0-AdlOVSrZSI5aHAfWC7RHBYcFQ", "scope"=>"https://www.googleapis.com/auth/calendar", "token_type"=>"Bearer"}} 
    
  }

  describe "GET index" do
    it "assigns all todos as @todos" do
      todo = Todo.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:todos)).to eq([todo])
    end
  end

  describe "GET show" do
    it "assigns the requested todo as @todo" do
      todo = Todo.create! valid_attributes
      get :show, {:id => todo.to_param}, valid_session
      expect(assigns(:todo)).to eq(todo)
    end
  end

  describe "GET new" do
    it "assigns a new todo as @todo" do
      get :new, {}, valid_session
      expect(assigns(:todo)).to be_a_new(Todo)
    end
  end

  describe "GET edit" do
    it "assigns the requested todo as @todo" do
      todo = Todo.create! valid_attributes
      get :edit, {:id => todo.to_param}, valid_session
      expect(assigns(:todo)).to eq(todo)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Todo" do
        expect {
          post :create, {:todo => valid_attributes}, valid_session
        }.to change(Todo, :count).by(1)
      end

      it "assigns a newly created todo as @todo" do
        post :create, {:todo => valid_attributes}, valid_session
        expect(assigns(:todo)).to be_a(Todo)
        expect(assigns(:todo)).to be_persisted
      end

      it "redirects to the created todo" do
        post :create, {:todo => valid_attributes}, valid_session
        expect(response).to redirect_to(Todo.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved todo as @todo" do
        post :create, {:todo => invalid_attributes}, valid_session
        expect(assigns(:todo)).to be_a_new(Todo)
      end

      it "re-renders the 'new' template" do
        post :create, {:todo => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {title: 'first todo', description: 'sample test todo', status: "active"} 
      }

      it "updates the requested todo" do
        todo = Todo.create! valid_attributes
        put :update, {:id => todo.to_param, :todo => new_attributes}, valid_session
        todo.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested todo as @todo" do
        todo = Todo.create! valid_attributes
        put :update, {:id => todo.to_param, :todo => valid_attributes}, valid_session
        expect(assigns(:todo)).to eq(todo)
      end

      it "redirects to the todo" do
        todo = Todo.create! valid_attributes
        put :update, {:id => todo.to_param, :todo => valid_attributes}, valid_session
        expect(response).to redirect_to(todo)
      end
    end

    describe "with invalid params" do
      it "assigns the todo as @todo" do
        todo = Todo.create! valid_attributes
        put :update, {:id => todo.to_param, :todo => invalid_attributes}, valid_session
        expect(assigns(:todo)).to eq(todo)
      end

      it "re-renders the 'edit' template" do
        todo = Todo.create! valid_attributes
        put :update, {:id => todo.to_param, :todo => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested todo" do
      todo = Todo.create! valid_attributes
      expect {
        delete :destroy, {:id => todo.to_param}, valid_session
      }.to change(Todo, :count).by(-1)
    end

    it "redirects to the todos list" do
      todo = Todo.create! valid_attributes
      delete :destroy, {:id => todo.to_param}, valid_session
      expect(response).to redirect_to(todos_url)
    end
  end

end
