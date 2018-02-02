defmodule AmazonItemSearchTest do
  use ExUnit.Case
  doctest AmazonItemSearch

  test "parse xml by erlsom" do
    assert {:ok, _element, _tail} = Amazon.ItemSearch.parse_xml()
  end
end
