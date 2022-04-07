defmodule PetClinic.PetHealthExpert do
  @moduledoc """
  The PetHealthExpert context.
  """

  import Ecto.Query, warn: false
  alias PetClinic.Repo

  alias PetClinic.PetHealthExpert.Veterinarian

  @doc """
  Returns the list of veterinarians.

  ## Examples

      iex> list_veterinarians()
      [%Veterinarian{}, ...]

  """
  def list_veterinarians do
    Repo.all(Veterinarian)
  end

  @doc """
  Gets a single veterinarian.

  Raises `Ecto.NoResultsError` if the Veterinarian does not exist.

  ## Examples

      iex> get_veterinarian!(123)
      %Veterinarian{}

      iex> get_veterinarian!(456)
      ** (Ecto.NoResultsError)

  """
  def get_veterinarian!(id), do: Repo.get!(Veterinarian, id)

  @doc """
  Creates a veterinarian.

  ## Examples

      iex> create_veterinarian(%{field: value})
      {:ok, %Veterinarian{}}

      iex> create_veterinarian(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_veterinarian(attrs \\ %{}) do
    %Veterinarian{}
    |> Veterinarian.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a veterinarian.

  ## Examples

      iex> update_veterinarian(veterinarian, %{field: new_value})
      {:ok, %Veterinarian{}}

      iex> update_veterinarian(veterinarian, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_veterinarian(%Veterinarian{} = veterinarian, attrs) do
    veterinarian
    |> Veterinarian.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a veterinarian.

  ## Examples

      iex> delete_veterinarian(veterinarian)
      {:ok, %Veterinarian{}}

      iex> delete_veterinarian(veterinarian)
      {:error, %Ecto.Changeset{}}

  """
  def delete_veterinarian(%Veterinarian{} = veterinarian) do
    Repo.delete(veterinarian)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking veterinarian changes.

  ## Examples

      iex> change_veterinarian(veterinarian)
      %Ecto.Changeset{data: %Veterinarian{}}

  """
  def change_veterinarian(%Veterinarian{} = veterinarian, attrs \\ %{}) do
    Veterinarian.changeset(veterinarian, attrs)
  end
end
