require File.dirname(__FILE__) + '/../spec_helper'

describe CommentsController do
  render_views
  include Devise::TestHelpers


  it "index action should render index template" do
    get :index, :article_id => Factory(:article)
    response.should render_template(:index)
  end

  it "show action should render show template" do
    article = Factory(:article)
    get  :show, :article_id => article, :id => article.comments.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    @user = Factory.create(:user)
    sign_in @user
    get :new, :article_id => Factory(:article)
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    @user = Factory.create(:user)
    article = Factory(:article)
    sign_in @user
    post :create, :article_id=>article, :comment=>{}
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    article = Factory(:article)
    @user = Factory.create(:user)
    sign_in @user
    post :create, :article_id=>article,  :comment=>{:body=>'test'}
    response.should redirect_to(article_url(assigns[:article]))
  end

  it "edit action should render edit template" do
    @user = Factory.create(:user)
    article = Factory(:article)
    sign_in @user
    get :edit, :article_id=>article, :id=>article.comments.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    article = Factory(:article)
    @user = Factory.create(:user)
    sign_in @user
    Comment.any_instance.stubs(:update_attributes).returns(false)
    put :update, :article_id => article, :id => article.comments.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    article = Factory(:article)
    @user = Factory.create(:user)
    sign_in @user
    Comment.any_instance.stubs(:update_attributes).returns(true)
    put :update, :article_id => article, :id => article.comments.first
    response.should redirect_to(article_comment_url(assigns[:article], assigns[:comment]))
  end

  it "destroy action should destroy model and redirect to index action" do
    article = Factory(:article)
    @user = Factory.create(:user)
    sign_in @user    
    delete :destroy, :article_id => article, :id => article.comments.first
    response.should redirect_to(article_comments_url(assigns[:article]))
    assigns[:article].comments.should == []
  end
end
