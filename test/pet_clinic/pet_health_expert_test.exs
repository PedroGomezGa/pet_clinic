defmodule PetClinic.PetHealthExpertTest do
  use PetClinic.DataCase

  alias PetClinic.PetHealthExpert

  describe "veterinarians" do
    alias PetClinic.PetHealthExpert.Veterinarian

    import PetClinic.PetHealthExpertFixtures

    @invalid_attrs %{age: nil, email: nil, name: nil, sex: nil, specialities: nil}

    test "list_veterinarians/0 returns all veterinarians" do
      veterinarian = veterinarian_fixture()
      assert PetHealthExpert.list_veterinarians() == [veterinarian]
    end

    test "get_veterinarian!/1 returns the veterinarian with given id" do
      veterinarian = veterinarian_fixture()
      assert PetHealthExpert.get_veterinarian!(veterinarian.id) == veterinarian
    end

    test "create_veterinarian/1 with valid data creates a veterinarian" do
      valid_attrs = %{age: 42, email: "some email", name: "some name", sex: "some sex", specialities: "some specialities"}

      assert {:ok, %Veterinarian{} = veterinarian} = PetHealthExpert.create_veterinarian(valid_attrs)
      assert veterinarian.age == 42
      assert veterinarian.email == "some email"
      assert veterinarian.name == "some name"
      assert veterinarian.sex == "some sex"
      assert veterinarian.specialities == "some specialities"
    end

    test "create_veterinarian/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PetHealthExpert.create_veterinarian(@invalid_attrs)
    end

    test "update_veterinarian/2 with valid data updates the veterinarian" do
      veterinarian = veterinarian_fixture()
      update_attrs = %{age: 43, email: "some updated email", name: "some updated name", sex: "some updated sex", specialities: "some updated specialities"}

      assert {:ok, %Veterinarian{} = veterinarian} = PetHealthExpert.update_veterinarian(veterinarian, update_attrs)
      assert veterinarian.age == 43
      assert veterinarian.email == "some updated email"
      assert veterinarian.name == "some updated name"
      assert veterinarian.sex == "some updated sex"
      assert veterinarian.specialities == "some updated specialities"
    end

    test "update_veterinarian/2 with invalid data returns error changeset" do
      veterinarian = veterinarian_fixture()
      assert {:error, %Ecto.Changeset{}} = PetHealthExpert.update_veterinarian(veterinarian, @invalid_attrs)
      assert veterinarian == PetHealthExpert.get_veterinarian!(veterinarian.id)
    end

    test "delete_veterinarian/1 deletes the veterinarian" do
      veterinarian = veterinarian_fixture()
      assert {:ok, %Veterinarian{}} = PetHealthExpert.delete_veterinarian(veterinarian)
      assert_raise Ecto.NoResultsError, fn -> PetHealthExpert.get_veterinarian!(veterinarian.id) end
    end

    test "change_veterinarian/1 returns a veterinarian changeset" do
      veterinarian = veterinarian_fixture()
      assert %Ecto.Changeset{} = PetHealthExpert.change_veterinarian(veterinarian)
    end
  end
end
