require "test_helper"

class ArticleTest < ActiveSupport::TestCase

  test "should save a new article" do
    article = Article.new
    article.name = "Article Name"
    article.body = "Article Body"
    article.user_id = users(:one).id

    assert article.save, "Could not save a new article"
  end

  test "should not save an article witout a name" do
    article = Article.new
    article.body = "Article Body"

    assert_not article.save, "Article has been saved without a name"
  end

  test "should not save an article without a body" do
    article = Article.new
    article.name = "Article Name"

    assert_not article.save, "Article has been saved without a body"
  end
end
