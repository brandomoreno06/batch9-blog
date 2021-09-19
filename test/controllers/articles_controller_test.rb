require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = User.create(username: 'username', first_name: "first", last_name: "last", password: "password", password_confirmation: "password")
    post login_path, params: { username: @user.username, password: @user.password }
    @article = @user.articles.create(name: "Article Name", body: "Article Body", user_id: @user.id)
  end

  test "should get /articles" do
    get articles_path
    assert_response :success, "Failed to get /articles path"
  end

  test "should get /articles/:id" do
    get show_article_path(@article)
    assert_response :success
  end

  test "should get /articles/new" do
    get new_article_path
    assert_response :success, "Failed to get /articles/new path"
  end

  test "should create new article, and redirect" do
    assert_difference "Article.count", 1, "Failed to create a new article" do
    post create_article_path, params: { article: 
                                    { name: "Article Name",
                                      body: "Article Body",
                                      user_id: users(:one).id
                                    }}
    end
    assert_redirected_to articles_path, "Failed to redirect to articles_path after creating an article"
  end

  
  test "should be able to edit an article at /articles/:id/edit" do
    get edit_article_path(@article)
    assert_response :success, "Failed to get edit path"
  end
  
  test "should update an article" do
    patch update_article_path(@article), params: { article:
                                                    { name: "Updated",
                                                      body: "UpdatedUpdated",
                                                      user_id: users(:one).id
                                                    }
                                                  }

    assert_equal "Updated", Article.find_by(id: @article.id).name, "Failed to update an article"
    assert_redirected_to articles_path, "Failed to redirect to articles_path"
  end
  
  test "should delete an article" do
    assert_difference 'Article.count', -1, "Failed to delete article" do
      delete delete_article_path(@article)
    end
  end
end
