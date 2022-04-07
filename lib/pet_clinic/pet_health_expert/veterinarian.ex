defmodule PetClinic.PetHealthExpert.Veterinarian do
  use Ecto.Schema
  import Ecto.Changeset

  schema "veterinarians" do
    field :age, :integer
    field :email, :string
    field :name, :string
    field :sex, :string
    field :specialities, :string

    timestamps()
  end

  @doc false
  def changeset(veterinarian, attrs) do
    veterinarian
    |> cast(attrs, [:name, :age, :email, :specialities, :sex])
    |> validate_required([:name, :age, :email, :specialities, :sex])
  end
end
