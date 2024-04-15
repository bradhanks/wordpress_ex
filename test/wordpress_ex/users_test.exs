defmodule WordpressEx.UsersTest do
  use ExUnit.Case

  describe "list" do
    test "returns all users" do
      {:ok, [user | users]} = WordpressEx.Users.list()
      assert Enum.empty?(users)
      assert user.name == "Human Made"
    end
  end

  describe "find" do
    test "returns found user" do
      {:ok, user} = WordpressEx.Users.find(1)
      assert user.name == "Human Made"
    end
  end
end
