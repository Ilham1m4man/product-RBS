defmodule ProductWeb.ErrorJSONTest do
  use ProductWeb.ConnCase, async: true

  test "renders 404" do
    assert ProductWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert ProductWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
