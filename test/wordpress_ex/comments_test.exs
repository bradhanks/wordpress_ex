defmodule WordpressEx.CommentsTest do
  use ExUnit.Case

  describe "list" do
    test "returns a list of categories" do
      {:ok, [comment | comments]} = WordpressEx.Comments.list()
      assert Enum.empty?(comments)
      assert comment.content.rendered == "<p>Hi, this is a comment</p>"
    end
  end

  describe "find" do
    test "returns found category" do
      {:ok, comment = %WordpressEx.Model.Comment{}} = WordpressEx.Comments.find(123)
      assert comment.content.rendered == "<p>Hello Comment</p>"
    end
  end
end
