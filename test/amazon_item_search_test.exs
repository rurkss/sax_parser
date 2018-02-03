defmodule AmazonItemSearchTest do
  use ExUnit.Case
  doctest AmazonItemSearch

  # test "parse xml by erlsom. simple form" do
  #   assert {:ok, _element, _tail} = Amazon.ItemSearch.parse_xml()
  # end

  test "parse xml by erlsom. sax parser" do
    assert {:ok, _element, _tail} = Amazon.ItemSearch.parse_sax_xml()
  end

end
