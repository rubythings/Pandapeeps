require File.dirname(__FILE__) + '/../spec_helper'

describe PeopleController do
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Factory(:person)
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Person.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Person.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(person_url(assigns[:person]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Factory(:person)
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Person.any_instance.stubs(:update_attributes).returns(false)
    put :update, :id => Factory(:person)
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Person.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Factory(:person)
    response.should redirect_to(person_url(assigns[:person]))
  end

  it "destroy action should destroy model and redirect to index action" do
    person = Factory(:person, :name => 'fred')
    delete :destroy, :id => person
    response.should redirect_to(people_url)
    Person.exists?(:conditions =>{:name => 'fred'}).should be_false
  end
end
