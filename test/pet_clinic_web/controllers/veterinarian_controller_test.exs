defmodule PetClinicWeb.VeterinarianControllerTest do
  use PetClinicWeb.ConnCase

  import PetClinic.PetHealthExpertFixtures

  @create_attrs %{age: 42, email: "some email", name: "some name", sex: "some sex", specialities: "some specialities"}
  @update_attrs %{age: 43, email: "some updated email", name: "some updated name", sex: "some updated sex", specialities: "some updated specialities"}
  @invalid_attrs %{age: nil, email: nil, name: nil, sex: nil, specialities: nil}

  describe "index" do
    test "lists all veterinarians", %{conn: conn} do
      conn = get(conn, Routes.veterinarian_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Veterinarians"
    end
  end

  describe "new veterinarian" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.veterinarian_path(conn, :new))
      assert html_response(conn, 200) =~ "New Veterinarian"
    end
  end

  describe "create veterinarian" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.veterinarian_path(conn, :create), veterinarian: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.veterinarian_path(conn, :show, id)

      conn = get(conn, Routes.veterinarian_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Veterinarian"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.veterinarian_path(conn, :create), veterinarian: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Veterinarian"
    end
  end

  describe "edit veterinarian" do
    setup [:create_veterinarian]

    test "renders form for editing chosen veterinarian", %{conn: conn, veterinarian: veterinarian} do
      conn = get(conn, Routes.veterinarian_path(conn, :edit, veterinarian))
      assert html_response(conn, 200) =~ "Edit Veterinarian"
    end
  end

  describe "update veterinarian" do
    setup [:create_veterinarian]

    test "redirects when data is valid", %{conn: conn, veterinarian: veterinarian} do
      conn = put(conn, Routes.veterinarian_path(conn, :update, veterinarian), veterinarian: @update_attrs)
      assert redirected_to(conn) == Routes.veterinarian_path(conn, :show, veterinarian)

      conn = get(conn, Routes.veterinarian_path(conn, :show, veterinarian))
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, veterinarian: veterinarian} do
      conn = put(conn, Routes.veterinarian_path(conn, :update, veterinarian), veterinarian: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Veterinarian"
    end
  end

  describe "delete veterinarian" do
    setup [:create_veterinarian]

    test "deletes chosen veterinarian", %{conn: conn, veterinarian: veterinarian} do
      conn = delete(conn, Routes.veterinarian_path(conn, :delete, veterinarian))
      assert redirected_to(conn) == Routes.veterinarian_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.veterinarian_path(conn, :show, veterinarian))
      end
    end
  end

  defp create_veterinarian(_) do
    veterinarian = veterinarian_fixture()
    %{veterinarian: veterinarian}
  end
end
