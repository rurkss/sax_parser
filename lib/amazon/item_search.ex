defmodule Amazon.ItemSearch do

  def parse_xml do
    #%HTTPoison.Response{body: body} = HTTPoison.get!(url)
    result = :file.read_file("test/xml_feed.xml")
    {:ok, body} = result
    :erlsom.simple_form(body)
  end
end