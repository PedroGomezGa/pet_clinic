defmodule PetClinicWeb.VeterinarianController do
  use PetClinicWeb, :controller

  alias PetClinic.PetHealthExpert
  alias PetClinic.PetHealthExpert.Veterinarian

  def index(conn, _params) do
    veterinarians = PetHealthExpert.list_veterinarians()
    render(conn, "index.html", veterinarians: veterinarians)
  end

  def new(conn, _params) do
    changeset = PetHealthExpert.change_veterinarian(%Veterinarian{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"veterinarian" => veterinarian_params}) do
    case PetHealthExpert.create_veterinarian(veterinarian_params) do
      {:ok, veterinarian} ->
        conn
        |> put_flash(:info, "Veterinarian created successfully.")
        |> redirect(to: Routes.veterinarian_path(conn, :show, veterinarian))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    veterinarian = PetHealthExpert.get_veterinarian!(id)
    render(conn, "show.html", veterinarian: veterinarian)
  end

  def edit(conn, %{"id" => id}) do
    veterinarian = PetHealthExpert.get_veterinarian!(id)
    changeset = PetHealthExpert.change_veterinarian(veterinarian)
    render(conn, "edit.html", veterinarian: veterinarian, changeset: changeset)
  end

  def update(conn, %{"id" => id, "veterinarian" => veterinarian_params}) do
    veterinarian = PetHealthExpert.get_veterinarian!(id)

    case PetHealthExpert.update_veterinarian(veterinarian, veterinarian_params) do
      {:ok, veterinarian} ->
        conn
        |> put_flash(:info, "Veterinarian updated successfully.")
        |> redirect(to: Routes.veterinarian_path(conn, :show, veterinarian))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", veterinarian: veterinarian, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    veterinarian = PetHealthExpert.get_veterinarian!(id)
    {:ok, _veterinarian} = PetHealthExpert.delete_veterinarian(veterinarian)

    conn
    |> put_flash(:info, "Veterinarian deleted successfully.")
    |> redirect(to: Routes.veterinarian_path(conn, :index))
  end
end
