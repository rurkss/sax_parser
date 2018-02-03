defmodule Amazon.ItemSearch do

  alias Amazon.ItemSearch
  alias Amazon.Item

  def parse_xml do
    result = :file.read_file("test/xml_feed.xml")
    {:ok, body} = result
    :erlsom.simple_form(body)
  end

  def parse_sax_xml do
    result = :file.read_file("test/xml_feed.xml")
    {:ok, body} = result
    :erlsom.parse_sax(body, [], &ItemSearch.attr/2)
    {:ok, {}, []}
  end

  def attr({:startElement, _url, 'Items', _, _}, acc) do
    [%Item{} | acc]
  end

  def attr({:startElement, _url, attr, _, _}, [hd | tail]) do
    hd = %{hd | pointer: _pointer(attr)}
    [hd | tail]
  end

  def attr({:characters, _value}, []), do: []

  def attr({:characters, value}, [hd | tail]) do

    %{pointer: pointer} = hd

    hd = case pointer do
      nil -> hd
      _ -> Map.put(hd, pointer, value)
    end

    [hd | tail]
  end

  def attr(_el, acc), do: acc

  defp _pointer('ASIN'), do: :sku
  defp _pointer('Brand'), do: :brand
  defp _pointer('Amount'), do: :price
  defp _pointer('CurrencyCode'), do: :currency
  defp _pointer('Title'), do: :title
  defp _pointer('DetailPageURL'), do: :buyurl
  defp _pointer(attr), do: nil
end
