require File.dirname(__FILE__) + '/../spec_helper'

describe PandasController do
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Factory(:panda)
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Panda.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Panda.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(panda_url(assigns[:panda]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Factory(:panda)
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Panda.any_instance.stubs(:update_attributes).returns(false)
    put :update, :id => Factory(:panda).id
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Panda.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Factory(:panda)
    response.should redirect_to(panda_url(assigns[:panda]))
  end

  it "destroy action should destroy model and redirect to index action" do
    panda = Factory(:panda, :name=>'pan')
    delete :destroy, :id => panda
    response.should redirect_to(pandas_url)
    Panda.exists?(:conditions=>{:name => 'pan'}).should be_false
  end
end
